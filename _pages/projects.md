---
title: "Projects"
permalink: /projects/
description: "Open-source software and reproducible analysis from Alberto Valdeolivas and collaborators: Chrysalis, RandomWalkRestartMH, ST_CRC_CMS and OmnipathR."
---

<section class="page-intro container"><p class="eyebrow">Code / Methods / Reproducibility</p><h1>From a question<br>to a <em>working tool.</em></h1><div class="page-intro-bottom"><p>Open-source methods and analysis workflows from my research and collaborations. Explore the code, follow the documentation, or build something new.</p><a class="button button-outline" href="{{ site.author.github }}">Find me on GitHub <span aria-hidden="true">↗</span></a></div></section>
<section class="container projects-section" aria-label="Open-source projects"><div class="project-grid">{% for project in site.data.projects %}{% include project.html project=project %}{% endfor %}</div><p class="archive-note">These projects are collaborative efforts. Each repository contains its contributors, licensing terms and citation guidance.</p></section>
<section class="contact-band container"><p class="eyebrow">Better questions, together</p><div><h2>Have something <em>in mind?</em></h2><a class="button button-dark" href="{{ '/contact/' | relative_url }}">Let’s talk <span aria-hidden="true">↗</span></a></div></section>
