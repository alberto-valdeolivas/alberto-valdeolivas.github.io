---
title: "Publications"
permalink: /publications/
description: "Selected publications by Alberto Valdeolivas in spatial omics, applied AI and network biology. Explore papers, code and research notes."
---

<section class="page-intro container"><p class="eyebrow">The research record</p><h1>Ideas, tested.<br><em>Knowledge, shared.</em></h1><div class="page-intro-bottom"><p>Selected publications across spatial biology, applied AI and biological networks. For my complete publication record, visit Google Scholar.</p><a class="button button-outline" href="{{ site.author.scholar }}">Full Google Scholar profile <span aria-hidden="true">↗</span></a></div></section>
<section class="container publications-section" aria-label="Selected publications">
  <div class="publication-tools" data-publication-tools hidden><div class="filter-group" role="group" aria-label="Filter by research area"><button type="button" data-filter="all" aria-pressed="true">All areas</button><button type="button" data-filter="spatial" aria-pressed="false">Spatial biology</button><button type="button" data-filter="ai" aria-pressed="false">Applied AI</button><button type="button" data-filter="networks" aria-pressed="false">Network biology</button></div><label class="search-field"><span class="sr-only">Search publications</span><svg viewBox="0 0 24 24" width="18" height="18" aria-hidden="true"><circle cx="10" cy="10" r="6.5"/><path d="m15 15 5 5"/></svg><input type="search" id="publication-search" placeholder="Search papers, topics, years…" autocomplete="off"></label></div>
  <div class="publication-count" aria-live="polite" aria-atomic="true"><span data-result-count>{{ site.data.pubs.size }}</span> selected publications <span>· Newest first</span></div>
  <div class="publications-list">{% for p in site.data.pubs %}{% include publication.html paper=p %}{% endfor %}</div>
  <div class="empty-state" data-empty-state hidden><h2>No papers found.</h2><p>Try another keyword or research area.</p><button class="button button-outline" type="button" data-reset-filters>Reset filters <span aria-hidden="true">↺</span></button></div>
  <noscript><p class="no-script-note">All selected publications are listed above. Search and topic filters are available when JavaScript is enabled.</p></noscript>
  <p class="archive-note">A curated selection, rather than an exhaustive bibliography. <a href="{{ site.author.scholar }}">Find all publications on Google Scholar ↗</a></p>
</section>
