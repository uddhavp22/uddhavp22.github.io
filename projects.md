---
layout: default
title: Projects & Research
permalink: /projects/
---

<div class="blog-intro">
  <h1>projects &amp; research</h1>
  <p class="muted">
    Things I'm building and questions I'm trying to answer.
  </p>
</div>

<section class="section">
  <h2>active</h2>
  {% for project in site.projects %}
  <a href="{{ project.url | relative_url }}" class="project-card-link">
    <div class="project-card">
      {% if project.tags %}
      <span class="project-tag">{{ project.tags | join: ' · ' }}</span>
      {% endif %}
      <h3>{{ project.title }}</h3>
      <p class="project-desc">{{ project.description }}</p>
      <div class="project-links"><span>read more →</span></div>
    </div>
  </a>
  {% endfor %}
</section>

<hr class="divider">

<section class="section">
  <h2>publications &amp; preprints</h2>
  <div class="pub-entry">
    <p class="pub-title">
      <a href="https://arxiv.org/abs/2603.16281" target="_blank" rel="noopener">
        Laya: A LeJEPA Approach to EEG via Latent Prediction over Reconstruction
      </a>
    </p>
    <p class="pub-authors">
      Saarang Panchavati, <strong>Uddhav Panchavati</strong>, Hiroki Nariai, Corey Arnold, William Speier.
      <em>arXiv preprint, 2026.</em>
    </p>
    <div class="pub-links">
      <a href="https://arxiv.org/abs/2603.16281" target="_blank" rel="noopener">arXiv ↗</a>
    </div>
  </div>
</section>
