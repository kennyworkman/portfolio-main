---
title: "Gene alignment application"
date: 2020-04-04 20:36
tags: ["software","biology"]
summary: "A minimal application for gene alignment built from scratch."
images:
    - /projects/static/alignment_img.png
---


[Try it.](https://genealigner.site)
[Source code.](https://github.com/kennyworkman/alignment-app)

I built a UI wrapper around common command line utilities for [multiple
sequence alignment](https://en.wikipedia.org/wiki/Multiple_sequence_alignment)
using the linux package [Clustal Omega](http://www.clustal.org/omega/).
![](/projects/static/alignment_img.png)

Backend manipulation of clustal processes was done with python. An API was
exposed using [Flask](http://flask.pocoo.org). Application logic was
containerized with Docker.

I used NGINX to build out a reverse-proxy server on a blank machine running an
Ubuntu distribution. [Gunicorn](https://gunicorn.org/) was used to communicate
with NGINX and serve up the Dockerized apps exposed on a defined port.

More information on infrastructure and all source code is on GitHub.
