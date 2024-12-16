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

#let polynomialSapceElement = $PP_k (cal(T))$

#let discPolySpace = $PP^k_("dc") (cal(T))$ 

#let element = $cal(T)$

#let allElements = $T in #element$ 

#let facets = $cal(F)$ 

#let interiorFacets = $cal(F)^i$ 

#let boundryFacets = $cal(F)^b$ 

#let allInteriorFacets = $F in interiorFacets$

#let allBoundryFacets = $F in boundryFacets$

//functions
#let diffN(order, func, variable) = $(diff^(order) func )/(diff variable^order)$

#let Wspace(derivatives,bounded) = $W^(derivatives,bounded)$

#let sqrt(func) = $func^(1/2)$

#let sqrtMinus(func) = $func^(-1/2)$

#let seminorm(val) = $|val|$

#let seminormOrder(val,order) = $seminorm(val)_(order)$

//test problems
#let poissonProb = $ -laplace u &= f "in" Omega \ u &= u_D "on" diff Omega $

#let advectionReaction = $ cases(
  b dot grad u + c u = f in Omega,
  u = g "on" Gamma^-
) $



