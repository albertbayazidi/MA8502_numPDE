#import "../../misc/commands/commands.typ": * 

Motivation: we wish to solve fluid dynamical equations. To do this advection will be centrel in propagating inital condtions and sutch.

$diff_t u + u dot gradient u - v laplace u + & gradient p = f \
 & gradient dot u = 0 $

We start of by lineariztion, and introducing timestepping. This will results in the following

$sigma u + b dot gradient u - v gradient u + gradient p = f \ 
gradient dot u = 0$

in some cases the impact of the speed $gradient u$ could be more dominating then the viscity $v gradient u$ lets look at a model probelm where this is the case.

(as a side note the first eqaution is a saddle point probelm and one could also look at a model problem for this too. This could be called stokes problem.)

=== advection-diff-reaction

$sigma u + b gradient u - v laplace y = f  "and some bc" $


we will be looking at each of these model problems seperatily and build up to solving the real navir stokes. 


(Det som står over skal skrives om. tanken her er å vise at man kan skrive om nativer stokes til flere små oppgaver)


== ADR problem

=== Model probelm

$ epsilon laplace u + b gradient u + c u = f "in" Omega \
u = 0 "on" diff Omega$

$b : Omega arrow RR^n "advection" \
epsilon > 0 "diffusivity"
c : Omega arrow RR "reaction term"$


typical assumtion are that 
- $epsilon << norm(b)_(#lInfOmega),  norm(c)_(#lInfOmega) << norm(b)_(#lInfOmega)$

- $"div" b = 0 "alteratively", c(x) - 1/2 gradient dot b(x) gt.eq c_0 $

As $epsilon$ gets smaller we can ignore it, we get the reduced probelm
$b dot gradient u + c u = f$ this will introduce a probelm with the bc since we no longer have a second order term. also as epsilon goes to zero the problem becomes similar to a problem that can be solved by the method of characterisics. From the method of characterisics we know that the boundry condtions are only needed on the inflow boundry.


the invered pointing blue curves can be written as. $Gamma^- = {x in diff Omega | b(x) dot n(x) < 0}$

while the outword going blue curves can be written as $Gamma^+ = {x in Gamma | b(x) dot n(x) > 0}$

$Gamma^0 = { x in Gamma : b(x) dot n(x) = 0$

SETT IN BILDE


=== weak formulation of ADR

Strong form
$ epsilon gradient u + b laplace u + c u = f "in" Omega \ u = 0 "on" Gamma $

Natrual weak formulation

$ "Find" u in #H10 "st" #faspace v in #H10 \ 
underbrace(a(u,v),(gradient u, gradient v )_Omega + (b gradient u,v)_Omega + (c u,v)) = l(v) $

Lax - milgram 

$norm(a(u,v)) lt.eq c norm(u)_(V_0) norm(v)_(V_0) #faspace v ,u $ 

$a(u,u) gt.eq alpha norm(u)^2_(V_0) #faspace y in V_0 $

we are going to use the following norm. $norm(v)_(V_0) = norm(gradient v)_Omega #faspace v in #H10$

- coercivity $ u in #H10$

$a(u,v) = epsilon norm(gradient u)^2_Omega + (b gradient u, u) + (c u ,u)$

using gauss theorem.

$integral_(diff u) (b u v ) dot n = integral_Omega gradient dot (b u v ) = integral_Omega gradient dot b u v + integral_Omega b dot gradient u v + integral_Omega u b dot gradient v $ 

moving over some term we get the following

$(b gradient u , v)_Omega = - (u, b dot gradient v)_Omega - (gradient dot b u, v)_Omega + (b dot n u, v)_Gamma$

earlyer we assumed that $div b = 0$ aslo $u,v in #H10$ we can therefoe cross some terms 

$(b gradient u , v)_Omega = - (u, b dot gradient v)_Omega$

and this is skew symmetric $ arrow (b dot gradient u, u) = 0$
This is only works if our assumtion of div b = 0 is ture. however in some cases this might not be true.

we will use a trick to rewrite this as a sum of a skrew symetric part and a symetric part.

$( b gradient u, v ) = 1/2 (b gradient u,v)_Omega + 1/2 (b gradient u,v)_Omega $

SKRIV AV BILDE HER


Boudednes 
 $a(u,v) = epsilon(gradient u , gradient v)_Omega + (b gradient u,v)_Omega + (c u ,v )_Omega$
use cashy swartz on everything more or less


$ lt.eq epsilon norm(gradient u) norm(gradient v) + norm(b)_#lInfOmega norm(gradient u)_Omega norm(v)_Omega + norm(c)_#lInfOmega norm(u)_Omega norm(v)_Omega $
using pointcare on the terms that are not in the energy norm. (used om the onces that are not in Omega) 

$ lt.eq epsilon norm(gradient u) norm(gradient v) + norm(b)_#lInfOmega norm(gradient u)_Omega C_p norm( gradient v)_Omega + C_p^2 norm(c)_#lInfOmega norm( gradient u)norm(gradient v) $

Sjekk bilde her

Cea's $arrow  norm(u-u_h)_V lt.eq C/alpha inf norm (u-v_h)$


$norm(u-u_h)_V lt.eq epsilon + norm(b)_#lInfOmega C_p + norm(c)_#lInfOmega C^2_p = 1 + (norm(b) C_p)/(epsilon) + (norm(u) C_p^2)/(epsilon) $

