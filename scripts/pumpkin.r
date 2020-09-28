#' Simulation function for the "tomato"
#' example given in "A Sequence of Games Useful in Teaching Experimental Design to Agriculture Students"
#' K. H. Pollock, H. M. Ross-Parker and R. Mead
#' @param x dataframe output from the pumpkin eperiment with
#' variables variety, heat, light, and side.

sim_pumpkin_yield <- function(x){
    means <- c(18.1,17.9,20.1,19.9,22.1,21.9,23.1,22.9,
               22.1,21.9,29.1,23.9,26.1,25.9,27.1,26.9)
    data <- data.frame(variety = rep(rep(c("Kumi Kumi","Buttercup"), each = 1), times = 8),
                       heat = rep(rep(c("Natural","Supplemented"), each = 4), times = 2),
                       light = rep(rep(c("Ambient","Controlled"),each = 2),times = 4),
                       side = rep(c("North","South"), each = 8),
                       means = means)
    idx <- match(data.frame(t(x)), data.frame(t(data[,1:4])))
    res <- means[idx]
    yield <- round(sapply(res, rnorm, n = 1),3)
    return(yield)
}

