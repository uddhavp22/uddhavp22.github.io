---
title: "Laya2: Improving Laya"
tags: [WIP, Deep Learning, EEG]
description: "This is an extension of my previous work on Laya: A LeJEPA Approach to EEG via Latent Prediction over Reconstruction"
status: Active
started: 2026
---

*Note: Assuming you have read Laya/ know a little about EEG Foundation Models*

## motivation

The main goal of this project is to be an extension of the original Laya model and to address some of the model's weaknesses. The biggest setback behind Laya is its performance on BCI tasks, where the improvements aren't statistically significant compared to all of the baseline models, and all of the models perform terribly. So the key goal of this project is to figure out a way to improve the model's performance by updating the pretraining recipe instead of making a better classification head. We could also just say the goal is to improve linear probe performance, but I have more thoughts on the practicality of evaluating EEG foundation models via linear probing.

## approach

For BCI tasks, I think the biggest setbacks EEGFMs have are spatial mixing and patient generalization. So to condition the model to be better about these things, the intuitive answer is to add some auxiliary tasks tailored to those setbacks.

Things to try include: (**bold** is what I think is probably the move)

- **Binary classification on whether two channels are swapped**
- Predict channel query value given some coordinate
- Unmix channels. This could be cool, but computationally it sounds like a nightmare.
- **Regression on patient age**
- Maybe for HBN data during pretraining, try to predict some other patient-specific attribute

## progress

Running experiments right now for the auxiliary tasks.

> *"Stay tuned everybody" — Saarang*

## open questions

Everything is up in the air bro this stuff is hard.

1. Is how we evaluate EEG foundation models indicative of learning something meaningful about the brain?
2. Does having model specific classifiers for downstream tasks instead of probes take away from the model learning useful representations?
3. How can we address the issue of generalizing across patients with limited data?
