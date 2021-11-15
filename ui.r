## ui.R ##
## Virtual Experiments to Teach Experimental Design

fluidPage(
    ## set up shinyjs
    useShinyjs(),
    title = "VEsTED",
    ## CSS style file
    includeCSS("www/style.css"),
    div(id = "landing_page",
        div(
            ## title
            h1("Choose your virtual experiment"),
            ## R package for typed.js
            typed::typed(list(h2(class = "typed","randomisation"),
                              h2(class = "typed","blocking"),
                              h2(class = "typed","replication")), typeSpeed = 100, loop = TRUE)
        ),
        br(),
        ## Buttons for each experiment
        div(class = "all_buttons",
            div(id = "tomato", class = "mid",
                actionButton("tomato_butt",div(class = "container",img(src = "img/tomato.png"),
                                               h3("Is horse manure"),
                                               h3("the age-old miracle"), h3("grow?")),
                             class = "tomato_btn")),
            div(id = "egg", class = "mid",
                actionButton("chick_butt",div(class = "container",img(src = "img/chick.png"),
                                              h3("Miracle grow for"), h3("chooks")),
                             class = "egg_btn")),
            div(id = "pumpkin", class = "mid",
                actionButton("pump_butt", div(class = "container",img(src = "img/pumpkin.png"),
                                              h3("Esther and Gwenllian"), h3("want to know who"),
                                              h3("reigns supreme"), h3("growing pumpkins")),
                             class = "pumpkin_btn"))
            )),
    ## Hidden experiment pages
    ## Tomato
    shinyjs::hidden(div(id = "experiment_page_tomato",
                        div(id = "back_to_landing_tom", 
                            tags$a(class="btn btn-primary", icon("arrow-left"), h4("Back to landing page"))),
                        h1("Who's the Head Tomato?"),
                        h2(textOutput("tomtxt")),
                        h2(textOutput("tomtxt2")),
                        br(),
                        br(),
                        fluidRow(
                            column(4, 
                                   div(class = "info-tom-1",
                                       div(class = "seeds",h2(class = "setup","Step 1: Choose your seedlings"),
                                           h2(class = "setup","Drag and drop to arrange plants on the greenhouse floor"),
                                           tagList(
                                               radioButtons("tray", h3(icon("seedling"),"Tray"), 1:6, inline = TRUE),
                                               h3("Drag and drop the plants you want to use onto the greenhouse floor"),
                                               conditionalPanel(condition = "input.tray == '1'", uiOutput("tray1")),
                                               conditionalPanel(condition = "input.tray == '2'", uiOutput("tray2")),
                                               conditionalPanel(condition = "input.tray == '3'", uiOutput("tray3")),
                                               conditionalPanel(condition = "input.tray == '4'", uiOutput("tray4")),
                                               conditionalPanel(condition = "input.tray == '5'", uiOutput("tray5")),
                                               conditionalPanel(condition = "input.tray == '6'", uiOutput("tray6")),
                                               br(),
                                               br(),
                                               )))),
                            column(8,
                                   div(
                                       dropUI("greenhouse",
                                              style = "background-color: #379683; border: solid 5px;",
                                              row_n = 6, col_n = 6),
                                       column(2, br(),  div(class = "mid", icon("trash", "fa-3x"))),
                                       column(10, dropUI("bin",
                                                         style = "background-color: #907163; border: solid 5px; width: 100%;",
                                                         row_n = 1, col_n = 6))
                                   )
                                   )
                        ),
                        br(),
                        br(),
                        fluidRow(
                            column(5,
                                   div(class = "info-tom",
                                       div(class = "recipies", h2(class = "setup","Step 2: Set fertilizer recipes"),
                                           tagList(
                                               h3("Treatment 1"),
                                               sliderInput("treat_1_manure",
                                                           "Proportion of manure in fertilizer",
                                                           min = 0, max = 100, value = 0),
                                               h3("Treatment 2"),
                                               sliderInput("treat_2_manure",
                                                           "Proportion of manure in fertilizer",
                                                           min = 0, max = 100, value = 0),
                                               h3("Treatment 3"),
                                               sliderInput("treat_3_manure",
                                                           "Proportion of manure in fertilizer",
                                                           min = 0, max = 100, value = 0),
                                               h3("Treatment 4"),
                                               sliderInput("treat_4_manure",
                                                           "Proportion of manure in fertilizer",
                                                           min = 0, max = 100, value = 0)
                                           )))),
                            column(5,
                                   div(class = "recipies", h2(class = "setup","Step 3: Set treatments"),
                                       tagList(numericInput("tom_days","Number of days to let tomatoes grow",
                                                            min = 0, max = 400, value = 0),
                                               uiOutput("tomato_treatments"),
                                               ))),
                            
                            column(2,
                                   div(class = "mid",
                                       shinyjs::hidden(downloadButton(class = "download_tomato",
                                                                      "download_tomato",
                                                                      tagList(h3("Let Tomatoes Grow"),
                                                                              h3(" & download data"))))))
                        ),
                        hr(),
                        h4(class = "foot","Virtual experiment based on The Greenhouse Experiment in"),
                        h4(tags$a(href = "https://www.jstor.org/stable/41509871?seq=6#metadata_info_tab_contents", "Darius, P., Portier, K., & Schrevens, E. (2007). Virtual Experiments and Their Use in Teaching Experimental Design."))
                        )),
    ## Chicks
    shinyjs::hidden(div(id = "experiment_page_chick",
                        div(id = "back_to_landing_chick", 
                            tags$a(class="btn btn-primary", icon("arrow-left"), h4("Back to landing page"))),
                        h1("Time for an eggsperiment?"),
                        h2(textOutput("chicktxt")),
                        h2(textOutput("chicktxt1")),
                        h2(textOutput("chicktxt2")),
                        fluidRow(
                            column(5,
                                   div(class = "info-chick",h2(class = "setup","Step 1: Choose diet for each nest"),
                                       tagList(
                                           radioButtons("brood", h3(icon("egg"),"Brooder"),
                                                        1:4, inline = TRUE),
                                           conditionalPanel(condition = "input.brood == '1'",
                                                            fluidRow(
                                                                column(2),
                                                                column(width = 8,
                                                                       h3(icon("utensil-spoon"),
                                                                          tags$b("Diet")),
                                                                       brooderRadio(1),
                                                                       actionButton("shuff1", "Randomise Diet (SRS)", icon = icon("random"))),
                                                                column(width = 12,
                                                                       h3(icon("flask"),
                                                                          "Units of copper to add to diet"),
                                                                       fluidRow(
                                                                           column(width = 6,
                                                                                  sliderInput("a1","Nest 1",0,700,0, 100)),
                                                                           column(width = 6,
                                                                                  sliderInput("b1","Nest 2",0,700,0, 100))
                                                                       ),
                                                                       fluidRow(
                                                                           column(width = 6,
                                                                                  sliderInput("c1","Nest 3",0,700,0, 100)),
                                                                           column(width = 6,
                                                                                  sliderInput("d1","Nest 4",0,700,0, 100))
                                                                       ),
                                                                       fluidRow(
                                                                           column(width = 6,
                                                                                  sliderInput("e1","Nest 5",0,700,0, 100)),
                                                                           column(width = 6,
                                                                                  sliderInput("f1","Nest 6",0,700,0, 100))
                                                                       ),
                                                                       fluidRow(
                                                                           column(width = 6,
                                                                                  sliderInput("g1","Nest 7",0,700,0, 100)),
                                                                           column(width = 6,
                                                                                  sliderInput("h1","Nest 8",0,700,0, 100))
                                                                       )))),
                                           conditionalPanel(condition = "input.brood == '2'",
                                                            fluidRow(
                                                                column(2),
                                                                column(width = 8,
                                                                       h3(icon("utensil-spoon"),
                                                                          tags$b("Diet")),
                                                                       brooderRadio(2),
                                                                       actionButton("shuff2", "Randomise Diet (SRS)", icon = icon("random"))),
                                                                column(width = 12,
                                                                       h3(icon("flask"),
                                                                          "Units of copper to add to diet"),
                                                                       fluidRow(
                                                                           column(width = 6,
                                                                                  sliderInput("a2","Nest 9",0,700,0, 100)),
                                                                           column(width = 6,
                                                                                  sliderInput("b2","Nest 10",0,700,0, 100))
                                                                       ),
                                                                       fluidRow(
                                                                           column(width = 6,
                                                                                  sliderInput("c2","Nest 11",0,700,0, 100)),
                                                                           column(width = 6,
                                                                                  sliderInput("d2","Nest 12",0,700,0, 100))
                                                                       ),
                                                                       fluidRow(
                                                                           column(width = 6,
                                                                                  sliderInput("e2","Nest 13",0,700,0, 100)),
                                                                           column(width = 6,
                                                                                  sliderInput("f2","Nest 14",0,700,0, 100))
                                                                       ),
                                                                       fluidRow(
                                                                           column(width = 6,
                                                                                  sliderInput("g2","Nest 15",0,700,0, 100)),
                                                                           column(width = 6,
                                                                                  sliderInput("h2","Nest 16",0,700,0, 100))
                                                                       )))),
                                           conditionalPanel(condition = "input.brood == '3'",
                                                            fluidRow(
                                                                column(2),
                                                                column(width = 8,
                                                                       h3(icon("utensil-spoon"),
                                                                          tags$b("Diet")),
                                                                       brooderRadio(3),
                                                                       actionButton("shuff3", "Randomise Diet (SRS)", icon = icon("random"))),
                                                                column(width = 12,
                                                                       h3(icon("flask"),
                                                                          "Units of copper to add to diet"),
                                                                       fluidRow(
                                                                           column(width = 6,
                                                                                  sliderInput("a3","Nest 17",0,700,0, 100)),
                                                                           column(width = 6,
                                                                                  sliderInput("b3","Nest 18",0,700,0, 100))
                                                                       ),
                                                                       fluidRow(
                                                                           column(width = 6,
                                                                                  sliderInput("c3","Nest 19",0,700,0, 100)),
                                                                           column(width = 6,
                                                                                  sliderInput("d3","Nest 20",0,700,0, 100))
                                                                       ),
                                                                       fluidRow(
                                                                           column(width = 6,
                                                                                  sliderInput("e3","Nest 21",0,700,0, 100)),
                                                                           column(width = 6,
                                                                                  sliderInput("f3","Nest 22",0,700,0, 100))
                                                                       ),
                                                                       fluidRow(
                                                                           column(width = 6,
                                                                                  sliderInput("g3","Nest 23",0,700,0, 100)),
                                                                           column(width = 6,
                                                                                  sliderInput("h3","Nest 24",0,700,0, 100))
                                                                       )))),
                                           conditionalPanel(condition = "input.brood == '4'",
                                                            fluidRow(
                                                                column(2),
                                                                column(width = 8,
                                                                       h3(icon("utensil-spoon"),
                                                                          tags$b("Diet")),
                                                                       brooderRadio(4),
                                                                       actionButton("shuff4", "Randomise Diet (SRS)", icon = icon("random"))),
                                                                column(width = 12,
                                                                       h3(icon("flask"),
                                                                          "Units of copper to add to diet"),
                                                                       fluidRow(
                                                                           column(width = 6,
                                                                                  sliderInput("a4","Nest 25",0,700,0, 100)),
                                                                           column(width = 6,
                                                                                  sliderInput("b4","Nest 26",0,700,0, 100))
                                                                       ),
                                                                       fluidRow(
                                                                           column(width = 6,
                                                                                  sliderInput("c4","Nest 27",0,700,0, 100)),
                                                                           column(width = 6,
                                                                                  sliderInput("d4","Nest 28",0,700,0, 100))
                                                                       ),
                                                                       fluidRow(
                                                                           column(width = 6,
                                                                                  sliderInput("e4","Nest 29",0,700,0, 100)),
                                                                           column(width = 6,
                                                                                  sliderInput("f4","Nest 30",0,700,0, 100))
                                                                       ),
                                                                       fluidRow(
                                                                           column(width = 6,
                                                                                  sliderInput("g4","Nest 31",0,700,0, 100)),
                                                                           column(width = 6,
                                                                                  sliderInput("h4","Nest 32",0,700,0, 100))
                                                                       ))))
                                       )),
                                   br(), br(), br(),
                                   column(4),
                                   shinyjs::hidden(downloadButton(class = "download_chick", "download_chick",
                                                                  tagList(h3("Feed chicks"),
                                                                          h3(" & download data"))))
                                   ),
                            column(7,
                                   div(
                                       div(class = "chick_wrapper",
                                           
                                           ## brooder 1
                                           conditionalPanel(condition = "input.brood == '1'",
                                                            h2(class = "setup","Brooder 1"),
                                                            h3(""),
                                                            div(id="innerchick-grid",
                                                                h3("Tier 1"),
                                                                div(h3(class = "boxed","1"),uiOutput("a1")),
                                                                div(h3(class = "boxed","2"),uiOutput("b1")),
                                                                h3("Tier 2"),
                                                                div(h3(class = "boxed","3"),uiOutput("c1")),
                                                                div(h3(class = "boxed","4"),uiOutput("d1")),
                                                                h3("Tier 3"),
                                                                div(h3(class = "boxed","5"),uiOutput("e1")),
                                                                div(h3(class = "boxed","6"),uiOutput("f1")),
                                                                h3("Tier 4"),
                                                                div(h3(class = "boxed","7"),uiOutput("g1")),
                                                                div(h3(class = "boxed","8"),uiOutput("h1")))
                                                            ),
                                           ## brooder 2
                                           conditionalPanel(condition = "input.brood == '2'",
                                                            h2(class = "setup","Brooder 2"),
                                                            h3(""),
                                                            div(id="innerchick-grid",
                                                                h3("Tier 1"),
                                                                div(h3(class = "boxed","9"), uiOutput("a2")),
                                                                div(h3(class = "boxed","10"),uiOutput("b2")),
                                                                h3("Tier 2"),
                                                                div(h3(class = "boxed","11"),uiOutput("c2")),
                                                                div(h3(class = "boxed","12"),uiOutput("d2")),
                                                                h3("Tier 3"),
                                                                div(h3(class = "boxed","13"),uiOutput("e2")),
                                                                div(h3(class = "boxed","14"),uiOutput("f2")),
                                                                h3("Tier 4"),
                                                                div(h3(class = "boxed","15"),uiOutput("g2")),
                                                                div(h3(class = "boxed","16"),uiOutput("h2")))
                                                            ),
                                           ## brooder 3
                                           conditionalPanel(condition = "input.brood == '3'",
                                                            h2(class = "setup","Brooder 3"),
                                                            h3(""),
                                                            div(id="innerchick-grid",
                                                                h3("Tier 1"),
                                                                div(h3(class = "boxed","17"), uiOutput("a3")),
                                                                div(h3(class = "boxed","18"),uiOutput("b3")),
                                                                h3("Tier 2"),
                                                                div(h3(class = "boxed","19"),uiOutput("c3")),
                                                                div(h3(class = "boxed","20"), uiOutput("d3")),
                                                                h3("Tier 3"),
                                                                div(h3(class = "boxed","21"),uiOutput("e3")),
                                                                div(h3(class = "boxed","22"),uiOutput("f3")),
                                                                h3("Tier 4"),
                                                                div(h3(class = "boxed","23"),uiOutput("g3")),
                                                                div(h3(class = "boxed","24"),uiOutput("h3")))
                                                            ),
                                           ## brooder 4
                                           conditionalPanel(condition = "input.brood == '4'",
                                                            h2(class = "setup","Brooder 4"),
                                                            h3(""),
                                                            div(id ="innerchick-grid",
                                                                h3("Tier 1"),
                                                                div(h3(class = "boxed","25"),uiOutput("a4")),
                                                                div(h3(class = "boxed","26"),uiOutput("b4")),
                                                                h3("Tier 2"),
                                                                div(h3(class = "boxed","27"),uiOutput("c4")),
                                                                div(h3(class = "boxed","28"),uiOutput("d4")),
                                                                h3("Tier 3"),
                                                                div(h3(class = "boxed","29"),uiOutput("e4")),
                                                                div(h3(class = "boxed","30"),uiOutput("f4")),
                                                                h3("Tier 4"),
                                                                div(h3(class = "boxed","31"),uiOutput("g4")),
                                                                div(h3(class = "boxed","32"),uiOutput("h4")))
                                                            )
                                           
                                           )))
                        ),
                        br(),
                        br(),
                        hr(),
                        h4(class = "foot","Virtual experiment based on CHICK in"),
                        h4(tags$a(href = "https://www.jstor.org/stable/2683224?seq=1#metadata_info_tab_contents", "Pollock, K., Ross-Parker, H., & Mead, R. (1979). A Sequence of Games Useful in Teaching Experimental Design to Agriculture Students."))
                        )),
    ## Pumpkin
    shinyjs::hidden(div(id = "experiment_page_pump",
                        div(id = "back_to_landing_pump", 
                            tags$a(class="btn btn-primary", icon("arrow-left"), h4("Back to landing page"))),
                        h1("Country Pumpkin?"),
                        h2(textOutput("txt")),
                        h2(textOutput("txt2")),
                        br(),
                        br(),
                        fluidRow(
                             column(7, div(class="bg-wrap",
                                          div(class="pump_wrapper",
                                              div(class="box an", h2(class = "pots", "A"),
                                                  uiOutput("A")),
                                              div(class="box bn", h2(class = "pots", "B"),
                                                  uiOutput("B")),
                                              div(class="box cn", h2(class = "pots", "C"),
                                                  uiOutput("C")),
                                              div(class="box dn", h2(class = "pots", "D"),
                                                  uiOutput("D")),
                                              div(class="box en", h2(class = "pots", "E"),
                                                  uiOutput("E")),
                                              div(class="box fn", h2(class = "pots", "F"),
                                                  uiOutput("F")),
                                              div(class="box as", h2(class = "pots", "G"),
                                                  uiOutput("G")),
                                              div(class="box bs", h2(class = "pots", "H"),
                                                  uiOutput("H")),
                                              div(class="box cs", h2(class = "pots", "I") ,
                                                  uiOutput("I")),
                                              div(class="box ds", h2(class = "pots", "J"),
                                                  uiOutput("J")),
                                              div(class="box es", h2(class = "pots", "K"),
                                                  uiOutput("K")),
                                              div(class="box fs", h2(class = "pots", "L"),
                                                  uiOutput("L"))
                                              ))),
                            column(5, div(class = "pump-info",  
                                          h2(class = "setup", "Step 1: Choose which variety to put in which plot"),
                                          tagList(h3(icon("seedling"),
                                                     tags$b("Variety")),
                                                  radioMatrixInput(inputId = "variety", rowIDs = LETTERS[1:12],
                                                                   rowLLabels = LETTERS[1:12],
                                                                   rowRLabels = rep(c("N.", "S."), each = 6),
                                                                   choices = c("Kumi Kumi","Buttercup"),
                                                                   selected = NULL))),
                                   br(),
                                   br(),
                                   div(class = "pump-info",
                                       fluidRow(
                                           h2(class = "setup", "Step 2: Choose supplementals"),
                                           column(6, h3(icon("solar-panel"),tags$b("Supplemented heat")),
                                                  checkboxGroupInput("heat","",
                                                                     c("A","B","C","D","E","F",
                                                                       "G","H","I","J","K","L")),
                                                  actionButton("shuff_heat",
                                                               "Randomise Heat", icon = icon("random")),
                                                  br(), br()),
                                           column(6, h3(icon("sun"),tags$b("Controlled light")),
                                                  checkboxGroupInput("light","",
                                                                     c("A","B","C","D","E","F",
                                                                       "G","H","I","J","K","L"))),
                                           actionButton("shuff_light",
                                                        "Randomise Light", icon = icon("random")),
                                           br(), br())
                                       ),
                                   br(),
                                   br(),
                                   div(class = "mid",
                                       shinyjs::hidden(downloadButton(class = "download_pumpkin",
                                                                      "download_pumpkin",
                                                                      tagList(h3("Let Pumpkins Grow"),
                                                                              h3(" & download data"))))),
                                   )
                        ),
                        hr(),
                        h4(class = "foot","Virtual experiment based on TOMATO in"),
                        h4(tags$a(href = "https://www.jstor.org/stable/2683224?seq=1#metadata_info_tab_contents", "Pollock, K., Ross-Parker, H., & Mead, R. (1979). A Sequence of Games Useful in Teaching Experimental Design to Agriculture Students."))
                        ))
)
