# Build first: bundle exec jekyll build
# Audit the generated pages and assets with Ruby's standard library.
require 'json'
require 'uri'
require 'yaml'
require 'rexml/document'

root = File.expand_path('..', __dir__)
output = File.join(root, '_site')
errors = []
pages = Dir.glob('**/*.html', base: output).map { |path| File.join(output, path) }
abort 'No built HTML found. Run bundle exec jekyll build first.' if pages.empty?

def local_file(output, path)
  clean = URI::DEFAULT_PARSER.unescape(path)
  target = File.expand_path(clean.sub(%r{\A/}, ''), output)
  target = File.join(target, 'index.html') if File.directory?(target)
  target
end

pages.each do |file|
  html = File.read(file, encoding: 'UTF-8')
  relative = file.delete_prefix(output + '/')
  errors << "#{relative}: unrendered Liquid" if html.match?(/\{[%{]/)
  errors << "#{relative}: placeholder copy" if html.match?(/Title of your paper|B\. Coauthor|More coming soon|Journal Name/)
  errors << "#{relative}: missing title" unless html.match?(/<title>[^<]+<\/title>/)
  errors << "#{relative}: missing description" unless html.match?(/<meta name="description" content="[^"]+"/)
  errors << "#{relative}: expected one h1" unless html.scan(/<h1[\s>]/).size == 1
  ids = html.scan(/\bid="([^"]+)"/).flatten
  errors << "#{relative}: duplicate ids" unless ids.uniq.size == ids.size
  html.scan(/\b(?:href|src)="([^"]+)"/).flatten.each do |reference|
    # Only internal links/assets; external destinations are documented sources.
    next unless reference.start_with?('/', '#') && !reference.start_with?('//')
    path, fragment = reference.split('#', 2)
    path = path.split('?', 2).first.to_s
    target = path.empty? ? file : local_file(output, path)
    errors << "#{relative}: missing #{reference}" unless File.file?(target)
    next if !fragment || fragment.empty? || !File.file?(target)
    target_html = File.read(target, encoding: 'UTF-8')
    errors << "#{relative}: missing fragment #{reference}" unless target_html.include?(%(id="#{fragment}"))
  end
  html.scan(/<script type="application\/ld\+json">(.*?)<\/script>/m).flatten.each do |json|
    begin
      JSON.parse(json)
    rescue JSON::ParserError => e
      errors << "#{relative}: invalid structured data: #{e.message}"
    end
  end
end

Dir.glob('assets/css/*.css', base: output).map { |path| File.join(output, path) }.each do |file|
  File.read(file).scan(/url\(['"]?([^)'"\s]+)['"]?\)/).flatten.each do |path|
    next if path.start_with?('data:', 'http')
    errors << "Missing CSS asset: #{path}" unless File.file?(File.expand_path(path, File.dirname(file)))
  end
end
Dir.glob('assets/img/*.svg', base: output).map { |path| File.join(output, path) }.each do |file|
  begin
    REXML::Document.new(File.read(file))
  rescue REXML::ParseException => e
    errors << "Invalid SVG #{file}: #{e.message}"
  end
end
begin
  sitemap = REXML::Document.new(File.read(File.join(output, 'sitemap.xml')))
  sitemap_urls = REXML::XPath.match(sitemap, '//s:url/s:loc', { 's' => 'http://www.sitemaps.org/schemas/sitemap/0.9' }).map(&:text)
  public_page_urls = pages.reject { |file| File.basename(file) == '404.html' }.map do |file|
    File.read(file, encoding: 'UTF-8')[/<link rel="canonical" href="([^"]+)"/, 1]
  end.compact
  errors << 'Sitemap omits a published HTML page' unless (public_page_urls - sitemap_urls).empty?
  errors << 'Sitemap contains a non-page or duplicate URL' unless (sitemap_urls - public_page_urls).empty? && sitemap_urls.uniq.size == sitemap_urls.size
rescue REXML::ParseException => e
  errors << "Invalid sitemap: #{e.message}"
end
pubs = YAML.load_file(File.join(root, '_data/pubs.yml'))
projects = YAML.load_file(File.join(root, '_data/projects.yml'))
errors << 'Publications not ordered newest first' unless pubs.map { |p| p['year'] } == pubs.map { |p| p['year'] }.sort.reverse
errors << 'Duplicate publication IDs' unless pubs.map { |p| p['id'] }.uniq.size == pubs.size
errors << 'Unexpected publication count in generated page' unless File.read(File.join(output, 'publications/index.html')).scan('class="publication"').size == pubs.size
errors << 'Unexpected project count in generated page' unless File.read(File.join(output, 'projects/index.html')).scan('class="project-card"').size == projects.size
errors << 'Development files leaked into build' unless Dir.glob('{scripts,docs,node_modules}/**/*', base: output).empty?
if errors.any?
  abort errors.join("\n")
end
puts "PASS: #{pages.size} pages, #{pubs.size} publications, #{projects.size} projects; internal links, fragments, images, fonts, structured data, SVGs and sitemap verified."
