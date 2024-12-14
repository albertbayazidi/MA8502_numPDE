#import "../../misc/commands/utils.typ": * 
#import "../../misc/packages/packages.typ": *

#let b = $bold(b)$

The model problem will of corse  be the steady state advection reacion problem

Strong form
$ advectionReaction $

Assumtion: $c in lInf "," space #b in [Wspace(1,inf)]^d , space "inf"(c-1/2 grad dot #b) gt.eq c_0 gt 0 $ <assumptions_advection_reaction>

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
  $ a(u,v) gt.eq c_0 norm2LOmega(v) + 1/2normSpace(sqrt(abs(b dot n)) v,Gamma)   $
]

Proof
This follows from thre facts
+ $innerOmega(#b dot grad u,v) = $
+ $(#b dot grad u ,v) = 1/2 ( #b dot grad u,v) + 1/2 (#b dot grad u, v) $
+ and lastly our #cLink(<assumptions_advection_reaction>, "assumptions") on c and #b 

