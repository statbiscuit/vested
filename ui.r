## ui.R ##
## Virtual Experiments to Teach Experimental Design
## remotes::install_github("JohnCoene/typed")
library(typed)
fluidPage(
    title = "VEsTED",
    ## CSS style file
    includeCSS("www/style.css"),
    ## title
    h1("Choose your virtual experiment"),
    ## R package for typed.js
    typed(list(h2("randomisation"),h2("blocking"),h2("replication")), typeSpeed = 100, loop = TRUE),
    ## Buttons for each experiment
    div(id = "egg", class = "mid",actionButton("",img(src = "img/chick.png"),class = "egg_btn")),
    div(id = "tomato", class = "mid",actionButton("",img(src = "img/tomato.png"),class = "tomato_btn")),
    div(id = "pimpkin", class = "mid",actionButton("",img(src = "img/pumpkin.png"),class = "pumpkin_btn"))
)
