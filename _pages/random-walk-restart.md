---
title: "RandomWalkRestartMH: biological network analysis"
permalink: /projects/random-walk-restart/
description: "Explore RandomWalkRestartMH, Alberto Valdeolivas's R package for random walk with restart on multiplex and heterogeneous biological networks."
---

<section class="page-intro container">
  <p class="eyebrow">RandomWalkRestartMH / Network biology</p>
  <h1>Connecting evidence<br><em>across biological networks.</em></h1>
  <div class="page-intro-bottom"><p>RandomWalkRestartMH is an R package developed by Alberto Valdeolivas and collaborators. It brings different layers of biological evidence together to explore the neighbourhood of genes and diseases.</p><a class="button button-outline" href="https://alberto-valdeolivas.github.io/RandomWalkRestartMH/">Package documentation <span aria-hidden="true">↗</span></a></div>
</section>

<section class="project-article container" aria-label="RandomWalkRestartMH project overview">
  <div class="project-article-body">
    <h2>From known genes to new hypotheses</h2>
    <p>Suppose you have a set of genes associated with a disease or biological process. Which other genes are connected to them, and does the answer change when you combine several kinds of evidence? RandomWalkRestartMH provides a way to investigate these questions using network proximity.</p>

    <h2>How random walk with restart works</h2>
    <p>The analysis starts from selected seed nodes. A walker explores their connections and periodically returns to the seeds. The resulting scores describe how closely other nodes are connected to this starting point. These scores support candidate prioritisation and can be considered alongside experimental evidence and the coverage of the underlying networks.</p>

    <h2>Keeping different types of evidence connected</h2>
    <ul>
      <li><strong>Multiplex networks</strong> represent the same genes or proteins in several interaction layers.</li>
      <li><strong>Heterogeneous networks</strong> connect different kinds of entities, such as genes and diseases.</li>
      <li><strong>Combined networks</strong> allow an analysis to move between interaction layers and entity types.</li>
    </ul>

    <h2>Get started in R</h2>
    <p>The maintained package is available from GitHub. Install it with <code>pak</code>, then follow the worked examples in the vignette.</p>
    <pre><code># Install pak first if needed:
install.packages("pak")
pak::pkg_install("alberto-valdeolivas/RandomWalkRestartMH")</code></pre>
    <p><a href="https://alberto-valdeolivas.github.io/RandomWalkRestartMH/articles/RandomWalkRestartMH.html">Read the worked network-analysis tutorial ↗</a></p>

    <h2>The research behind the package</h2>
    <p>The method is described in <a href="https://doi.org/10.1093/bioinformatics/bty637">Random walk with restart on multiplex and heterogeneous biological networks</a>, by Valdeolivas and collaborators, published in <em>Bioinformatics</em> in the 2019 issue and online in 2018.</p>
    <p class="archive-note">This overview summarises the package and its research context. Detailed usage, examples and citation information are maintained in the linked package documentation.</p>
  </div>
  <aside class="project-article-aside" aria-label="Project resources">
    <p class="eyebrow">Explore the project</p>
    <p><strong>Language</strong><br>R</p>
    <p><strong>Research area</strong><br>Biological networks and gene prioritisation</p>
    <div class="text-links"><a href="https://github.com/alberto-valdeolivas/RandomWalkRestartMH">Source code ↗</a><a href="https://alberto-valdeolivas.github.io/RandomWalkRestartMH/">Documentation ↗</a><a href="https://doi.org/10.1093/bioinformatics/bty637">Research paper ↗</a><a href="{{ '/publications/#random-walk' | relative_url }}">Publication details →</a><a href="{{ '/projects/' | relative_url }}">All projects →</a></div>
  </aside>
</section>
