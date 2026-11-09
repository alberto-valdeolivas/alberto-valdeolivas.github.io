---
title: "Home"
home: true
---

<section class="hero container" aria-labelledby="hero-title">
  <div class="hero-copy">
    <p class="eyebrow role"><span class="status-dot" aria-hidden="true"></span> Principal & Applied AI Scientist · Roche</p>
    <h1 id="hero-title">Biology is complex.<br>Let’s connect<br>the <em>dots.</em><span class="heading-dot" aria-hidden="true"></span></h1>
    <p class="hero-intro">I’m Alberto. I bring together spatial omics, biological networks and AI to understand disease — and turn complex data into insights for drug discovery.</p>
    <div class="hero-actions"><a class="button button-dark" href="#research">Explore my research <span aria-hidden="true">↓</span></a><a class="text-link" href="{{ site.author.scholar }}">Google Scholar <span aria-hidden="true">↗</span></a></div>
    <div class="hero-location"><span class="location-mark" aria-hidden="true">⊕</span> Based in Basel, Switzerland <span class="location-rule"></span> Working across scales</div>
  </div>
  <figure class="hero-figure"><div class="figure-topline"><span>THE SCIENCE OF CONNECTION</span><span aria-hidden="true">FIG. 01</span></div><img class="hero-art" src="{{ '/assets/img/connections.svg' | relative_url }}?v={{ site.time | date: '%s' }}" width="560" height="570" alt="An original illustration connecting molecular networks, cell communities and a spatial tissue map."><figcaption><span class="figure-key"><i class="key-network"></i> Networks</span><span class="figure-key"><i class="key-cell"></i> Cells</span><span class="figure-key"><i class="key-tissue"></i> Tissues</span><span class="figure-caption">A connected view of biology</span></figcaption></figure>
</section>

<div class="discipline-strip"><div class="container"><span>Spatial omics</span><i aria-hidden="true">✳</i><span>Machine learning</span><i aria-hidden="true">✳</i><span>Network biology</span><i aria-hidden="true">✳</i><span>Drug discovery</span></div></div>

<section id="research" class="section container" aria-labelledby="research-title">
  <div class="section-heading"><div><p class="eyebrow section-number">01 / Research</p><h2 id="research-title">Context changes<br><em>everything.</em></h2></div><p>A protein, a cell, a tissue. Each makes more sense when we understand its connections. My research brings those perspectives together.</p></div>
  <div class="research-grid">
    <article class="research-direction"><div class="direction-top"><span>01.1</span><svg viewBox="0 0 64 64" aria-hidden="true"><circle cx="32" cy="32" r="23"/><circle cx="32" cy="32" r="10"/><path d="M9 32h46M32 9v46M16 16l32 32M16 48l32-32"/></svg></div><h3>Biology in place.</h3><p>How does the neighbourhood of a cell shape disease? I use spatial omics to connect molecular programmes with the architecture of tissues.</p><a class="text-link" href="{{ '/publications/?topic=spatial' | relative_url }}">Spatial biology <span aria-hidden="true">↗</span></a></article>
    <article class="research-direction"><div class="direction-top"><span>01.2</span><svg viewBox="0 0 64 64" aria-hidden="true"><path d="M13 44L24 15l29 12-14 25-26-8 40-17M24 15l15 37"/><circle cx="13" cy="44" r="4"/><circle cx="24" cy="15" r="4"/><circle cx="53" cy="27" r="4"/><circle cx="39" cy="52" r="4"/></svg></div><h3>Learning with context.</h3><p>How can AI use what we know about biology? I work on context-aware models and methods that connect molecular data with useful scientific questions.</p><a class="text-link" href="{{ '/publications/?topic=ai' | relative_url }}">Applied AI <span aria-hidden="true">↗</span></a></article>
    <article class="research-direction"><div class="direction-top"><span>01.3</span><svg viewBox="0 0 64 64" aria-hidden="true"><path d="M8 21l24-13 24 13-24 13L8 21zm0 12 24 13 24-13M8 45l24 13 24-13M32 34v24"/></svg></div><h3>Knowledge, connected.</h3><p>What can we learn by linking different layers of evidence? I develop and use network approaches to explore biological systems and prioritise hypotheses.</p><a class="text-link" href="{{ '/publications/?topic=networks' | relative_url }}">Network biology <span aria-hidden="true">↗</span></a></article>
  </div>
</section>

<section class="work-section" aria-labelledby="work-title"><div class="section container">
  <div class="section-heading"><div><p class="eyebrow section-number">02 / Selected work</p><h2 id="work-title">Questions into<br><em>contributions.</em></h2></div><div><p>A few pieces of the bigger picture, developed with talented collaborators across disciplines.</p><a class="text-link" href="{{ '/publications/' | relative_url }}">Browse publications <span aria-hidden="true">↗</span></a></div></div>
  <div class="selected-list">{% assign selected = site.data.pubs | where: 'selected', true %}{% for p in selected %}
    <article class="selected-paper"><div class="selected-index">0{{ forloop.index }}<span>{{ p.year }}</span></div><div><p class="publication-venue">{{ p.venue }} <span> / {{ p.label }}</span></p><h3><a href="{{ p.doi }}">{{ p.short_title | default: p.title }}</a></h3><p>{{ p.summary }}</p></div><a class="round-link" href="{{ p.doi }}" aria-label="Read {{ p.title | escape }}"><span aria-hidden="true">↗</span></a></article>
  {% endfor %}</div>
</div></section>

<section class="section container" aria-labelledby="software-title">
  <div class="section-heading"><div><p class="eyebrow section-number">03 / Open science</p><h2 id="software-title">Built to be<br><em>built upon.</em></h2></div><div><p>Science moves forward when methods are accessible. Explore code, notebooks and tools from my research and collaborations.</p><a class="text-link" href="{{ '/projects/' | relative_url }}">Explore all projects <span aria-hidden="true">↗</span></a></div></div>
  <div class="project-grid project-grid--home">{% for project in site.data.projects limit: 2 %}{% include project.html project=project %}{% endfor %}</div>
</section>

<section id="about" class="about-section" aria-labelledby="about-title"><div class="container about-grid">
  <div class="portrait-wrap"><img src="{{ site.author.avatar | relative_url }}" width="200" height="200" alt="Alberto Valdeolivas" loading="lazy"><span class="portrait-caption">Alberto Valdeolivas <span>Basel, CH</span></span></div>
  <div class="about-copy"><p class="eyebrow section-number">04 / A little about me</p><h2 id="about-title">Curiosity across<br><em>disciplines.</em></h2><p class="about-lead">I’m a scientist working at the intersection of computational biology and applied AI at Roche in Basel.</p><p>My work connects spatial omics, machine learning and biological networks, with a focus on understanding disease and supporting drug discovery. I enjoy the space where different kinds of expertise meet — and where a computational idea becomes a useful research tool.</p><p>This site brings together the research and open-source contributions I can share publicly.</p><div class="text-links"><a href="{{ site.author.linkedin }}">More on LinkedIn ↗</a><a href="{{ site.author.orcid }}">ORCID ↗</a></div></div>
</div></section>

<section class="contact-band container"><p class="eyebrow">Good science starts with a conversation</p><div><h2>Let’s connect <em>the next dots.</em></h2><a class="button button-dark" href="{{ '/contact/' | relative_url }}">Get in touch <span aria-hidden="true">↗</span></a></div><p>Research collaborations, scientific exchange, talks and mentoring.</p></section>
