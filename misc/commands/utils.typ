#import "integrals.typ": * 
#import "commands.typ": *


// custom functionallty built ontop of typst
#let cLink(dest, content) = link(dest)[($content$)]

#let normSpace(func,space) = $norm(func)_space $

#let cross(func) = $cancel(func,stroke:#(red))$

