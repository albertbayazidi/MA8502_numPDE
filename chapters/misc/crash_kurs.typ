#import "../../misc/commands/commands.typ": * 


FEM er en underkategori av galerkin metoder. Ta utgangspunkt i en sterk formulering $A u = f$ Sterk formulering er en formulering av ligningene hvor man krever at alle de deriverte eksisterer i alle punkt. 

Eksempel Possion 

$ 

-laplace u &= f faspace x in Omega \  
      u(x) &= -1 faspace x  in delta omega  
$ 
- (kontinuerlig) svak formulering 
$ 
-#integralOmegaFun($laplace u v$) = #integralOmegaFun($f v$) 
$ 
(bruker delvis integrasjon) på $laplace u$ og at $gradient dot ( gradient u v ) = laplace u v + gradient u gradient v$ 
$ 

-#surfaceIntegralOmegaFun($gradient dot ( gradient u v )$) + #integralOmegaFun($gradient u gradient v$) = #integralOmegaFun($f v$) 

$ 

første ledet forsvinner fordi grensebetingelsen vår er 0 og vi ender opp med. 

$ 
#integralOmegaFun($gradient u gradient v$) = #integralOmegaFun($f v$) 
$ 

som vi kan formulere som finn $u in H^1_0(Omega) {u | u in L^2(Omega), gradient u in [L^2(Omega)]^d space space  gradient u |_(diff Omega) = 0} faspace v in V $ (vanlig valg for V er $H^1_0$) 
$ 

underbrace(#integralOmegaFun($gradient u gradient v$),"a(u,v)") = underbrace( #integralOmegaFun($f v$),"l(v)") 

$ 

3) (Diskrete) svak formulering 

$V_0 arrow V_(h,0)(subset.eq V_0)$, hvis den dikretiserte versjonen av rommet V er et underom vil det kalles for "conform" vi vil se på tilfeller hvor dette ikke alltid er tilfellet. $v arrow v_h,$ 

vi kan nok engang skrive om ligningen, Finn $u in V_h  "st" a(u,v_h) = l(v) faspace v_h in V_h  $   

Siden det finnes en basis for u og v kan vi skrive om u og v til en lineær kombinasjon av disse basisene. $v_h = sum^N_(j=0) V_j phi, space V_(h,0) = s p a n ({phi})$ 

skriver om $a$ til å bruke den lineære summen for v 

$
a(u, sum^N_(i=0) V_i phi_i) = sum^N_i V_i space l(phi_i) faspace v in V
$

siden a er en lineær operator (er bare et integral) så kan vi trekket ut summen og $V_i$,vi får da $sum_i V_i a(u,phi_i) = sum^N_i V_i space l(phi_i) faspace v in V$ vi gjentar dette for u 


$
sum_(i j) V_i U_j space underbrace(a(phi_j,phi_i),A_(i j)) = underbrace(l(phi_i), F_i) faspace v in V
$
siden dette må gjelde for alle V er dette ekvivalent med 

$
A u = F
$

basisen (phi) man velger bestemer utsende på A matrisen vår. 

== Abstract theory 
- propositon (galerkin orthogonalty)

antar følgende, v_h subset v (conform), u solves the continoues weak fomulation, u_h solves the discrete weak fomulation then $a(x, v_h) = l(v_h)$ for x som u og u_h. Dermed hvis man tar en lineær kombinasjon $u-u_h$ vil man få følgende $a(u-u_h,v_h) = 0$

- Cea's lemma (quasi best appoximation property)
same antagelser gjelder her også, ser vi på normen mellom den samme løsningen og approxmiasjonen vår får vi at det er begrensert oven ifra med test funcksjoen v. 

$
norm(u-u_h)_a lt.eq C/alpha norm(u-v_h)_a
$

(hvor norm_a i possion tilfellet er $norm(gradient (dot))$ ). Her kommer c og alpha fra lax milgram.

Om l er begrenset, a er bilinær (linær i både u og v) bounded og coercive eksisterer det en løsning til $A u=F$

Her står det litt om hva det menes med bounded og coercive for a

- bounded 
$a(u,v) lt.eq C norm(u)_a norm(v)_a faspace u,v in V$

- corcivty
$exists space alpha > 0 "st" a(u,u) gt.eq norm(a)^2 faspace v in V$





