//constants
#let fASpace = $space forall space$

#let exSpace = $exists space$

#let grad = $gradient$

#let int = $integral$

#let dn = $diff_n$

#let inf = $infinity$

//Spaces

#let lInf =$L^(infinity)$

#let lInfOmega = $L^(infinity)(Omega)$

#let l2 = $L^(2)$

#let l2Omega = $L^(2)(Omega)$

#let H1 = $H^1$ 

#let H1Omega = $H^1(Omega)$ 

#let H10 = $H^1_0(Omega)$

#let dgPolynomialSpace = $PP_k (cal(T)_h)$

#let element = $cal(T)_h$

#let allElements = $T in #element$ 

#let facets = $cal(F)_h$ 

#let interiorFacets = $cal(F)^i_h$ 

#let boundryFacets = $cal(F)^b_h$ 

#let allInteriorFacets = $F in interiorFacets$

#let allBoundryFacets = $F in boundryFacets$

//functions
#let diffN(order, func, variable) = $(diff^(order) func )/(diff variable^order)$

#let normOmega(func) = $norm(func)_Omega $

#let norm2Omega(func) = $norm(func)^2_Omega $

#let norm2La(func) = $norm(func)^2_l2 $

#let norm2LOmega(func) = $norm(func)^2_l2Omega $

#let Wspace(derivatives,bounded) = $W^(derivatives,bounded)$

#let sqrt(func) = $func^(1/2)$

#let sqrtMinus(func) = $func^(-1/2)$

//test problems
#let poissonProb = $ -laplace u &= f "in" Omega \ u &= u_D "on" diff Omega $

#let advectionReaction = $ cases(
  b dot grad u + c u = f in Omega,
  u = g "on" Gamma^-
) $



