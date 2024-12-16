#import "../../misc/commands/utils.typ": * 
#import "../../misc/packages/packages.typ": *
#let II = "II"
#let III = "III"
#let b = $bold(b)$

The model problem will of corse  be the steady state advection reacion problem

Strong form
$ advectionReaction $

Assumtion: $c in lInf "," space #b in [Wspace(1,inf)]^d , space "inf"(c-1/2 grad dot #b) gt.eq c_0 gt 0 $ <assumptions_advection_reaction>

=== weak form
for the weak form we simply  do the following trick $int_gamma (#b dot n)(g-u) = 0$ to derive the following

find $u in V := {v in l2Omega : #b dot grad v in l2Omega} "st" v fASpace V $ 

$ a(u,v) 
&= innerOmega(#b dot grad u, v) + innerOmega(c u, v) + 0 \

&= innerOmega(#b dot grad u, v) + innerOmega(c u, v) + inner((#b dot n) (g-u),v,Gamma^-)  \ 

&= innerOmega(#b dot grad u, v) + innerOmega(c u, v) - inner((#b dot n) u,v,Gamma^-)\
l(u,v) &= innerOmega(f,v) - inner((#b dot n) g,v,Gamma^-)   $  

The method we used here is called Nitsche's method, and it allows us to avoid adding the boundary conditions in a strong form (meaning we can avoid having boundary conditions baked into the space $V$).

For Nitsche's method to work, the function $v$  must have a *meaningful trace* on $Gamma$. The trace operator essentially evaluates the function $v$ on the boundary $Gamma$. A function is said to have a meaningful trace if its restriction to $Gamma$ is well-defined and lies in an appropriate function space, such as $l2(Gamma)$ or $sqrt(W)(Gamma)$. This ensures that the function is sufficiently regular for boundary terms to make sense in the weak formulation. 

*Remark*: In 99% of cases, you don't need to worry about this because the Sobolev trace theorem takes care of it. Essentially, the theorem states that as long as the domain is Lipschitz and the function space is sufficiently regular (e.g., $ H1 Omega$), the trace will be meaningful. Also sometimes one writes that the fucntion $g$ belongs to $w^(1/2)$ and this is sufficiently smooth to have a meaingful trace



#lemma($l2 "- coercivity of" a(dot,dot)$)[

$"For" v in V, "we have that"$
  $ a(u,v) gt.eq c_0 norm2L2Omega(v) + 1/2normSpace(sqrt(abs(b dot n)) v,Gamma)   $
]

#proof[

This proof follows from these three facts.
+ $innerOmega(#b dot grad u,v) =
inner((b dot n) u ,v,Gamma)
- innerOmega(u,b dot grad v )
- innerOmega(grad dot b u,v) $
+ $(#b dot grad u ,v) = 1/2 ( #b dot grad u,v) + 1/2 (#b dot grad u, v) $
+ and lastly our #cLink(<assumptions_advection_reaction>, "assumptions") on c and #b 

$
a(u,v) 
&= innerOmega(#b dot grad u,v) 
+ innerOmega(c u,v) 
- inner((#b dot n) u,v,Gamma^-) \
&= 1/2 ( #b dot grad u,v) 
+ underbrace(1/2 (#b dot grad u, v),inner((#b dot n) u ,v,Gamma)
- innerOmega(u,#b dot grad v ) - innerOmega(grad dot #b u,v))
+ innerOmega(c u,v) 
- inner((#b dot n) u,v,Gamma^-) \
&= 1/2 (( #b dot grad u,v) - innerOmega(u,#b dot grad v ))
+ innerOmega((c-1/2 grad dot #b)u,v)
+ 1/2 inner((#b dot n) u,v,Gamma)
  - inner((#b dot n) u,v,Gamma^-) \
&= "I" + II + III \
$
when u = v the I = 0

$II gt.eq innerOmega(c_0 v,v) > 0$


$III = 1/2 inner((#b dot n) u,v,Gamma) - inner((#b dot n) u,v,Gamma^-) 
= 1/2 inner((#b dot n) u,v,Gamma^+) 
- 1/2 inner((#b dot n) u,v,Gamma^-) 
= inner((abs(#b dot n)) u,v,Gamma)$

]<l2-coercivity-of-a>


=== Derivation of the central flux formulation

For reasons that will be clear later, we will be using $discPolySpace = V_h$. Since we are in the space of discontinuous elements, we can no longer perform integration by parts over the whole domain, but we instead have to do so on each element.

This means that 

$ innerOmega( #b dot grad v, w)  &= sum_allElements inner(#b dot grad  v, w,element) \ 
&= sum_element ( 
- inner(v, #b dot grad w,element ) 
- inner(grad dot #b v, w,element ) 
+ inner(#b dot n_(partial element)v,w,partial element)) \ 
&=  
- innerOmega(v, #b dot grad w) 
- innerOmega(grad dot #b v, w) 
+ sum_allElements 
inner(#b dot n_(partial element)v,w,partial element)   
$

"On all interior facets, we get two contributions: one from the $T^+$ and one from the $T^-$."
add image

Thus 
$
sum_allElements 
inner(#b dot n_(partial element)v,w,partial element) &= 
sum_interiorFacets ( inner(#b dot n_(facets) v^+,w^+,facets) 
- inner(#b dot n_(facets) v^-,w^-,facets))
+ sum_boundryFacets inner(#b dot n_(facets) v,w,facets) \ 
&= 
sum_interiorFacets inner(#b dot n_facets,[v w],facets)
+sum_boundryFacets inner(#b dot n_(facets) v,w,facets)  \
&=
innerPartialOmega(#b dot n v,w) 
+ sum_allInteriorFacets (inner(#b dot n_facets {v},[w],facets)
+inner(#b dot n_facets [v],{w},facets) )
$
In total we get 
$

innerOmega(#b dot grad v,w) 
&= -innerOmega(v, #b dot grad w)
+ innerOmega(grad dot #b v, w) 
+ inner(#b dot n v,w,Gamma)
+ inner(#b dot n {v},[w],interiorFacets)
+ inner(#b dot n [v],{w},interiorFacets)

$

Let's insert the above form into the coercivity and apply the same #link(<l2-coercivity-of-a>)[tricks], 

$
= underbrace(
1/2 (( #b dot grad u,v) 
- innerOmega(u,#b dot grad v ))
+ innerOmega((c-1/2 grad dot #b)u,v)
  ,I) \
+ underbrace(
1/2 inner((#b dot n) u,v,Gamma)
  - inner((#b dot n) u,v,Gamma^-),II) \
+ underbrace(
 inner(#b dot n {v},[w],interiorFacets)
+ inner(#b dot n [v],{w},interiorFacets)
  ,III)

$
setting v = w

$ I gt.eq innerOmega(c_0 v, v) gt 0 \
II = 1/2 inner(abs( #b dot n)v,v,Gamma) gt.eq 0 \
III = inner(#b dot n {v},[v],interiorFacets) "witch leavs us stuck as there the sign in not determened"$

Our way of getting around this problem of having a term we are unable to estimate in a norm is similar to the Nitsche method. We will once again add zero. This time, we add zero by adding the term $-inner(#b dot n [v],{w},interiorFacets)$ This term is, in fact, zero as long as we assume $ v in H1Omega$. With the last term added, we can finally write out the central flux formulation as

$
a(u,v)^("cf") &= innerOmega(#b dot grad u,v)
+ innerOmega(c u,v)
- inner(#b dot n u,v,Gamma^-)
- inner(#b dot n [u],{w},interiorFacets) \
&= innerOmega(f,v) - inner(#b dot n g,v,Gamma^-) = l(v)
$<cf-1>

There are other CF formulations as well, such as

$
a(u,v)^("cf") = -innerOmega(u,#b dot grad v)
+ innerOmega((c - grad dot #b) u,v) + inner(#b dot n u,v,Gamma^+)
- inner(#b dot n {u},[w],interiorFacets) = l(v)
$<cf-2>

And lastly, when we take half of each formulation, we get the CF-III. CF-III has the nice property of being nicely split into the symmetric and skew-symmetric parts.

$
a(u,v)^("cf") = a(u,v)^("s") + a(u,v)^("sk") \
a(u,v)^("s") = innerOmega((c - 1/2 grad dot #b)u,v)
+ 1/2 inner(abs(#b dot n) u,v,Gamma) \
a(u,v)^("sk") = 1/2 (innerOmega(#b dot grad u,v)
- innerOmega(u,#b dot grad v)
- inner(#b dot n [u],[w],interiorFacets) 
+ inner(#b dot n {u},[w],interiorFacets)
)
$<cf-3>

Being able to split aa into a skew-symmetric and a symmetric part is nice when one wants, for example, to check if the matrix constructed from aa is SPD, as you would only need to look at the symmetric part. A more useful aspect is that when determining if the scheme is coercive, it is enough to just check the symmetric term.
