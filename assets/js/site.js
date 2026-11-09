(() => {
  'use strict';

  // Navigation stays fully visible when JavaScript is unavailable.
  const menu = document.querySelector('.menu-toggle');
  const nav = document.querySelector('#main-nav');
  if (menu && nav) {
    document.documentElement.classList.add('js-nav');
    menu.hidden = false;
    const closeMenu = () => {
      menu.setAttribute('aria-expanded', 'false');
      nav.classList.remove('is-open');
    };
    menu.addEventListener('click', () => {
      const open = menu.getAttribute('aria-expanded') !== 'true';
      menu.setAttribute('aria-expanded', String(open));
      nav.classList.toggle('is-open', open);
    });
    nav.addEventListener('click', (event) => {
      if (event.target.closest('a')) closeMenu();
    });
    document.addEventListener('keydown', (event) => {
      if (event.key === 'Escape' && menu.getAttribute('aria-expanded') === 'true') {
        closeMenu();
        menu.focus();
      }
    });
    const mobile = window.matchMedia('(max-width: 900px)');
    const syncMenu = () => {
      menu.hidden = !mobile.matches;
      if (!mobile.matches) closeMenu();
    };
    mobile.addEventListener('change', syncMenu);
    syncMenu();
  }

  const tools = document.querySelector('[data-publication-tools]');
  if (!tools) return;
  const papers = [...document.querySelectorAll('[data-publication]')];
  const buttons = [...tools.querySelectorAll('[data-filter]')];
  const search = document.querySelector('#publication-search');
  const count = document.querySelector('[data-result-count]');
  const empty = document.querySelector('[data-empty-state]');
  const allowed = new Set(buttons.map((button) => button.dataset.filter));
  const normalize = (text) => text.normalize('NFD').replace(/[\u0300-\u036f]/g, '').toLowerCase();
  const index = papers.map((paper) => ({ paper, text: normalize(paper.textContent) }));
  let topic = 'all';
  let timer;

  function applyFilters(updateUrl = true) {
    const terms = normalize(search.value.trim()).split(/\s+/).filter(Boolean);
    let matches = 0;
    index.forEach(({ paper, text }) => {
      const visible = (topic === 'all' || paper.dataset.topic === topic) && terms.every((term) => text.includes(term));
      paper.hidden = !visible;
      if (visible) matches++;
    });
    buttons.forEach((button) => button.setAttribute('aria-pressed', String(button.dataset.filter === topic)));
    count.textContent = String(matches);
    empty.hidden = matches !== 0;
    if (updateUrl) {
      const url = new URL(window.location.href);
      if (topic === 'all') url.searchParams.delete('topic');
      else url.searchParams.set('topic', topic);
      if (search.value.trim()) url.searchParams.set('q', search.value.trim());
      else url.searchParams.delete('q');
      window.history.replaceState(null, '', url);
    }
  }

  function readUrl() {
    const params = new URLSearchParams(window.location.search);
    topic = allowed.has(params.get('topic')) ? params.get('topic') : 'all';
    search.value = params.get('q') || '';
    applyFilters(false);
  }

  tools.hidden = false;
  buttons.forEach((button) => button.addEventListener('click', () => {
    clearTimeout(timer);
    topic = button.dataset.filter;
    applyFilters();
  }));
  search.addEventListener('input', () => {
    clearTimeout(timer);
    timer = setTimeout(applyFilters, 100);
  });
  document.querySelector('[data-reset-filters]').addEventListener('click', () => {
    clearTimeout(timer);
    topic = 'all';
    search.value = '';
    applyFilters();
    search.focus();
  });
  window.addEventListener('popstate', readUrl);
  readUrl();
})();
