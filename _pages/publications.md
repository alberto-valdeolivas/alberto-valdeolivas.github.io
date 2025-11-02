---
title: "Publications"
permalink: /publications/
layout: single
---

Below are a few selected items. For the full list, see my
[Google Scholar](https://scholar.google.com/citations?user=9gqm7GYAAAAJ&hl=en).

{% for p in site.data.pubs %}
- **{{ p.title }}**  
  {{ p.authors }}. _{{ p.venue }}_, {{ p.year }}.
  {% if p.doi %}[DOI]({{ p.doi }}){% endif %}{% if p.pdf %} · [PDF]({{ p.pdf }}){% endif %}{% if p.code %} · [Code]({{ p.code }}){% endif %}
{% endfor %}