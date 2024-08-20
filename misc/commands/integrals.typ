// surfaceIntegrals

// TEST#let integralOmegaFun(function,centered: false) = {
//set align(centered) if centered
 // [$integral_(Omega) function$]
//}

#let integralOmegaFun(function,centered: false) = {
  if centered [
    $
    integral_(Omega) function
    $
]else [$integral_(Omega) function$]
}

#let integralBoundFun(bound, function,centered: false) = {
  if centered [
    $
    integral_(bound) function
    $
]else [$integral_(bound) function$]
}


// surfaceIntegrals
#let surfaceIntegralOmegaFun(function,centered: false) = {
  if centered [
    $
    integral_(diff Omega) function
    $
]else [$integral_(diff Omega) function$]
}

#let surfaceIntegralBoundFun(bound, function,centered: false) = {
  if centered [
    $
    integral_(diff bound) function
    $
]else [$integral_(diff bound) function$]
}

