#import "../../misc/commands/utils.typ": * 
#import "../../misc/packages/packages.typ": *
 
We start of by motivating why DG methods are of intresst. The inital conseption of a dg methodd were infact to handle advection problems. In this class we will use it on $b dot grad u + c u$. Simplex mesh $cal(T)_h = {T}_h "is sharp regular"$

#grid(
  columns:3,
  gutter:2mm,
image("../../misc/images/stor_trekant.jpg", width: 100%),
image("../../misc/images/liten_trekant.jpg", width: 100%),
image("../../misc/images/mindre_trekant.jpg", width: 100%),
)

The Ball has has radius $rho_T$, We wish to aviod elemets that make $rho_t$ too small such as  the two last images. We wish to keep the following ratio $h_T/rho_T lt.eq c fASpace T in cal(T)_h$ 

#lemma("h-scaled union of trace equality")[

T is form regular requries that all T in $cal(T)_h$ is form regular. Then $v in H^1(T) "then" exSpace c "indepent" $ $"of" T "st"$
  $norm(v)_(diff T) lt.eq hat(C)(sqrtMinus(h)_T norm(v)_T + sqrt(h_T) norm(grad v)_T ) $

]
where $norm(v)_(diff T) = sqrt((int_(diff T) V^2))$


#corollary[

  $norm(dn V)_(diff_T) lt.eq hat(C)(sqrtMinus(h) norm(grad v)_T + 
  sqrt(h) norm(D^2 v)_T )$ where D is a hessian
]

#lemma("inverse estimate")[

$cal(T)_h "sharp regular" fASpace T in {cal(T)_h} \ 
v_h = {v_h in l2Omega, v_h|_T in PP(T) space fASpace T in cal(T)_h}
= PP_k (cal(T)_h)
$
  $ norm(dn u_h )_(facets) lt.eq C h^(-1/2) norm(grad u_h)_element $ 
]
 
since $v_h$ is not in c (not contnouse), the function does not need to be contnouse globally and therefore might look like the following  

img 

For discrete spaces we have the following inequallity $norm(grad v_h) lt.eq C h^(-1)norm(v_h) $ whis is very similar to poincare inequalty but with the inequlatiy fliped.

