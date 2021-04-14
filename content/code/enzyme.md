---
title: "enzyme ml"
date: 2019-04-01
tags: ["software","biology", "ml"]
summary: "classifying enzyme catalytic activity"
images:
    - /projects/static/xray.png
---

[Source code.](https://github.com/kennyworkman/enzyme-classification) 
[Abstract.](/projects/static/enzyme_abstract.pdf)

My portion of a group project for a class in Optimization and Machine Learning
for Chemical Problems. We effectively conducted a grid search across various
deep learning architectures to find the most performant approach to classify
enzyme behavior.

Enzymes are special proteins that act as biological catalysts in organic
reactions. It is well known that enzyme behavior is uniquely determined by
molecular structure, which determines specific binding affinity with its
substrate. We can reconstruct the molecular structure of an enzyme using [X-ray
crystallography](https://en.wikipedia.org/wiki/X-ray_crystallography). The idea
is to leverage the unique structure of enzymes to extrapolate the catalytic
function from some unidentified protein.

![An example of x-ray crystallography](/projects/static/xray.png)

Using open source crystallography data from [UniProt](https://www.uniprot.org/),
volumetric tensors were constructed in 3-dimensional Cartesian space as
mathematical embeddings of enzyme structure. A set of distinct embeddings were generated
for each protein, each a subset of atoms with some annotation, eg.
"active-site", "Nitrogen".

A [convolutional neural
network](https://en.wikipedia.org/wiki/Convolutional_neural_network) was used to
exploit the unique structure of our training data. The network architecture and
specifics of implementation can be found in the abstract.

Interestingly, end-to-end recurrent architectures on raw sequence data (using
protein homology as a guide) was more performant. This suggests that catalytic
activity can be identified by very simple sequence motifs without such complex
structural modeling.
