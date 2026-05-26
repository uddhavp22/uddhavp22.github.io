---
layout: default
---

<section class="intro">
  <h1>hi, i'm uddhav.</h1>
  <div class="bio">
    <p>
      I'm currently a student at UCSD studying cognitive science and machine learning,
      and minoring in data science. I love FC Barcelona, piano, cooking, baking, soccer,
      chess, and painting.
    </p>
    <p>
      Research-wise, I'm currently really interested in
      <strong>representation learning</strong> (especially for the brain),
      <strong>brain-computer interfaces (BCIs)</strong>, as well as trying to learn more
      about reinforcement learning.
    </p>
    <p>
      I've also recently been getting into more philosophy, so expect some writing
      about that probably.
    </p>
  </div>

  <div class="social-links">
    <a href="https://github.com/uddhavp22" target="_blank" rel="noopener">GitHub ↗</a>
    <a href="https://x.com/UddhavPanchava1" target="_blank" rel="noopener">Twitter ↗</a>
    <a href="https://www.linkedin.com/in/uddhav-panchavati-4a7980270/" target="_blank" rel="noopener">LinkedIn ↗</a>
    <a href="mailto:uddhavpanchavati@gmail.com">Email ↗</a>
  </div>
</section>

<hr class="divider">

<section class="section">
  <h2>research interests</h2>
  <ul class="interest-list">
    <li>Representation learning in neural signals &amp; EEG</li>
    <li>Foundation models for neuroscience</li>
    <li>Brain-computer interfaces (BCIs)</li>
    <li>Self-supervised learning &amp; JEPA-style architectures</li>
    <li>AI &amp; music generation</li>
  </ul>
</section>

<hr class="divider">

<section class="section">
  <h2>now</h2>
  <div class="now-grid">
    <div class="now-card">
      <div class="now-label">📖 reading</div>
      <div class="now-value">Plato's <em>The Republic</em></div>
    </div>
    <div class="now-card">
      <div class="now-label">🧠 working on</div>
      <div class="now-value">EEG foundation model representations</div>
    </div>
    <div class="now-card">
      <div class="now-label">🎹 playing</div>
      <div class="now-value">Piano — whatever sounds nice</div>
    </div>
    <div class="now-card">
      <div class="now-label">⚽ suffering through</div>
      <div class="now-value">FC Barcelona (always)</div>
    </div>
  </div>
</section>

<hr class="divider">

<section class="section">
  <h2>recent writing</h2>
  <ul class="post-list">
    {% for post in site.posts limit:3 %}
    <li class="post-item">
      <a href="{{ post.url | relative_url }}">
        <div class="post-title">{{ post.title }}</div>
        <div class="post-meta">{{ post.date | date: "%B %-d, %Y" }}{% if post.read_time %} · {{ post.read_time }} min read{% endif %}</div>
        {% if post.excerpt %}<div class="post-excerpt">{{ post.excerpt | strip_html | truncate: 160 }}</div>{% endif %}
      </a>
    </li>
    {% endfor %}
  </ul>
  <p style="margin-top: 1.2rem; font-size: 0.9rem;">
    <a href="{{ '/blog' | relative_url }}">all posts →</a>
  </p>
</section>
