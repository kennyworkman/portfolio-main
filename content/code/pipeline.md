---
title: "pipeline"
date: 2019-03-01
tags: ["software","biology"]
summary: "automated analytics and screening of sequencing data."
---

High-throughput synthetic biology pipelines of any kind will require "reading"
many DNA constructs, and when dealing with a
[library](https://en.wikipedia.org/wiki/Library_(biology)) of reasonable size,
this sequencing process can quickly become complex. 

While interning at the JointBioEnergy Institute, I worked with [Henrique De
Paoli](https://www.linkedin.com/in/henrique-c-de-paoli-9a188111/) to develop
some proof of concept tools to automate the processing and screening of next generation
sequencing (NGS) data. I develop two different libraries to this end.

  * [Iteration 1](https://github.com/kennyworkman/visual_pipeline) with a heavy
emphasis on shell scripting with some auxiliary python.

  * [Iteration
2](https://github.com/kennyworkman/colony-visual/tree/master/cvisual) with a more
robust object-orientated approach with documentation and unit-testing.

These libraries produce excel spreadsheets containing digestible summary
statistics of sequencing. The motivation here is to bridge the gap between the
computational and bench scientist in data interpretation.

![DBTL...](/projects/static/dbtl.png)

Like other processes in the high-level BioFoundry, the closer we come to
automating and abstracting away constituent pieces of the
[Design-Build-Test-Learn
process](https://www.nature.com/articles/s42003-018-0076-9), the faster we can
build more layers of complexity on our "bio stack".
