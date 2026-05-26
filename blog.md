---
layout: default
title: Blog
permalink: /blog/
---

<div class="blog-intro">
  <h1>blog</h1>
  <p class="muted">
    Occasional writing on stuff I ponder about.
  </p>
</div>

<ul class="post-list">
  {% for post in site.posts %}
  <li class="post-item">
    <a href="{{ post.url | relative_url }}">
      <div class="post-title">{{ post.title }}</div>
      <div class="post-meta">
        {{ post.date | date: "%B %-d, %Y" }}
        {% if post.read_time %} · {{ post.read_time }} min read{% endif %}
      </div>
      {% if post.excerpt %}
      <div class="post-excerpt">{{ post.excerpt | strip_html | truncate: 160 }}</div>
      {% endif %}
    </a>
  </li>
  {% endfor %}
</ul>
