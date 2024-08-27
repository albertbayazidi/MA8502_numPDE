#import "@preview/lemmify:0.1.5": *

#let (
  theorem, lemma, corollary,
  remark, proposition, example,
  definition,
  proof, rules: thm-rules
) = default-theorems("thm-group", lang: "en")

#show: thm-rules 
