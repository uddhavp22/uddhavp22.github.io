---
title: "Improving LAYA: EEG Foundation Models at Scale"
tags: [EEG, BCI, Foundation Models]
description: "Follow-up to the LAYA EEG foundation model paper. Investigates architectural and training-regime improvements to enhance representation quality and downstream generalization across EEG decoding tasks."
status: Active
started: 2025
---

## background

LAYA (*LeJEPA Approach to EEG via Latent Prediction over Reconstruction*) is a project I worked on with [Saarang Panchavati](https://saarangp.github.io/), Hiroki Nariai, Corey Arnold, and William Speier. The core idea: most EEG foundation models use reconstruction-based self-supervised objectives (like MAE), which tends to bias representations toward high-variance artifacts rather than clinically meaningful signal. We proposed using Joint Embedding Predictive Architectures (JEPA) instead — predicting in latent space rather than reconstructing in signal space.

The results were encouraging: LAYA produced representations with better frozen linear probing performance and more resilience to noise than reconstruction-based alternatives. The preprint is on arXiv: [arxiv.org/abs/2603.16281 ↗](https://arxiv.org/abs/2603.16281)

## what i'm working on now

[Write about what you're doing to extend/improve LAYA here — architectural changes, training regime, new datasets, cross-subject transfer?]

## open questions

[What are the key open questions driving this follow-up?]
