#import "../../misc/packages/packages.typ": *
#show: thm-rules

=== Bevis (Cea's lemma)

 $u$ og $u_h$ er begge i $V$, dermed vil også en liære kobo også være det. Vi kan dermed bruke egenskapene nevte over.

$ alpha norm(u-u_h)^2_a  & underbrace(lt.eq,"coesiverty") a(u-u_h,u-u_h )  \ 
& lt.eq a(u-u_h,u-u_h -v_h + v_h) \
& eq a(u-u_h,u-v_h) + underbrace(a(u-u_h,v_h-u_h)," = 0 bc galerkin orthogonalty") \
& eq a(u-u_h,u-v-h) \
& underbrace(lt.eq,"Bounded") c norm(u-u_h)_a norm(u-v_h)_a
$
Krysning av det kvadrerte leddet og det siste leddet gir oss det resultatet vi ønsker.




#definition(name: "A Finite Element", numbering: none)[
q  A FEM is a tuple (T,P,$Sigma$), \
  where \
  - T is a simplex. (polyheadron)
  - P is a finite dimentional function space defined on T (polynomials,trigonometric functions)
  - $Sigma = {sigma_1,sigma_2,...,sigma_n}$ is a basis for the dual space of P' 
]

The last one is somewhat confussing but it basicly one usally refers to them as degrees of freedom. Sigma could be the nodal values, it could also be nodal + midpoint values. This depends on what kind of sapce P is. (linear, qudratic). #link("https://www.youtube.com/watch?v=PSYgACnqsOs")[Link to video that does a good job explaing some of this.]
