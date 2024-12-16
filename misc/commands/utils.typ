#import "integrals.typ": * 
#import "commands.typ": *


// custom functionallty built ontop of typst
#let cLink(dest, content) = link(dest)[($content$)]

#let cross(func) = $cancel(func,stroke:#(red))$

// Norms

#let norm2(func) = $norm(func)^2$

#let normSpace(func,space) = $norm(func)_space$

#let norm2Space(func,space) = $norm(func)_space^2$ 

#let normInf(func) = $norm(func)_inf$

#let normOmega(func) = $norm(func)_Omega$

#let norm2Omega(func) = $norm(func)_Omega^2$

#let norm2L2(func) = $norm(func)_l2^2$

#let norm2L2Omega(func) = $norm(func)_l2Omega^2$

