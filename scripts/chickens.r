#' Simulation function based on the "chicks"
#' example given in "A Sequence of Games Useful in Teaching Experimental Design to Agriculture Students"
#' K. H. Pollock, H. M. Ross-Parker and R. Mead
#' and
#'  R. Mead (1974) The Use of Computer Simulation Games in the Teaching
#' of Elementary Statistics to Agriculturalists, International Journal of Mathematical Educational in
#' Science and Technology, 5:3-4, 705-712.
#' @param x datframe, output from the chick experiment with variables
#' nest (1:32), borrder (1:4), tier (1;4), diet (maize or wheat), copper (unit)
 
sim_chick_growth <- function(x){
    b0 <- 500
    diet <- x$diet
    copper <- x$copper
    ## diet effect
    res <- numeric(512)
    for (i in 1:length(res)){
        if(diet[i] == "Wheat"){
            res[i] = b0  + (2/5)*copper[i] - (1/1500)*copper[i]^2 + rnorm(1,30)
        }else{
            res[i] = b0 + 10*sqrt(copper[i]) - (1/2)*copper[i]  + rnorm(1,30)
        }
    }
    ## brooder effect
    ## brooders 4 "better" (av +50 g) brooder "worse" (av -40g)
    ## no difference brooder 1 and 3
    brood <-  c(replicate(16,rnorm(32,rep(c(0,-40,0,50),each = 8))))
    ## tier effect (v. minimal)
    ## tiers 1 and 2 av +10g, tiers 3, 4 -5g 
    tier <- c(replicate(16,rnorm(32,rep(rep(c(10,10 -5,-5), each = 2), times = 4))))
    res <- res + brood + tier
    return(res)
}
