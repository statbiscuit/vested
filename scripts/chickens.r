#' Simulation function for the "chicks"
#' example given in "A Sequence of Games Useful in Teaching Experimental Design to Agriculture Students"
#' K. H. Pollock, H. M. Ross-Parker and R. Mead
#' and
#'  R. Mead (1974) The Use of Computer Simulation Games in the Teaching
#' of Elementary Statistics to Agriculturalists, International Journal of Mathematical Educational in
#' Science and Technology, 5:3-4, 705-712, 

#' Questions to answer
#' 1. What quantity of copper must be added to a maize diet
#' to give maximum growth rate?
#' 2. What quantity of copper must be added to a wheat diet
#' to give maximum growth rate?
#' 3. What is the increase in growth rate obtained for a maize
#' diet with the best quantity of copper (as specified in 1.)
#' compared with no copper?
#' 4. What is the increase in growth rate obtained for a wheat
#' diet with the best quantity of copper (as specified in 2.)
#' compared with no copper?
#' 5. Which diet responds more to copper? (i.e., which diet
#' gives the larger increase in growth rate when copper is
#' added at its best level, compared with no added copper?)
#'
set.seed(1234)

resp <- function(type, copper){
    b0 <- 500
    if(type == "wheat"){
        res = b0  + (2/5)*copper - (1/1500)*copper^2
    }else{
        res = b0 + 10*sqrt(copper) - (1/2)*copper
    }
    return(res)
}
copper <- runif(1000,0,700)
plot(copper, resp("wheat",copper))
abline(h = 500)
abline(v = 0)
points(copper,resp("maize",copper),pch = 20,col = 2)
