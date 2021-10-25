## ui.R ##
## Virtual Experiments to Teach Experimental Design

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
                                              h3("Miracle grow for"), h3("chooks"))),
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
                   tags$a(class="btn btn-primary", icon("arrow-left"), h4("Back to landing page"))),
               h1("Who's the Head Tomato?"),
               h2(textOutput("tomtxt")),
               h2(textOutput("tomtxt2")),
               fluidRow(
                   column(4, 
                          div(class = "info-tom-1",
                              div(class = "seeds",h2(class = "pump_h2","Step 1: Choose & place seedlings"),
                                  tagList(
                                      radioButtons("tray", h3(icon("seedling"),"Tray"), 1:12, inline = TRUE),
                                      h3("Drag and drop the plants you want to use onto the greenhouse floor"),
                                      conditionalPanel(condition = "input.tray == '1'", uiOutput("tray1")),
                                      conditionalPanel(condition = "input.tray == '2'", uiOutput("tray2")),
                                      conditionalPanel(condition = "input.tray == '3'", uiOutput("tray3")),
                                      conditionalPanel(condition = "input.tray == '4'", uiOutput("tray4")),
                                      conditionalPanel(condition = "input.tray == '5'", uiOutput("tray5")),
                                      conditionalPanel(condition = "input.tray == '6'", uiOutput("tray6")),
                                      conditionalPanel(condition = "input.tray == '7'", uiOutput("tray7")),
                                      conditionalPanel(condition = "input.tray == '8'", uiOutput("tray8")),
                                      conditionalPanel(condition = "input.tray == '9'", uiOutput("tray9")),
                                      conditionalPanel(condition = "input.tray == '10'", uiOutput("tray10")),
                                      conditionalPanel(condition = "input.tray == '11'", uiOutput("tray11")),
                                      conditionalPanel(condition = "input.tray == '12'", uiOutput("tray12")),
                                      br(),
                                      br(),
                                      )))),
                   column(8,
                          div(class = "tomato-bck",
                              h2("Drag and drop to arrange your plants on the greenhouse floor"),
                              br(),
                              dropUI("greenhouse",
                                     style = "background-color: darkgrey; border: solid 5px; width: 100%;",
                                     row_n = 12, col_n = 12))
                          )
               ),
               br(),
               br(),
               div(class = "info-tom",
                   div(class = "recipes", dropdownButton(label = h2("Step 2: Set fertilizer recipes"),
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
                                                         ),
                                                         status = 'info', icon = icon('clipboard'), circle = FALSE)),
                   div(class = "manure",dropdownButton(label = h2("Step 3: Set treatments"),
                                                       tagList(uiOutput("tomato_treatments"),
                                                               numericInput("tom_days","Days to grow",
                                                                            min = 0, max = 400, value = 0)
                                                               ),
                                                       status = 'info', icon = icon('clipboard'), circle = FALSE)),
                   
                   div(class = "mid",
                       shinyjs::hidden(downloadButton("download_tomato",
                                                      tagList(h3("Let Tomatoes Grow"), h4(" & download data")))))),
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
                        div(class = "info-chick",dropdownButton(label = h2("Setup experiment"),
                                                                tagList(
                                                                    radioButtons("brood", h3(icon("egg"),"Brooder"),
                                                                                 1:4, inline = TRUE),
                                                                    conditionalPanel(condition = "input.brood == '1'",
                                                                                     fluidRow(
                                                                                         column(width = 4,
                                                                                                h3(icon("utensil-spoon"),
                                                                                                   tags$b("Diet")),
                                                                                                brooderRadio(1),
                                                                                                actionButton("shuff1", "Randomise Diet (SRS)", icon = icon("random"))),
                                                                                         column(width = 8,
                                                                                                h3(icon("flask"),
                                                                                                   "Units of copper to add to diet"),
                                                                                                fluidRow(
                                                                                                    column(width = 6,
                                                                                                           sliderInput("a1","Nest 1",0,700,0,50)),
                                                                                                    column(width = 6,
                                                                                                           sliderInput("b1","Nest 2",0,700,0,50))
                                                                                                ),
                                                                                                fluidRow(
                                                                                                    column(width = 6,
                                                                                                           sliderInput("c1","Nest 3",0,700,0,50)),
                                                                                                    column(width = 6,
                                                                                                           sliderInput("d1","Nest 4",0,700,0,50))
                                                                                                ),
                                                                                                fluidRow(
                                                                                                    column(width = 6,
                                                                                                           sliderInput("e1","Nest 5",0,700,0,50)),
                                                                                                    column(width = 6,
                                                                                                           sliderInput("f1","Nest 6",0,700,0,50))
                                                                                                ),
                                                                                                fluidRow(
                                                                                                    column(width = 6,
                                                                                                           sliderInput("g1","Nest 7",0,700,0,50)),
                                                                                                    column(width = 6,
                                                                                                           sliderInput("h1","Nest 8",0,700,0,50))
                                                                                                    )))),
                                                                    conditionalPanel(condition = "input.brood == '2'",
                                                                                     fluidRow(
                                                                                         column(width = 4,
                                                                                                h3(icon("utensil-spoon"),
                                                                                                   tags$b("Diet")),
                                                                                                brooderRadio(2),
                                                                                         actionButton("shuff2", "Randomise Diet (SRS)", icon = icon("random"))),
                                                                                         column(width = 8,
                                                                                                h3(icon("flask"),
                                                                                                   "Units of copper to add to diet"),
                                                                                                fluidRow(
                                                                                                    column(width = 6,
                                                                                                           sliderInput("a2","Nest 9",0,700,0,50)),
                                                                                                    column(width = 6,
                                                                                                           sliderInput("b2","Nest 10",0,700,0,50))
                                                                                                    ),
                                                                                                fluidRow(
                                                                                                    column(width = 6,
                                                                                                           sliderInput("c2","Nest 11",0,700,0,50)),
                                                                                                    column(width = 6,
                                                                                                           sliderInput("d2","Nest 12",0,700,0,50))
                                                                                                    ),
                                                                                                fluidRow(
                                                                                                    column(width = 6,
                                                                                                           sliderInput("e2","Nest 13",0,700,0,50)),
                                                                                                    column(width = 6,
                                                                                                           sliderInput("f2","Nest 14",0,700,0,50))
                                                                                                    ),
                                                                                                fluidRow(
                                                                                                    column(width = 6,
                                                                                                           sliderInput("g2","Nest 15",0,700,0,50)),
                                                                                                    column(width = 6,
                                                                                                           sliderInput("h2","Nest 16",0,700,0,50))
                                                                                                    )))),
                                                                    conditionalPanel(condition = "input.brood == '3'",
                                                                                     fluidRow(
                                                                                         column(width = 4,
                                                                                                h3(icon("utensil-spoon"),
                                                                                                   tags$b("Diet")),
                                                                                                brooderRadio(3),
                                                                                                actionButton("shuff3", "Randomise Diet (SRS)", icon = icon("random"))),
                                                                                         column(width = 8,
                                                                                                h3(icon("flask"),
                                                                                                   "Units of copper to add to diet"),
                                                                                                fluidRow(
                                                                                                    column(width = 6,
                                                                                                           sliderInput("a3","Nest 17",0,700,0,50)),
                                                                                                    column(width = 6,
                                                                                                           sliderInput("b3","Nest 18",0,700,0,50))
                                                                                                    ),
                                                                                                fluidRow(
                                                                                                    column(width = 6,
                                                                                                           sliderInput("c3","Nest 19",0,700,0,50)),
                                                                                                    column(width = 6,
                                                                                                           sliderInput("d3","Nest 20",0,700,0,50))
                                                                                                    ),
                                                                                                fluidRow(
                                                                                                    column(width = 6,
                                                                                                           sliderInput("e3","Nest 21",0,700,0,50)),
                                                                                                    column(width = 6,
                                                                                                           sliderInput("f3","Nest 22",0,700,0,50))
                                                                                                    ),
                                                                                                fluidRow(
                                                                                                    column(width = 6,
                                                                                                           sliderInput("g3","Nest 23",0,700,0,50)),
                                                                                                    column(width = 6,
                                                                                                           sliderInput("h3","Nest 24",0,700,0,50))
                                                                                                    )))),
                                                                    conditionalPanel(condition = "input.brood == '4'",
                                                                                     fluidRow(
                                                                                         column(width = 4,
                                                                                                h3(icon("utensil-spoon"),
                                                                                                   tags$b("Diet")),
                                                                                                brooderRadio(4),
                                                                                                actionButton("shuff4", "Randomise Diet (SRS)", icon = icon("random"))),
                                                                                         column(width = 8,
                                                                                                h3(icon("flask"),
                                                                                                   "Units of copper to add to diet"),
                                                                                                fluidRow(
                                                                                                    column(width = 6,
                                                                                                           sliderInput("a4","Nest 25",0,700,0,50)),
                                                                                                    column(width = 6,
                                                                                                           sliderInput("b4","Nest 26",0,700,0,50))
                                                                                                    ),
                                                                                                fluidRow(
                                                                                                    column(width = 6,
                                                                                                           sliderInput("c4","Nest 27",0,700,0,50)),
                                                                                                    column(width = 6,
                                                                                                           sliderInput("d4","Nest 28",0,700,0,50))
                                                                                                    ),
                                                                                                fluidRow(
                                                                                                    column(width = 6,
                                                                                                           sliderInput("e4","Nest 29",0,700,0,50)),
                                                                                                    column(width = 6,
                                                                                                           sliderInput("f4","Nest 30",0,700,0,50))
                                                                                                    ),
                                                                                                fluidRow(
                                                                                                    column(width = 6,
                                                                                                           sliderInput("g4","Nest 31",0,700,0,50)),
                                                                                                    column(width = 6,
                                                                                                           sliderInput("h4","Nest 32",0,700,0,50))
                                                                                                    ))))
                                                                ), status = 'info', icon = icon('clipboard'), circle = FALSE)),
                        br(),
                        br(),
                        div(class = "bgchick-wrap",
                            div(class="chick_wrapper",
                                ## names
                                h3("Brooder 1"),
                                h3(""),
                                h3("Brooder 2"),
                                h3(""),
                                h3("Brooder 3"),
                                h3(""),
                                h3("Brooder 4"),
                                ## brooder 1
                                div(id="innerchick-grid",
                                    div(h3(class = "boxed","1"),uiOutput("a1")),div(h3(class = "boxed","2"),uiOutput("b1")),
                                    div(h3(class = "boxed","3"),uiOutput("c1")),div(h3(class = "boxed","4"),uiOutput("d1")),
                                    div(h3(class = "boxed","5"),uiOutput("e1")),div(h3(class = "boxed","6"),uiOutput("f1")),
                                    div(h3(class = "boxed","7"),uiOutput("g1")),div(h3(class = "boxed","8"),uiOutput("h1"))),
                                div(id = "tiers",
                                    div(br(), br(),br(),h4("Tier 1")), div(br(), br(),br(),h4("Tier 2")),
                                    div(br(), br(),br(),h4("Tier 3")), div(br(), br(),br(),h4("Tier 4"))),
                                ## brooder 2
                                div(id="innerchick-grid",
                                    div(h3(class = "boxed","9"),uiOutput("a2")),div(h3(class = "boxed","10"),uiOutput("b2")),
                                    div(h3(class = "boxed","11"),uiOutput("c2")),div(h3(class = "boxed","12"),uiOutput("d2")),
                                    div(h3(class = "boxed","13"),uiOutput("e2")),div(h3(class = "boxed","14"),uiOutput("f2")),
                                    div(h3(class = "boxed","15"),uiOutput("g2")),div(h3(class = "boxed","16"),uiOutput("h2"))),
                                 div(id = "tiers",
                                    div(br(), br(),br(),h4("Tier 1")), div(br(), br(),br(),h4("Tier 2")),
                                    div(br(), br(),br(),h4("Tier 3")), div(br(), br(),br(),h4("Tier 4"))),
                                ## brooder 3
                                div(id="innerchick-grid",
                                    div(h3(class = "boxed","17"),uiOutput("a3")),div(h3(class = "boxed","18"),uiOutput("b3")),
                                    div(h3(class = "boxed","19"),uiOutput("c3")),div(h3(class = "boxed","20"),uiOutput("d3")),
                                    div(h3(class = "boxed","21"),uiOutput("e3")),div(h3(class = "boxed","22"),uiOutput("f3")),
                                    div(h3(class = "boxed","23"),uiOutput("g3")),div(h3(class = "boxed","24"),uiOutput("h3"))),
                                 div(id = "tiers",
                                    div(br(), br(),br(),h4("Tier 1")), div(br(), br(),br(),h4("Tier 2")),
                                    div(br(), br(),br(),h4("Tier 3")), div(br(), br(),br(),h4("Tier 4"))),
                                ## brooder 4
                                div(id ="innerchick-grid",
                                    div(h3(class = "boxed","25"),uiOutput("a4")),div(h3(class = "boxed","26"),uiOutput("b4")),
                                    div(h3(class = "boxed","27"),uiOutput("c4")),div(h3(class = "boxed","28"),uiOutput("d4")),
                                    div(h3(class = "boxed","29"),uiOutput("e4")),div(h3(class = "boxed","30"),uiOutput("f4")),
                                    div(h3(class = "boxed","31"),uiOutput("g4")),div(h3(class = "boxed","32"),uiOutput("h4"))))
                            ),
                        br(),
                        br(),
                        div(class = "mid",
                            shinyjs::hidden(downloadButton("download_chick",
                                                            tagList(h3("Feed chicks"), h4(" & download data"))))),
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
                             column(8, div(class="bg-wrap",
                                          div(class="pump_wrapper",
                                              div(class="box an", h2("A"),
                                                  uiOutput("A")),
                                              div(class="box bn", h2("B"),
                                                  uiOutput("B")),
                                              div(class="box cn", h2("C"),
                                                  uiOutput("C")),
                                              div(class="box dn", h2("D"),
                                                  uiOutput("D")),
                                              div(class="box en", h2("E"),
                                                  uiOutput("E")),
                                              div(class="box fn", h2("F"),
                                                  uiOutput("F")),
                                              div(class="box as", h2("G"),
                                                  uiOutput("G")),
                                              div(class="box bs", h2("H"),
                                                  uiOutput("H")),
                                              div(class="box cs", h2("I") ,
                                                  uiOutput("I")),
                                              div(class="box ds", h2("J"),
                                                  uiOutput("J")),
                                              div(class="box es", h2("K"),
                                                  uiOutput("K")),
                                              div(class="box fs", h2("L"),
                                                  uiOutput("L"))
                                              ))),
                            column(4, div(class = "info",  br(), br(), h2(class = "pump_h2",
                                                              icon("clipboard"), tags$b("Setup experiment")),
                                          tagList(h3(icon("seedling"),
                                                     tags$b("Variety")),
                                                  radioMatrixInput(inputId = "variety", rowIDs = LETTERS[1:12],
                                                                   rowLLabels = LETTERS[1:12],
                                                                   rowRLabels = rep(c("N.", "S."), each = 6),
                                                                   choices = c("Kumi Kumi","Buttercup"),
                                                                   selected = NULL),
                                                  fluidRow(
                                                      column(6, h3(icon("solar-panel"),tags$b("Supplemented heat")),
                                                             checkboxGroupInput("heat","",
                                                                                c("A","B","C","D","E","F",
                                                                                  "G","H","I","J","K","L"))),
                                                      column(6, h3(icon("sun"),tags$b("Controlled light")),
                                                             checkboxGroupInput("light","",
                                                                                c("A","B","C","D","E","F",
                                                                                  "G","H","I","J","K","L")))
                                                  )
                                                  )
                                          ))
                        ),
                        br(),
                        br(),
                        div(class = "mid",
                            shinyjs::hidden(downloadButton("download_pumpkin",
                                                           tagList(h3("Let Pumpkins Grow"), h4(" & download data"))))),
                        hr(),
                        h4(class = "foot","Virtual experiment based on TOMATO in"),
                        h4(tags$a(href = "https://www.jstor.org/stable/2683224?seq=1#metadata_info_tab_contents", "Pollock, K., Ross-Parker, H., & Mead, R. (1979). A Sequence of Games Useful in Teaching Experimental Design to Agriculture Students."))
                        ))
)
