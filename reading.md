---
layout: default
title: Reading
permalink: /reading/
---

<div class="blog-intro">
  <h1>reading</h1>
  <p class="muted">
    Books I'm reading, have read, and want to read. Unapologetically eclectic —
    philosophy, fantasy, science, fiction, whatever.
  </p>
</div>

<section class="section">
  <h2>currently reading</h2>
  {% assign current = site.books | where: "status", "currently reading" %}
  {% for book in current %}
  <a href="{{ book.url | relative_url }}" class="book-card-link">
    <div class="currently-reading">
      <div class="book-title" style="font-size: 1.05rem; margin-bottom: 0.25rem;">{{ book.title }}</div>
      <div class="book-author" style="font-size: 0.88rem;">{{ book.author }}</div>
      {% if book.blurb %}<div class="book-note" style="margin-top: 0.6rem;">{{ book.blurb }}</div>{% endif %}
      <div style="margin-top: 0.75rem; font-size: 0.83rem; color: var(--accent); font-style: italic;">read more →</div>
    </div>
  </a>
  {% endfor %}
</section>

<hr class="divider">

<section class="section">
  <h2>favorites</h2>
  <div class="book-grid">
    {% assign favorites = site.books | where: "status", "favorite" %}
    {% for book in favorites %}
    <a href="{{ book.url | relative_url }}" class="book-card-link">
      <div class="book-card">
        <div class="book-title">{{ book.title }}</div>
        <div class="book-author">{{ book.author }}</div>
        <div class="book-status">{{ book.badge }}</div>
        {% if book.blurb %}<div class="book-note">{{ book.blurb }}</div>{% endif %}
      </div>
    </a>
    {% endfor %}
  </div>
</section>

<hr class="divider">

<section class="section">
  <h2>on the list</h2>
  <div class="book-grid">
    {% assign want = site.books | where: "status", "want to read" %}
    {% for book in want %}
    <div class="book-card">
      <div class="book-title">{{ book.title }}</div>
      <div class="book-author">{{ book.author }}</div>
      <div class="book-status">want to read</div>
    </div>
    {% endfor %}
  </div>
</section>
