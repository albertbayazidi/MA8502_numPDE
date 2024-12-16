#import "../../misc/commands/utils.typ": * 
#import "../../misc/packages/packages.typ": *

Given the poisson problem we wish to solve it using dg. The formulation becomes
#poissonProb 
Find $u_h in v_h polynomialSapceElement fASpace v_h in V_h "st" a_h(u_h,v_h) = l_h(v_h)$


we can't just move over a gradient from u to v as we have done before.v_h is not contiuouse over from one elemet to another. Lets assume $u in H^2(Omega)$ in additon we now proform integraion by part over each element and not the whole domain. 

$ (f,v_h)_Omega = (-laplace u, v_h)_Omega = sum_(#allElements) 
-(dn u,v_h)_(diff T) + sum_(#allElements) (grad u,grad v)_T
$

the $dn$ term can be fourther split into two part working on diffrent typs of elements. 

Image of more traingles

Image of trainges side by side T+ T-

from the image we see that some facets are so called intiroir and others are boundry facets. We can therefore split the $dn$ term further as sutch 

$ sum_(allBoundryFacets) -(dn u,v_h)_F - sum_(allInteriorFacets)
(int_F (grad u^+ dot n^+ v_h^+ + grad u^- dot n^- v_h^- ))
$

the above term can be somewhat factorized 


$ 
= (grad u , grad v)_T_h - (dn u,v_h)_(boundryFacets)
- sum_(allInteriorFacets) (n_F dot underbrace((grad u^- v_h^- - grad u^- v_h^-),[grad u,v_h]))
$
We introduce the notion of a mean ${a} = 1/2 (a^+ + a^-)$ this will be equal to a if a is contiuouse. Using the mean in the jump we get this new magic fomula. 
$[a b] = {a}[b] + [a]{b}$

with this new fomula we can once again rewrite the function.

$ (grad u, grad v_h)_(element) - (dn u,v_h)_(boundryFacets) 
- sum_(allInteriorFacets) int_F n_F dot ({grad u}[v_h] +
[grad u]{ v_n}) $
$ "Where" [grad u ] = 0 "since" u in H^2$


we now wish to move from u and over the the discete $u_h$. However our a is no longer bilinear as its symetry has been removed. We fix this by adding term that makes the sum symetric while keeping it consistant.

$ (grad u_h, grad v_h)_(element) - (dn u_h,v_h)_(boundryFacets) - ({dn u_h}[v_h])_(interiorFacets) - (u_h-u_d,dn v_h)_(boundryFacets) = (f,v_h)_Omega $



to make $({dn u_h}[v_h])_(interiorFacets)$ sumetric we add $([u_h]{dn v_h})_(interiorFacets)$ once agian $[u_h] = 0$ since $u in H^2$ 


still this is not stabill. we will add some stabilastion terms.

$ a_h(u_h,v_h) = (grad u, grad v_h)_(element) - (dn u_h, v_h)_(boundryFacets) - (dn v_h,u_h)_(boundryFacets) - ({dn u_h}[v_h])_(interiorFacets) - ({dn v_h},[u_h])_(interiorFacets) 
\ + gamma (h^(-1)_T u_h,v_h)_(boundryFacets) + gamma (h^(-1)[u_h][v_h])_(interiorFacets) = (f,v)_Omega - (u_d, dn u_h)_(boundryFacets) + gamma(h^(-1) u_D v_h)_(boundryFacets)
$

To aboid writting so much we introduce some notation. Since jumps and means only exists on faces. We introduce the following
- $[u_h] = u_h$
- ${dn u_h} dn u_h$

resulting in a new formulation

$ (grad u, grad u)_element - ({dn u_h},[v_h])_facets - ([u_h],{dn v_h})_facets + gamma(h^(-1)[u_h],[v_h])_facets  $

SIP is not confiming, meaning $V_h subset.not H10$. This is bad since galerkin orthogonality requires this. However this is ok since SIP is consistant if $u in H^2(Omega)$ and so both u_h and u can solve $a_h(u,v) = l_h(v_h).$

let's check if SIP is well posed. looking at the coervity set $u_h=v_h$
$ a(u_h,u_h) = underbrace((grad u, grad u)_element,norm(grad u)^2_(element)) - 2 ({dn u_h},[u_h])_(#facets) + gamma underbrace((h^1[u_h][u_h])_facets,
  norm(sqrtMinus(h)[u_h])^2_(facets))  $

let the middel term be named I. We wish to rewrite it. 

$ I lt.eq 2 norm({dn u_h})_facets norm([u_h])_facets $

using the inverse inequality on first term

$ 2 sqrt(h)/sqrt(h) c_xi c norm({grad u_h})_element norm([u])_facets  
$

using youngs inequalty. $ 2 sqrt(delta) a b/(sqrt(delta))  lt.eq delta a^2 + 1/delta b ^2 $

$ lt.tilde delta c_xi^2 norm(sqrt(h) grad u_h )^2_element + delta^(-1) norm(sqrtMinus(h) [u_h])  $

inserting this back into $ a_h(u_h,u_h) gt.tilde norm(grad u_h)^2_element - delta C^2_(xi) norm(grad u_h)^2_element 
- delta^(-1) norm(sqrtMinus(h)[u_h])^2_facets + gamma norm(sqrt(h)[u_h])_facets $

choose $delta$ st $(1-delta c^2_(xi)) gt.eq 1/2$


$ 1/2 norm(grad u_h)^2_element + (gamma - delta^(-1)) 
norm(sqrtMinus(h) [u_h])^2_facets $
and $gamma "st" (gamma - delta^(-1)) gt.eq gamma/2 $

$ 1/2 norm( grad u_h)^2_element + gamma/2 norm(sqrtMinus(h) [u_h] )^2_facets =: norm(u_h)^2_a_h $

this is a a mesh dependent norm


#lemma[

  the bilinear $a_h (dot,dot)$ is coercive on $V_h$ wrt $norm(v_h)_(a_h) := (norm(grad u_h)^2_element + gamma norm(sqrtMinus(h) [u_h])_facets^2)^(1/2) $

]


#lemma("cea's lemma for SIP")[

 $ norm(u-u_h)_(a_h) lt.eq c/alpha inf norm(u-v_h)_(a_h) $ 

]

Idea $u-u_h = underbrace(u-v_h,e_h) + underbrace(v_h - u_h,V_h), "where" v_h = pi_h u$


will now use discreete coervity on $v_h - u := e_h "," space u - v_h 
: = e_ pi $


$

1/2 norm(u_h - v_h)^2_(a_h) 

&lt.eq a(u_h - v_h, e_h) \

& underbrace(lt.eq,u in H^2) a(u_h-v_h + u - u, e_h) \ 

& = underbrace(a(u_h - u, e_h), = 0 "since" u in H^2) + a(u-v_h,e_h) \

& lt.eq a(u-v_h,e_h) \

& = (grad(u-v_h), grad e_h )_element - ({dn (u-v_h)},[e_h])_facets \
& - ({dn e_h},[u-u_h])_facets + gamma (h^(-1)[u-u_h],[e_h])_facets \

& = (grad(u-v_h), grad e_h )_element - (sqrt(h){dn (u-v_h)},sqrtMinus(h)[e_h])_facets \
& - (sqrt(h){dn e_h},sqrtMinus(h)[u-u_h])_facets + gamma (h^(-1)[u-u_h],[e_h])_facets  
$

since we have
$norm(sqrt(h){dn v})_facets^2 lt.eq C norm(grad v)^2_element$

$ 1/2 norm(u_h - v_h)^2_(a_h) 
& underbrace(lt.eq,"CS") 
norm(grad(u-v_h))_element norm(grad e_h )_element 
- norm(sqrt(h){dn (u-v_h)})_facets norm(sqrtMinus(h)[e_h])_facets \

& - norm(sqrt(h){dn e_h})_facets norm(sqrtMinus(h)[u-u_h])_facets 
+ gamma norm(sqrtMinus(h)[u-u_h])_facets norm(sqrtMinus(h)[e_h])_facets  \

& "rearanging terms so that we can constuct" 
norm(v)_a_h := norm(grad v) + gamma norm(sqrtMinus(h)[v]) \
$

$
& "should add intermidet step here" \

& "further rearanging the terms we can get the following norm" 
norm(v)_a_(h*)^2 := norm(v)_a_h^2 + norm(sqrt(h){dn_v})_element^2 \
$


$ 1/2 norm(u_h - v_h)^2_(a_h) 
&lt.eq 
C norm(u-v_h)_a_(h*) norm(e_h)_a_(h*) \ 
& "we have that" norm(.)_a_(h*) ~ space norm(.)_a_h  $
$ 1/2 norm(u_h - v_h)^cross(2)_(a_h) 
lt.eq hat(C) norm(u-v_h)_a_(h*) cross(norm(e_h)_a_(h)) $

$ 1/2 norm(u_h - v_h)_(a_h) lt.eq hat(C) norm(u-v_h)_a_(h*) $


== Apiori error estimate for SIP

$ norm(v_h)_a_h = sqrt((norm(grad v)^2_element 
+ gamma(sqrtMinus(h)[v_h])^2_facets)) fASpace v in polynomialSapceElement $

$ norm(v_h)_a_h =sqrt(( norm(grad v)^2_element 
+ gamma(sqrtMinus(h)[v_h])^2_facets)) fASpace v in polynomialSapceElement $



