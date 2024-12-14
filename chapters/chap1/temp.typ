#import "../../misc/commands/utils.typ": * 
#import "../../misc/packages/packages.typ": *


we have the following asummtions
- $norm(b)_1_(infinity) < infinity$
- $inf c(x) - 1/3 grad b(x) gt.eq c_0 gt.eq 0 $

integration by part rule
$(b dot grad v, w)_Omega = -(v,b dot grad w)_Omega - (grad dot b v, w)_Omega + (b dot n v, w)_Gamma $

The abouve roule also holds in the following case

$(b dot grad v, w)_element = -(v,b dot grad w)_element - (grad dot b v, w)_element + (b dot n v, w)_(diff element) $


using the fact that $a(v,v) gt.eq c_0 norm(v)_Gamma^2 
+ 1/2 norm(b dot n) $ MANGLER INFO OM NORMEN

Derivation of the central flux formulation
we wish to replace o

$V arrow V_h = #dgPolynomialSpace$

we take $v_h, w_h in #dgPolynomialSpace $ here we drop the h, but the formulation is for the dicrete case

$
(b dot grad v, w)_element 
= sum_(#allElements) (-(v,b dot grad w)_element 
- (grad dot b v, w)_element)
+ (b dot n v, w)_(diff element)
$


image of trinagles here 

$
= -(v,b dot grad w)_element - (grad dot b v, w)_element + (b dot n v, w)_(boundryFacets)

sum_(allInteriorFacets) ( 
(b dot n^+ v^+, w^+) + (b dot n^- v^-, w^-)) \ 
= "I" + "II" + sum_(allInteriorFacets) (b dot_f [v w])_facets 
$


$ (b dot grad v, w)_Omega = -(v,b dot grad w)_Omega - (grad dot b v, w)_Omega + (b dot n v, w)_(Gamma) \
+ (b dot n_F {v}[w])_(interiorFacets)
+ (b dot n_F {w}[v])_(interiorFacets) 
$


the coereivty idea was $ (b dot grad v, w)_Omega 
= 1/2 (b dot grad v,w)_Omega + 1/2(b grad v,w)_Omega \
= 1/2 (b dot grad v,w)_Omega - 1/2 (v,b dot grad w)_Omega 

-1/2(grad dot b v, w)_Omega + 1/2 (b dot n v, w)_Gamma 
+ (b dot n_F {v},[w])_(interiorFacets) + (b dot n_F [v],{w})_(interiorFacets) = *
$

how to design a_h ?

$a_h(v,w) = (b dot v, w)_Omega + (c v,w)_Omega - (b-dot v, w)_(Gamma^-)$





