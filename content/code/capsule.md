---
title: "capsule"
date: 2020-12-08
tags: ["software","ml"]
katex: true
markup: "mmark"
summary: "Using Monte Carlo simulation to improve likelihood evaluation."
---

[Summary](https://wandb.ai/maximsmol/proj-google_stacked_capsule_autoencoders/reports/Semantic-Convolutions-ML-B---VmlldzozNTc3NTI)
[Repo](https://github.com/mlberkeley/semantic-convs)

This is definitely dense without context - checkout the resources above.
This is essentially a really data efficient computer vision architecture.

### Don't settle with slow

Our attempts to optimize the Google Brain Stacked Capsule AutoEncoder (SCAE)
implementation were focused on the particularly unwieldy log-likelihood central
to the training process. To narrow the scope of our task, we concentrated
efforts on the Object Capsule AutoEncoder (OCAE).

To train our object encoders or capsules, we must first evaluate how accurately they can reconstruct their parts, then we must use this metric as a loss to tune the weights of the autoencoder. For a rigorous understanding of this reconstruction, specifically how object-viewer and object-part transforms are composed to obtain a viewpoint invariant understanding of a given part's pose, it is best to refer to the paper. For our purposes, it is enough to understand the following likelihood expression at a high level:

$$p(x_{1:M}) = \prod_{m=1}^{M} \sum_{k=1}^K\sum_{n=1}^N \frac{a_ka_{k,n}}{\sum_ia_i\sum_ja_j} p(x_m | k, n)$$

Assume here that we have $$ K $$ object capsules, where each capsule is able to
vote $$ N\leq K $$ times. Additionally, we have $$ x_m : \{m = 1, ... , M\} $$
parts. Our likelihood is thus evaluating, for any given capsule and vote, how
well that capsule's vote "explains" a given part $$ x_m $$. 

Assume that $$ p(x_m | k, n) $$ is a Gaussian mixture component parameterized
by the decoding, and that $$ a_k $$ and $$ a_{k,n} $$ are probabilities
provided by the encoding/decoding alike.  We then must "route" capsules to the
parts that they explain the best. This is equivalent to the following
expression:

$$ k* = argmax_k \,\, a_ka_{k,n} p(x_m | k, n) $$

This value becomes our model loss when multiplied across each part, where the
part's likelihood is evaluated with respect to its optimal capsule. Notice that
our evaluation of $$ k* $$ is contingent on closed-form evaluation of the
\textit{every combination of capsule and vote}. Now, consider a hierarchical
capsule net with 100 capsules in a given layer, and assume each capsule can vote
for any of the 100 capsules from the layer previous. We are now computing 10,000
Gaussian log probabilities for each part for a single capsule to obtain our $$
k* $$.

For any given layer, this amounts to 100,000,000 computations.  This amounts to
$$ 2^9 $$ log probability computations \textit{for a single round of back
propagation}.  Naked and afraid without automatic differentiation, we turn to
Bayesian statistics and Markov Chain Monte Carlo (MCMC) to adopt statistical
machinery to our aim.

### The Metropolis-Hastings Algorithm

Even though we want to avoid computing a closed-form posterior distribution, we
can sparsely sample from it with certain guarantees about the resulting trace.
However, one can imagine that a random walk with no further heuristics is not
sufficient. Such a walk gives us no understanding as to the "shape" of the
distribution being sampled. We desire a way to sample from our black-box
posterior such that the density of sampled values are proportional to the amount
of probability density at the sampled value. In other words, we wish for our
sampled trace to have the same "shape" as our underlying posterior.

To this aim, we can construct a markov chain that wanders through our parameters
space in $$ k $$ and $$ n $$ , "intelligently" rejecting or accepting new states
in proportion to the density that the state holds. The decision criteria to
fulfill such a condition is the Metropolis-Hastings algorithm:

$$ \alpha =  \frac{a_{k'}a_{k',n'} p(x_m | k', n')}{a_ka_{k,n} p(x_m | k, n)} $$

Where the decision criterion $$ \alpha $$ determines if the markov chain
advances to a candidate state with parameters $$ k' $$ and $$ n' $$

### A posteriori

Working on emperical conclusions from the above theory...
