## ui.R ##
## Virtual Experiments to Teach Experimental Design
## remotes::install_github("JohnCoene/typed")
library(typed)
library(shiny)
library(shinyjs)
library(shinyWidgets)
fluidPage(
    ## set up shinyjs
    useShinyjs(),
    title = "VEsTED",
    ## CSS style file
    includeCSS("www/style.css"),
    div(id = "landing_page",
        ## title
        h1("Choose your virtual experiment"),
        ## R package for typed.js
        typed::typed(list(h2("randomisation"),h2("blocking"),h2("replication")), typeSpeed = 100, loop = TRUE),
        ## Buttons for each experiment
        div(id = "tomato", class = "mid",
            actionButton("tomato_butt",div(class = "container",img(src = "img/tomato.png"),
                                           div(class = "overlay",
                                               h3("Is horse manure"), h3("the age-old miracle"), h3("grow?"))),
                         class = "tomato_btn")),
        div(id = "egg", class = "mid",
            actionButton("chick_butt",div(class = "container",img(src = "img/chick.png"),
                                          div(class = "overlay",
                                              h3("Chooks favourite foods"))),
                         class = "egg_btn")),
        div(id = "pumpkin", class = "mid",
            actionButton("pump_butt", div(class = "container",img(src = "img/pumpkin.png"),
                                          div(class = "overlay",
                                              h3("Esther and Gwenllian"), h3("want to know who"),
                                              h3("reigns supreme"), h3("pumpkin growing"))),
                         class = "pumpkin_btn"))
        ),
    ## Hidden experiment pages
    ## Tomato
    shinyjs::hidden(div(id = "experiment_page_tomato",
               div(id = "back_to_landing_tom", 
                   tags$a(class="btn btn-primary", icon("arrow-left"), h4("Back to landing page")),
                   h1("Tomato experiment")
                   ))),
    ## Chicken
    shinyjs::hidden(div(id = "experiment_page_chick",
               div(id = "back_to_landing_chick", 
                   tags$a(class="btn btn-primary", icon("arrow-left"), h4("Back to landing page")),
                   h1("Chicken experiment")
                   ))),
    ## Pumpkin
    shinyjs::hidden(div(id = "experiment_page_pump",
               div(id = "back_to_landing_pump", 
                   tags$a(class="btn btn-primary", icon("arrow-left"), h4("Back to landing page")),
                   div(class = "info",dropdownButton(h4(textOutput("txt")),
                                                     status = 'info', icon = icon('info'))),
                   h1("Pumpkin experiment")
                   ))),
    )
