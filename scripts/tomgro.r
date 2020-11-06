#' Functions to simulate tomato growth in a greenhouse
#' ideally will extend to  Jones(1991) "A dynamix tomato growth and yield model(TOMGRO)
#' at the moment just a simple non-linear relationship which
#' is likely NOT realistic...
#' @param heat in celcius
#' @param initial initial biomass
#' @param light light intensity
#' @param days days since sowing
#' @param manure nutrients proportions
tomgro <- function(initial,manure, days, heat, light){
    beta <-  manure^(heat * light)
    r <- heat/light
    res <- (initial^(1-beta) + r*days*(1 - beta))^(1/(1-beta))
    return(log(res))
}



