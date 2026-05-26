---
title: "Automated Music Arrangement with JEPA"
tags: [Music, AI, Self-Supervised Learning]
description: "Using Joint Embedding Predictive Architectures (JEPA) to learn rich representations of musical structure for automated arrangement — given a melody or solo piano piece, produce a coherent multi-instrument arrangement."
status: Active
started: 2025
---

## the idea

Music arrangement is the art of taking a piece — say, a melody or a solo piano score — and re-scoring it for a different ensemble or instrumentation. It requires understanding harmony, texture, phrasing, and the idiomatic capabilities of each instrument. It's also something I find genuinely beautiful when done well.

The question this project asks: can a self-supervised model learn the kind of musical structure that would let it do this? Specifically, can Joint Embedding Predictive Architectures (JEPA) — which learn by predicting abstract representations of missing context rather than reconstructing raw signal — capture the hierarchical structure of music well enough to drive intelligent re-orchestration?

## why JEPA?

JEPA was originally proposed for vision (I-JEPA, V-JEPA) and has shown that predicting in latent space produces richer, more semantic representations than pixel-level reconstruction. The intuition maps well to music: you don't want a model obsessing over the exact timbre of a note — you want it to understand that a phrase is building toward resolution, or that the harmonic motion calls for a certain kind of voicing. Latent prediction seems like the right inductive bias.

## progress

[Write about where the project is now — dataset choices, architecture decisions, early results.]

## open questions

[What are the hardest open problems — representation, evaluation, something else?]
