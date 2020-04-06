---
title: "Bioware index"
date: 2020-04-04 20:36
tags: ["software","biology"]
summary: "A simple tool to catalog biological labware."
---

[Source code.](https://github.com/kennyworkman/labware-index)
[Docs.](/projects/static/labware_index.pdf)

An exercise in designing persistent and intuitive software.

I used a data structure architecture largely [inspired by
git](https://blog.jayway.com/2013/03/03/git-is-a-purely-functional-data-structure/).

A detailed breakdown of implementation, design choices, and an API specification
can be found in the linked documentation.

Here is a quick use case with the exposed API:

```
>>> rad = registry.get("Rad")
>>> rad
Bio-Rad-HSP9601B with length 127.76 mm, width 85.48 mm, height 16.06 mm, and 96 wells. >>> rad.plate
Plate with length 127.76 mm, width 85.48 mm, height 16.06 mm, and 96 wells.
>>> rad.well
Well with volume 200 uL, depth 14.81 mm, top diameter 5.46 mm, and bottom diameter 2.
˓→64 mm.
>>> rad.plate.well_num 96
```
