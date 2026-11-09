# Original vector artwork for this website. No external images or datasets.
# Rebuild with: ruby scripts/generate_artwork.rb
require 'fileutils'

OUTPUT = File.expand_path('../assets/img', __dir__)
FileUtils.mkdir_p(OUTPUT)
TEXT = '#d9e6f7'
CYAN = '#45c7d9'
BLUE = '#79a9e8'
PERIWINKLE = '#a3aef3'
LINE = '#52708e'

def circle(x, y, radius, fill, opacity = 1)
  %(<circle cx="#{x.round(2)}" cy="#{y.round(2)}" r="#{radius.round(2)}" fill="#{fill}" opacity="#{opacity}"/>)
end

def line(x1, y1, x2, y2, color = CYAN, opacity = 0.3)
  %(<line x1="#{x1.round(2)}" y1="#{y1.round(2)}" x2="#{x2.round(2)}" y2="#{y2.round(2)}" stroke="#{color}" opacity="#{opacity}" stroke-width="0.8"/>)
end

def label(x, y, text, color = TEXT, size = 13)
  %(<text x="#{x}" y="#{y}" fill="#{color}" font-family="Consolas,monospace" font-size="#{size}" letter-spacing="0.5">#{text}</text>)
end

def write_svg(name, width, height, contents)
  File.write(File.join(OUTPUT, name), %(<svg xmlns="http://www.w3.org/2000/svg" width="#{width}" height="#{height}" viewBox="0 0 #{width} #{height}">#{contents}</svg>))
end

def tissue(cx, cy, rx, ry, step, seed)
  random = Random.new(seed)
  dots = []
  (-rx.to_i..rx.to_i).step(step) do |x|
    (-ry.to_i..ry.to_i).step(step) do |y|
      angle = Math.atan2(y.to_f / ry, x.to_f / rx)
      edge = 1 + 0.07 * Math.sin(angle * 5) + 0.09 * Math.cos(angle * 3)
      next if (x.to_f / rx)**2 + (y.to_f / ry)**2 > edge
      next if random.rand < 0.08
      px = cx + x + random.rand(-2.0..2.0)
      py = cy + y + random.rand(-2.0..2.0)
      domain = Math.sin(x / 47.0) + Math.cos(y / 36.0) + Math.sin((x + y) / 68.0)
      color = domain > 0.85 ? CYAN : (domain < -0.7 ? PERIWINKLE : BLUE)
      dots << circle(px, py, random.rand(1.5..3.2), color, random.rand(0.5..0.94).round(2))
    end
  end
  dots.join
end

art = []
# Small registration marks and a quiet plotting field.
art << %(<path d="M24 68h14m-7-7v14M524 68h14m-7-7v14M24 500h14m-7-7v14M524 500h14m-7-7v14" fill="none" stroke="#{LINE}"/>)
art << %(<circle cx="295" cy="284" r="209" fill="none" stroke="#{LINE}" stroke-width="0.8"/>)
art << %(<circle cx="295" cy="284" r="227" fill="none" stroke="#{LINE}" stroke-width="0.7" stroke-dasharray="2 7"/>)
art << %(<path d="M55 326C55 130 458 72 499 279S111 487 55 326Z" fill="none" stroke="#{BLUE}" stroke-width="0.75" opacity="0.5"/>)
art << %(<g transform="rotate(-23 315 280)">#{tissue(315, 280, 168, 163, 8, 23)}</g>)
# A molecular network connects to the spatial field.
nodes = [[69, 147], [106, 109], [142, 139], [98, 183], [152, 192], [178, 153], [190, 215], [139, 241], [74, 231]]
edges = [[0,1],[0,3],[0,8],[1,2],[1,3],[2,3],[2,4],[2,5],[3,4],[3,8],[4,5],[4,6],[4,7],[5,6],[6,7],[7,8],[3,7]]
art << %(<circle cx="124" cy="176" r="88" fill="#20334d" opacity="0.88"/>)
edges.each { |a,b| art << line(*nodes[a], *nodes[b], CYAN, 0.45) }
nodes.each_with_index do |(x,y),i|
  art << circle(x,y,i == 4 ? 7 : 4.5,i == 4 ? PERIWINKLE : CYAN)
  art << circle(x,y, i == 4 ? 14 : 9, 'none')
end
art << %(<circle cx="152" cy="192" r="14" fill="none" stroke="#{PERIWINKLE}" opacity="0.45"/>)
art << %(<path d="M152 192C197 162 236 171 267 210" fill="none" stroke="#{PERIWINKLE}" stroke-width="1" stroke-dasharray="3 4"/>)
# A lens on a small community of cells.
art << %(<circle cx="169" cy="399" r="75" fill="#20334d" stroke="#{LINE}"/>)
random = Random.new(84)
cells = [[135,371,21],[178,356,16],[204,390,22],[157,411,25],[191,441,15],[122,425,13]]
cells.each_with_index do |(x,y,r),i|
  color = i.even? ? CYAN : PERIWINKLE
  art << %(<circle cx="#{x}" cy="#{y}" r="#{r}" fill="#{color}" fill-opacity="0.08" stroke="#{color}" stroke-width="0.8"/>)
  art << circle(x-2,y+2,r*0.25,color,0.7)
  6.times do
    angle = random.rand * Math::PI*2
    art << circle(x+Math.cos(angle)*r*0.65,y+Math.sin(angle)*r*0.65,1.1,color,0.5)
  end
end
art << %(<path d="M228 354L278 319" fill="none" stroke="#{CYAN}" stroke-width="0.8"/>)
art << circle(278,319,6,'#20334d')
art << circle(278,319,3,CYAN)
art << %(<path d="M102 110L78 80H40M450 194L490 142H535M201 456L232 491H356" fill="none" stroke="#{CYAN}" stroke-width="0.7"/>)
art << label(40,69,'01 / NETWORKS')
art << label(402,129,'03 / TISSUES')
art << label(237,509,'02 / CELL COMMUNITIES')
art << label(25,550,'MOLECULE → CELL → TISSUE', '#a9b8d0', 11)
art << label(363,550,'CONCEPTUAL VIEW', '#a9b8d0', 11)
write_svg('connections.svg',560,570,art.join)

# Companion project illustrations use the same visual vocabulary.
write_svg('tissue.svg',520,300,
  tissue(260,140,195,98,8,14) + label(375,29,'CELLULAR NICHES', CYAN,12) +
  %(<path d="M50 250h420M260 18v240" stroke="#{CYAN}" stroke-width="0.5" stroke-dasharray="2 6" opacity="0.4"/>))

network = []
positions = [[0,0],[65,-24],[128,12],[175,-24],[220,15],[35,45],[102,56],[168,49],[235,67]]
offsets = [[120,70],[140,136],[160,202]]
offsets.each_with_index do |(ox,oy),layer|
  color = [CYAN,BLUE,PERIWINKLE][layer]
  network << %(<path d="M#{ox-45} #{oy-35}l275-8 60 73-275 8Z" fill="#{color}" fill-opacity="0.025" stroke="#{color}" stroke-width="0.6" opacity="0.6"/>)
  positions.each_with_index do |(x,y),i|
    positions.each_with_index do |(xx,yy),j|
      network << line(ox+x,oy+y*0.55,ox+xx,oy+yy*0.55,color,0.32) if j>i && (j-i<=2 || (i+j)%7==0)
    end
    network << circle(ox+x,oy+y*0.55,3.7,color)
    network << line(ox+x,oy+y*0.55,ox+x+20,oy+y*0.55+66,color,0.22) if layer<2
  end
end
network << label(355,28,'MULTILAYER NETWORKS',CYAN,12)
write_svg('network.svg',520,300,network.join)

spatial = tissue(267,140,160,105,9,42)
spatial << %(<path d="M52 40v199h409M55 190C150 143 190 205 270 157S381 72 451 109" stroke="#{CYAN}" fill="none" stroke-width="1" opacity="0.4"/> )
spatial << label(341,28,'SPATIAL CONTEXT',CYAN,12)
write_svg('spatial.svg',520,300,spatial)

signaling = []
[[130,143,58],[390,143,58]].each_with_index do |(x,y,r),i|
  color = i.zero? ? CYAN : PERIWINKLE
  signaling << %(<circle cx="#{x}" cy="#{y}" r="#{r}" fill="#{color}" fill-opacity="0.06" stroke="#{color}" stroke-width="0.7"/>)
  signaling << circle(x,y,18,color,0.18)
  12.times do |n|
    a = n.to_f/12*Math::PI*2
    signaling << circle(x+Math.cos(a)*r,y+Math.sin(a)*r,3.5,color)
  end
end
signaling << %(<path d="M195 123C235 75 288 75 325 123M195 143h130M195 163C235 211 288 211 325 163" stroke="#{CYAN}" fill="none" stroke-width="0.8" stroke-dasharray="3 5"/>)
[[240,93],[275,93],[260,143],[240,192],[275,192]].each { |x,y| signaling << circle(x,y,5,BLUE) }
signaling << label(325,28,'CONNECTED SIGNALLING',CYAN,12)
write_svg('signaling.svg',520,300,signaling.join)
puts 'Generated five original SVG illustrations.'
