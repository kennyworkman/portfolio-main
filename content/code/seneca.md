---
title: "Seneca"
date: 2021-01-05
tags: ["software"]
summary: "Decentralized literature and note management"
---

[Repo](https://github.com/kennyworkman/seneca)

Interaction with the scientific paper in 2021 is growing increasingly dynamic.
Science Twitter, Arixv, SciHub, etc. have flooded the researcher with a deluge
of highly relevant papers that no longer exist as isolated works, rather nodes
embedded in a living web of blogs, tweets, and search engines.

I wanted better tooling for interacting with these long-form information
primitives in this new distributed medium. My principles were:

  * decentralized structure
  * low mental transaction cost on note read/write
  * speed
  * terminal-based workflow that hooks into future personal tools


To add a paper:

```
seneca https://www.nature.com/articles/s41467-020-18008-4
```

To search across indexed papers and retrieve note buffer:

```
seneca l 
# or
seneca letters
```

I think you will find this is all that you need. There is no delete. If you
spent enough time indexing a reference, I'm of the opinion you should hang on to
it (just in case).

Notes persist across time. Opening a long forgotten paper weeks later will
recover time stamped notes from my last interaction with it.
