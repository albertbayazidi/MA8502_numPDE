#import "../../misc/commands/utils.typ": * 
#import "../../misc/packages/packages.typ": *
#let II = "II"
#let III = "III"
#let b = $bold(b)$
#let timeScale = $tau^(-1)_C$
#let invTimeScale = $tau_C$


We start of by setting some constants and constructing a norm we wish to work with

let $timeScale = norm(c)_infinity + seminormOrder(#b,1 inf)$
and $b_c := normInf(2)$
central flux norm :  $norm2Space(v,"cf") 
=
timeScale norm2Omega(v) 
+ 1/2 norm2Space(sqrt(abs(b dot n))v,Gamma)
$


#lemma($l2 "- coercivity in" normSpace(dot,"cf") "norm" $)[

let $v in H1Omega plus.circle V $ Then
$a(v,v)^("cf") gt.eq min{timeScale, 1} norm2Space(v,"cf")$
]


#proof()[
Start from the #cLink(<cf-3>, "CF-III") since this allows us to only look at the following two terms
$a(v,v)^("cf") &gt.eq 
timeScale invTimeScale inner((c - 1/2 grad dot #b) v, v,Gamma) 
+ 1/2 norm2Space(sqrt(abs(b dot n))v,Gamma) \
&gt.eq min{c_o invTimeScale,1} norm2Space(v,"cf")
  $ 

]
