#' Simulation function for the "tomato"
#' example given in "A Sequence of Games Useful in Teaching Experimental Design to Agriculture Students"
#' K. H. Pollock, H. M. Ross-Parker and R. Mead
set.seed(1234)
means <- c(18.1,17.9,20.1,19.9,22.1,21.9,23.1,22.9,
           22.1,21.9,29.1,23.9,26.1,25.9,27.1,26.9)
yield <- c(sapply(means, rnorm, n =  10))
data <- data.frame(yield = yield,
                   side = rep(c("North","South"), each = 80),
                   heat = rep(rep(c("Natural","Supplemented"), each = 40), times = 2),
                   light = rep(rep(c("Ambient","Controlled"),each = 20),times = 4),
                   variety = rep(rep(c("Cherokee Purple","Indigo Rose"), each = 10), times = 8))
library(ggplot2)
ggplot(data, aes(y = yield, x = heat, fill = variety)) + geom_boxplot() +
    facet_wrap(~ light + side) + labs( fill = "Variety") + ylab("Yield (kg)") +
    scale_fill_brewer(palette = "Dark2") + xlab("Heat level")

mod <- lm(yield ~ side + heat*light + variety, data = data)
summary(mod)
