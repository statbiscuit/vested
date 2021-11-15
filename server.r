## server.R ##
function(input, output,session) {
    ## Data variables
    ### Brood sim
    diets <- shiny::reactiveVal()

    ## go back to landing page
    observe({
        onclick("back_to_landing_tom", {
            shinyjs::show("landing_page")
            shinyjs::hide("experiment_page_tomato")
            shinyjs::removeClass(selector = "body", class = "experiment_page_tomato")
        })
    })
    observe({
        onclick("back_to_landing_chick", {
            shinyjs::show("landing_page")
            shinyjs::hide("experiment_page_chick")
            shinyjs::removeClass(selector = "body", class = "experiment_page_chick")
        })
    })
    observe({
        onclick("back_to_landing_pump", {
            shinyjs::show("landing_page")
            shinyjs::hide("experiment_page_pump")
            shinyjs::removeClass(selector = "body", class = "experiment_page_pump")
        })
    })
    ## load experiment pages
    observe({
        onclick("tomato_butt", {
            shinyjs::hide("landing_page")
            shinyjs::show("experiment_page_tomato")
            shinyjs::removeClass(selector = "body", class = "landing_page")
        })
    })
    observe({
        onclick("chick_butt", {
            shinyjs::hide("landing_page")
            shinyjs::show("experiment_page_chick")
            shinyjs::removeClass(selector = "body", class = "landing_page")
        })
    })
    observe({
        onclick("pump_butt", {
            shinyjs::hide("landing_page")
            shinyjs::show("experiment_page_pump")
            shinyjs::removeClass(selector = "body", class = "landing_page")
        })
    })
    ## Tomato outputs
    output$tomtxt <- renderText("Your family owns a tomato farm and has done for generations. Yields are down, money's tight, and the farm is at risk of bankruptcy. However, there is rumour of some fertilizer recipe handed down from your great-great-grandmother that will maximise the yield of tomatoes. But, the exact recipe has been lost. You know the recipe involves horse manure, but have no clue as to the optimal amount? To save your family's farm you must find the optimal dose of fertiliser that produces the maximum average biomass of tomatoes.
")
     output$tomtxt2 <- renderText("The greenhouse you will use to answer this question is bordered left and right with heating strips and is lighted by artificial light: the floor pattern illustrates the light intensity pattern that will be experienced by the plants. You are already aware that heat and light affect plant growth. Design an experiment to find the optimal dose of manure in the fertiliser to maximise tomato yield. Your father has given you twelve trays of twelve seedlings you can use in your experiment (you do not have to use them all). You have four different recipes to test.")
    ## seedling weights for tray 1
    output$tray1 <- renderUI({
        out_list <- lapply(paste("a",1:6,sep = ""),function(t){
            dragUI(t,h3(icon("seedling",class = "tray1"), 
                        renderText({
                            paste(round(runif(1,0,3),1), "m")
                        }), h5("tray 1")))
        })
        do.call('tagList',out_list)
    })
     ## seedling weights for tray 2
    output$tray2 <- renderUI({
        out_list <- lapply(paste("b",1:6,sep = ""),function(t){
            dragUI(t,h3(icon("seedling",class = "tray2"), 
                        renderText({
                            paste(round(runif(1,0,3),1), "m")
                        }), h5("tray 2")))
        })
        do.call('tagList',out_list)
    })
    ## seedling weights for tray 3
    output$tray3 <- renderUI({
        out_list <- lapply(paste("c",1:6,sep = ""),function(t){
            dragUI(t,h3(icon("seedling",class = "tray3"), 
                        renderText({
                            paste(round(runif(1,0,3),1), "m")
                        }), h5("tray 3")))
        })
        do.call('tagList',out_list)
    })
     ## seedling weights for tray 4
    output$tray4 <- renderUI({
        out_list <- lapply(paste("d",1:6,sep = ""),function(t){
            dragUI(t,h3(icon("seedling",class = "tray4"), 
                        renderText({
                            paste(round(runif(1,0,3),1), "m")
                        }), h5("tray 4")))
        })
        do.call('tagList',out_list)
    })
     ## seedling weights for tray 5
    output$tray5 <- renderUI({
        out_list <- lapply(paste("e",1:6,sep = ""),function(t){
            dragUI(t,h3(icon("seedling",class = "tray5"), 
                        renderText({
                            paste(round(runif(1,0,3),1), "m")
                        }), h5("tray 5")))
        })
        do.call('tagList',out_list)
    })
     ## seedling weights for tray 6
    output$tray6 <- renderUI({
        out_list <- lapply(paste("f",1:6,sep = ""),function(t){
            dragUI(t,h3(icon("seedling",class = "tray6"), 
                        renderText({
                            paste(round(runif(1,0,3),1), "m")
                        }), h5("tray 6")))
        })
        do.call('tagList',out_list)
    })
    data_tomato <- reactiveValues(data = NULL)
    observe({
        gh.v <- unlist(input$greenhouse)
        req(gh.v != "")
        trays <- str_extract_all(gh.v, "tray .")
        initials <- str_extract_all(gh.v, "... m")
        col <- rep(rep(1:6, times = 6), times = sapply(initials, length))
        row <- rep(rep(1:6, each = 6), times = sapply(initials, length))
        t <- unlist(trays)
        i <- unlist(initials)
        d <- data.frame(id = 1:length(col), col = col, row = row,
                        tray = as.integer(substring(t, 5)),
                        initial = as.numeric(substring(i, 1, 3))
                        )
        output$tomato_treatments <- renderUI({
            validate(need(nrow(d) > 0,"Please choose some seedlings"))
            lapply(d$id, function(j){
                lab <- paste(
                    "Tray:", d[d$id == j, 4],
                    "Row:", d[d$id == j, 3],
                    "Col:", d[d$id == j, 2],
                    "Weight:", d[d$id == j, 5],"(m)")
                radioButtons(inputId = paste("input", j, sep = "_"),label = lab,
                             choices = c("None" = "none","Treatment 1" = "t1","Treatment 2" = "t2",
                                         "Treatment 3" = "t3","Treatment 4" = "t4"), inline = TRUE)
                
                
            })
        })
        data_tomato$data <- d
    })
    observe({
        d <- data_tomato$data
        treatment <- c(unlist(sapply(paste("input",d$id,sep = "_"),function(p) input[[p]])))
        req(length(treatment) == nrow(d))
        data_tomato$data$treatment <- treatment
        data_tomato$data$fertilizer <- ifelse(treatment == "none",0,
                        ifelse(treatment == "t1",input$treat_1_manure,
                        ifelse(treatment == "t2",input$treat_2_manure,
                        ifelse(treatment == "t3",input$treat_3_manure,
                        ifelse(treatment == "t4",input$treat_4_manure,0)))))
        ## simple heat ATM
        heat <- matrix(rep(c(seq(22, 10,by = -2),seq(14, 22,by = 2)), each = 6), ncol = 6)
        ## simple light ATM
        light <- matrix(rep(seq(1,0.1,by = -0.08), each = 6), ncol = 6, byrow = TRUE)
        ## crude biomass growth model atm
        bio <- hm <- lim <- numeric(nrow(d)) 
        for(i in 1:nrow(d)){
            hm[i] <- heat[d$row[i], d$col[i]]
            lim[i] <- light[d$row[i], d$col[i]]
            bio[i] <- tomgro(initial = d$initial[i],
                             manure =  data_tomato$data$fertilizer[i]/100,
                             days = input$tom_days, heat = hm[i], light = lim[i])
        }
        data_tomato$data$days <- input$tom_days
        data_tomato$data$heat_metric <- hm
        data_tomato$data$light_metric <- lim
        data_tomato$data$yield <- bio
    }) 
    observe({
        req(nrow(data_tomato$data) > 0)
        shinyjs::show("download_tomato")
    })
    output$download_tomato <- downloadHandler(
        filename = function() {
            paste('tomato_data-', Sys.Date(), '.csv', sep='')
        },
        content = function(con) {
            showModal(modalDialog(tagList(typed::typed(sample(list(
                                                     h3("What type of tomato smells best? ...... A Roma"),
                                                     h3("Why did the tomato turn red? ... Because it saw the salad dressing"),
                                                     h3("Tomato paste is pretty viscous ... I guess it’s not very fast paste"),
                                                     h3("Why did the Tomato go out with a prune? .... It couldn’t find a date!"),
                                                     h3("What's a tomato's greatest desire? ...... A jerrymato.")),1),
                                                     typeSpeed = 50, loop = FALSE),
                                          img(class = "grow",src = "img/growing.gif")),footer = NULL))
            Sys.sleep(5)
            removeModal()
            write.csv(data_tomato$data, con, row.names = FALSE)
        }
    )

    ## Chick output
    observe({
        ids <- paste0(rep(letters[1:8], 4), rep(1:4, each = 8))
        ## Update list of diets for updating the downloadable dataframe...
        if (!inherits(diets(), "character"))
            ldiets <- character(32)
        else
            ldiets <- diets()

        ## Update UI
        lapply(1:32, function(i) {
            v <- input[[paste0('diet', ids[i])]]
            output[[ids[i]]] <- renderUI({
                if (is.null(v)){
                    tagList(div(
                        h4(class = "setup", "Please feed us"),
                        img(class = "grow", src = "img/empty.png"),
                        h4(""),
                        h4("")
                    ))
                }else{
                    tagList(if (v == "Maize") {
                                div(
                                    h4(class = "setup","Maize diet"),
                                    img(class = "grow", src = "img/corn.png"),
                                    h4(class = "setup", "Copper units added"),
                                    h4(class = "setup", input[[ids[i]]])
                                )
                            }else{
                                div(
                                    h4(class = "setup", "Wheat diet"),
                                    img(class = "grow", src = "img/wheat.png"),
                                    h4(class = "setup", "Copper units added"),
                                    h4(class = "setup", input[[ids[i]]])
                                )
                                
                            })
                }
            })
            
            if (!is.null(v)) {
                ldiets[i] <<- v
            }
        })
        ## Update for DF
        diets(ldiets)
    })
    
    observeEvent(input$shuff1, {
        chickRandomise(session, 1)
    })

   observeEvent(input$shuff2, {
        chickRandomise(session, 2)
    })

    observeEvent(input$shuff3, {
        chickRandomise(session, 3)
    })

    observeEvent(input$shuff4, {
        chickRandomise(session, 4)
    })

    output$chicktxt <- renderText("You have been employed by the University's Poultry Research Farm
to look into how pullets respond to the amount of copper added to basic diets of either wheat or maize. You need to determine the optimum amount of copper to add to their diets to improve their growth rate.")
     output$chicktxt1 <- renderText("You are told that 150 units of copper added to either
diet seems to improve growth. It is also known that there is a level of copper beyond which toxic effects will reduce the growth rate. So what is the optimum amount to add?")
    output$chicktxt2 <- renderText("At your disposal, you have  32 cages that each contain 16 chicks.
In addition to the amount of copper in their diet, other factors may influence the growth rate of chicks (e.g., brooder, tier position within the henhouse, etc.). You should take these into consideration whilst designing your experiment.")

    observe({
        if(!any(diets() == "")){
            shinyjs::show("download_chick")
        }
    })

    data_chick <- reactive({
        data <- data.frame(
            chicknumber = 1:(32*16),
            nest = rep(1:32,each = 16),
            brooder = rep(rep(1:4, each = 8), each = 16),
            tier = rep(rep(rep(1:4, each = 2), times = 4),each = 16))
        data$diet <- rep(diets(),each = 16)
        copper <- c(input$a1 , input$b1 , input$c1 , input$d1 , input$e1 , input$f1 , input$g1 , input$h1,
                         input$a2 , input$b2 , input$c2 , input$d2 , input$e2 , input$f2 , input$g2 , input$h2,
                         input$a3 , input$b3 , input$c3 , input$d3 , input$e3 , input$f3 , input$g3 , input$h3,
                         input$a4 , input$b4 , input$c4 , input$d4 , input$e4 , input$f4 , input$g4 , input$h4)
        data$copper <- rep(copper, each = 16)
        data$growth <- round(sim_chick_growth(data),2)
        data <- apply(data,2,unlist)
        data
    })
    output$download_chick <- downloadHandler(
        filename = function() {
            paste('chick_data-', Sys.Date(), '.csv', sep='')
        },
        content = function(con) {
            showModal(modalDialog(tagList(typed::typed(sample(list(
                                                     h3("How do baby chickens dance? ...... Chick-to-chick"),
                                                     h3("What do chickens grow on? ...... Eggplants"),
                                                     h3("What do chickens call school tests? ... Eggs-aminations"),
                                                     h3("Which dance will a chicken not do? ...... The foxtrot"),
                                                     h3("How long do chickens work? ...... Around the cluck")),1),
                                                     typeSpeed = 50, loop = FALSE),
                                          img(class = "grow",src = "img/grain.gif")),footer = NULL))
            Sys.sleep(5)
            removeModal()
            write.csv(data_chick(), con, row.names = FALSE)
            
        }
    )
    ## Pumpkin outputs
    output$txt <- renderText("Two farmers, Esther and Gwenllian, grow pumpkins in Pukekohe for the farmer's market. After several years, Esther clearly gets higher yields than Gwenllian. But why?
 Several factors—variety, heat, and light—differ in cultivation methods. Farmer Esther is conservative; she uses natural heating, ambient lighting, and a variety of pumpkin called Kumi Kumi, whilst Gwenllian uses supplementary heating, controlled lighting, and a variety called Buttercup. Can you design a two-stage experiment and, based on the results, decide which combination of the three factors of heat, light, and variety give the highest pumpkin yield?")
    output$txt2 <- renderText("Due to funding cuts, you only have a small greenhouse to carry out this experiment. The greenhouse has six north facing plots and six south-facing. Your colleague tells you that from previous experiments in the greenhouse there are known to be a substantial difference in yields between the two sides of the greenhouse.")
    lapply(LETTERS[1:12], function(i) {
        output[[i]] <- renderUI({
            tagList(
                fluidRow(
                    column(4),
                    column(4,
                           column(6,if(i %in% input$heat) {
                                        div( br(),icon("solar-panel", "fa-2x"))
                                    }else{
                                        div(br(), br())
                                    }),
                           column(6,if(i %in% input$light) div( br(), icon("sun", "fa-2x")))),
                    column(4),
                    validate(need(!is.null(input$variety[[i]]),"")),
                    column(12, if(input$variety[[i]] == "Kumi Kumi"){
                                   img(class = "grow",src = "img/kumi.png")
                               }else{
                                   if(input$variety[[i]] == "Buttercup"){
                                       img(class = "grow",src = "img/butter.png")
                                   }
                               })
                ))
        })
    })
    observeEvent(input$shuff_heat, {
        heatRandomise(session)
    })
    observeEvent(input$shuff_light, {
        lightRandomise(session)
    })
    data <- reactive({
        h <- rep("Natural",12)
        l <- rep("Ambient",12)
        h[LETTERS[1:12] %in% input$heat] <- "Supplemented"
        l[LETTERS[1:12] %in% input$light] <- "Controlled"
        data <- data.frame(variety = unlist(input$variety),
                           heat = h,
                           light = l,
                           side = rep(c("North","South"), times = 6))
        data$yield <- sim_pumpkin_yield(data)
        data
    })
    observe({
        if(length(unlist(input$variety)) == 12){
            shinyjs::show("download_pumpkin")
        }
    })
    output$download_pumpkin <- downloadHandler(
        filename = function() {
            paste('pumpkin_data-', Sys.Date(), '.csv', sep='')
        },
        content = function(con) {
            showModal(modalDialog(tagList(typed::typed(sample(list(
                                                     h3("What do you get when you drop a pumpkin? ...... Squash"),
                                                     h3("What's a pumpkin's favorite genre? ...... Pulp fiction"),
                                                     h3("Why did the pumpkin take a detour? ... To avoid the seeday part of time"),
                                                     h3("How does a pumpkin listen to Halloween music? ...... On vine-yl"),
                                                     h3("What did the queasy pumpkin say? ...... I don't feel so gourd")),1),
                                                     typeSpeed = 50, loop = FALSE),
                                          img(class = "grow",src = "img/growing.gif")),footer = NULL))
            Sys.sleep(5)
            removeModal()
            write.csv(data(), con, row.names = LETTERS[1:12])
            
        }
    )
    session$onSessionEnded(stopApp)
}
