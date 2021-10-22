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
    output$tomtxt <- renderText("Your family owns a tomato farm, has done for generations.
Yields are down, money's tight, and the farm is at risk of bankruptcy. There is however rumour
of some fertilizer recipe handed down from your great-great-grandmother that will maximise
the yield of tomatoes. The exact recipe has however been lost to the hands of time.
You know the recipe involves horse manure, but what is the optimal amount?
 To save your family's farm you must find the optimal dose of fertiliser that produces the maximum
average biomass of tomatoes.")
     output$tomtxt2 <- renderText("You should note that the greenhouse
is bordered left and right with heating strips. In addition,
the greenhouse is lighted by artificial light: the floor pattern illustrates the light intensity pattern
that will be experienced by the plants. You are already aware that heat and light affect plant growth. Design an experiment
to find the optimal dose of manure in the fertiliser to maximise tomato yield. Your father
has given you twelve trays of twelve seedlings you can use in your experiment (you do not have to use them all).
 You have four different recipes to test.")
    ## seedling weights for tray 1
    output$tray1 <- renderUI({
        out_list <- lapply(paste("a",1:12,sep = ""),function(t){
            dragUI(t,h3(icon("seedling",class = "tray1"), 
                        renderText({
                            paste(round(runif(1,0,3),1), "m")
                        }), h5("tray 1")))
        })
        do.call('tagList',out_list)
    })
     ## seedling weights for tray 2
    output$tray2 <- renderUI({
        out_list <- lapply(paste("b",1:12,sep = ""),function(t){
            dragUI(t,h3(icon("seedling",class = "tray2"), 
                        renderText({
                            paste(round(runif(1,0,3),1), "m")
                        }), h5("tray 2")))
        })
        do.call('tagList',out_list)
    })
    ## seedling weights for tray 3
    output$tray3 <- renderUI({
        out_list <- lapply(paste("c",1:12,sep = ""),function(t){
            dragUI(t,h3(icon("seedling",class = "tray3"), 
                        renderText({
                            paste(round(runif(1,0,3),1), "m")
                        }), h5("tray 3")))
        })
        do.call('tagList',out_list)
    })
     ## seedling weights for tray 4
    output$tray4 <- renderUI({
        out_list <- lapply(paste("d",1:12,sep = ""),function(t){
            dragUI(t,h3(icon("seedling",class = "tray4"), 
                        renderText({
                            paste(round(runif(1,0,3),1), "m")
                        }), h5("tray 4")))
        })
        do.call('tagList',out_list)
    })
     ## seedling weights for tray 5
    output$tray5 <- renderUI({
        out_list <- lapply(paste("e",1:12,sep = ""),function(t){
            dragUI(t,h3(icon("seedling",class = "tray5"), 
                        renderText({
                            paste(round(runif(1,0,3),1), "m")
                        }), h5("tray 5")))
        })
        do.call('tagList',out_list)
    })
     ## seedling weights for tray 6
    output$tray6 <- renderUI({
        out_list <- lapply(paste("f",1:12,sep = ""),function(t){
            dragUI(t,h3(icon("seedling",class = "tray6"), 
                        renderText({
                            paste(round(runif(1,0,3),1), "m")
                        }), h5("tray 6")))
        })
        do.call('tagList',out_list)
    })
    ## seedling weights for tray 7
    output$tray7 <- renderUI({
        out_list <- lapply(paste("g",1:12,sep = ""),function(t){
            dragUI(t,h3(icon("seedling",class = "tray7"), 
                        renderText({
                            paste(round(runif(1,0,3),1), "m")
                        }), h5("tray 7")))
        })
        do.call('tagList',out_list)
    })
     ## seedling weights for tray 8
    output$tray8 <- renderUI({
        out_list <- lapply(paste("h",1:12,sep = ""),function(t){
            dragUI(t,h3(icon("seedling",class = "tray8"), 
                        renderText({
                            round(runif(1,0,3),1)
                        }), h5("tray 8")))
        })
        do.call('tagList',out_list)
    })
     ## seedling weights for tray 9
    output$tray9 <- renderUI({
        out_list <- lapply(paste("i",1:12,sep = ""),function(t){
            dragUI(t,h3(icon("seedling",class = "tray9"), 
                        renderText({
                            paste(round(runif(1,0,3),1), "m")
                        }), h5("tray 9")))
        })
        do.call('tagList',out_list)
    })
     ## seedling weights for tray 10
    output$tray10 <- renderUI({
        out_list <- lapply(paste("j",1:12,sep = ""),function(t){
            dragUI(t,h3(icon("seedling",class = "tray10"), 
                        renderText({
                            round(runif(1,0,3),1)
                        }), h5("tray 10")))
        })
        do.call('tagList',out_list)
    })
    ## seedling weights for tray 11
    output$tray11 <- renderUI({
        out_list <- lapply(paste("k",1:12,sep = ""),function(t){
            dragUI(t,h3(icon("seedling",class = "tray11"), 
                        renderText({
                            paste(round(runif(1,0,3),1), "m")
                        }), h5("tray 11")))
        })
        do.call('tagList',out_list)
    })
     ## seedling weights for tray 12
    output$tray12 <- renderUI({
        out_list <- lapply(paste("l",1:12,sep = ""),function(t){
            dragUI(t,h3(icon("seedling",class = "tray12"), 
                        renderText({
                            paste(round(runif(1,0,3),1), "m")
                        }), h5("tray 12")))
        })
        do.call('tagList',out_list)
    })
    data_tomato <- reactive({
        gh.v <- unlist(input$greenhouse)
        trays <- as.numeric(gsub(".*tray (\\d+)\n.*", "\\1", gh.v))
        initials <- as.numeric(sub("[\n ]*([\\d.]+)\n[\n\\d\\s\\w]*", "\\1", gh.v, perl = TRUE))
        data <- data.frame(row = rep(1:12, times = 12), col = rep(1:12, each = 12),
                           tray = trays,
                           initial = initials)
        data[data == ""] <- NA
        data <- na.omit(data)
        if(nrow(data) > 0){
            data$id <- 1:nrow(data)
        }
        data
    })
    output$tomato_treatments <- renderUI({
        validate(need(nrow(data_tomato()) > 0,"Please choose some seedlings"))
        lapply(data_tomato()$id, function(j){
            lab <- paste("ID #:", data_tomato()[data_tomato()$id == j,5],
                         "Tray:", data_tomato()[data_tomato()$id == j,3],
                         "Row:", data_tomato()[data_tomato()$id == j,1],
                         "Col:", data_tomato()[data_tomato()$id == j,2],
                         "Weight:", data_tomato()[data_tomato()$id == j,4],"(g)")
            radioButtons(inputId = paste("input", j, sep = "_"),label = lab,
                         choices = c("None" = "none","Treatment 1" = "t1","Treatment 2" = "t2",
                                     "Treatment 3" = "t3","Treatment 4" = "t4"), inline = TRUE)
        })
    })
    data_tomato_update <- reactive({
        req(nrow(data_tomato() > 0))
        d <- data_tomato()
        treatment <- unlist(sapply(paste("input",d$id,sep = "_"),function(p) input[[p]]))
        req(sum(is.null(treatment)) == 0)
        d$treatment <- c(treatment)
        d$fertilizer <- ifelse(d$treatment == "none",0,ifelse(d$treatment == "t1",input$treat_1_manure,
                                                   ifelse(d$treatment == "t2",input$treat_2_manure,
                                                   ifelse(d$treatment == "t3",input$treat_3_manure,
                                                   ifelse(d$treatment == "t4",input$treat_4_manure,0)))))
        ## simple heat ATM
        heat <- matrix(rep(c(seq(22,10,by = -2),seq(14,22,by = 2)), each = 12), ncol = 12)
        ## simple light ATM
        light <- matrix(rep(seq(1,0.1,by = -0.08), each = 12), ncol = 12, byrow = TRUE)
        ## crude biomass growth model atm
        bio <- hm <- lm <- numeric(nrow(d)) 
        for(i in 1:length(bio)){
            hm[i] <- heat[d$row[i], d$col[i]]
            lm[i] <- light[d$row[i], d$col[i]]
            bio[i] <- tomgro(initial = d$initial[i],manure = d$amount[i]/100, days = input$tom_days, heat = hm[i], light = lm[i])
        }
        d$days <- input$tom_days
        d$heat_metric <- hm
        d$light_metric <- lm
        d$yield <- bio
        d
    })
    observe({
        req(nrow(data_tomato()) > 0)
        if(nrow(data_tomato_update()) > 0){
            shinyjs::show("download_tomato")
        }
        
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
            write.csv(data_tomato_update(), con, row.names = FALSE)
            
        }
    )

    ## Chick output
    observe({
        req(any(!is.null(c(input$dieta1, input$dietb1, input$dietc1, input$dietd1, input$diete1, input$dietf1, input$dietg1, input$dieth1,
                           input$dieta2, input$dietb2, input$dietc2, input$dietd2, input$diete2, input$dietf2, input$dietg2, input$dieth2,
                           input$dieta3, input$dietb3, input$dietc3, input$dietd3, input$diete3, input$dietf3, input$dietg3, input$dieth3,
                           input$dieta4, input$dietb4, input$dietc4, input$dietd4, input$diete4, input$dietf4, input$dietg4, input$dieth4))))
        ids <- paste0(rep(letters[1:8], 4), rep(1:4, each = 8))

        # Update list of diets for updating the downloadable dataframe...
        if (!inherits(diets(), "character"))
            ldiets <- character(32)
        else
            ldiets <- diets()

        # Update UI
        lapply(1:32, function(i) {
            v <- input[[paste0('diet', ids[i])]]
            output[[ids[i]]] <- renderUI({
                if (is.null(v))
                    tagList(div(""))
                else
                    tagList(if (v == "Maize") {
                        div(
                            class = "boxed_emo",
                            h4("Diet"),
                            img(class = "grow", src = "img/corn.png"),
                            h4("Copper units added"),
                            h4(input[[ids[i]]])
                        )
                    } else{
                        div(
                            class = "boxed_emo",
                            h4("Diet"),
                            img(class = "grow", src = "img/wheat.png"),
                            h4("Copper units added"),
                            h4(input[[ids[i]]])
                        )
                    })
            })

            if (!is.null(v)) {
                ldiets[i] <<- v
            }
        })

        # Update for DF
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
to look into how pullets respond to the amount of copper added to basic diets of either wheat or maize
You need to determine the optimum amount of copper to add to their diets to improve growth rate.")
     output$chicktxt1 <- renderText("You are told that 150 units of copper added to either
diet seems to improve growth. It is also known that there is a level of copper beyond which
 toxic effects will reduce growth rate. So what is the optimum amount to add?")
    output$chicktxt2 <- renderText("At your disposal you have  32 cages that each contain 16 chicks.
In addition to the amount of copper in their diet there are other factors that influence the growth rate of
chicks (e.g., brooder, tier position within the hen house etc.).")

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
    output$txt <- renderText("Two
 farmers, Esther and Gwenllian, grow pumpkins
 in Pukekohe for the farmer's market. After several years,
 Esther clearly gets higher yields than Gwenllian. But why?
 Several factors—variety, heat, and light—differ
 in cultivation methods. Farmer Esther is conservative;
 she uses natural heating, ambient lighting, and a variety of
 pumpkin called Kumi Kumi, whilst Gwenllian uses
 supplementary heating, controlled lighting, and a variety
 called Buttercup. Can you design a two-stage experiment and,
 based on the results, decide which combination of the three factors of
 heat, light, and variety gives the highest pumpkin yield?")
    output$txt2 <- renderText("Due to funding cuts you only a have small
 greenhouse to carry out this experiment. The greenhouse has six north
 facing plots (A–F) and six south facing (G–L). Your colleague tells you that from
 previous experiments in the greenhouse there is known to be a
 substantial difference in yields between the two sides
 of the greenhouse.")
    lapply(LETTERS[1:12], function(i) {
        output[[i]] <- renderUI({
            tagList(
                if(i %in% input$heat) icon("solar-panel"),
                if(i %in% input$light) icon("sun"),
                validate(need(!is.null(input$variety[[i]]),"")),
                if(input$variety[[i]] == "Kumi Kumi"){
                    img(class = "grow",src = "img/kumi.png")
                }else{
                    if(input$variety[[i]] == "Buttercup"){
                        img(class = "grow",src = "img/butter.png")
                    }
                })
        })
    })
     observeEvent(input$shuffle_pumpkins, {
        pumpRandomise(session)
    })
    data <- reactive({
        h <- rep("Natural",12)
        l <- rep("Ambient",12)
        h[LETTERS[1:12] %in% input$heat] <- "Supplemented"
        l[LETTERS[1:12] %in% input$light] <- "Controlled"
        data <- data.frame(variety = unlist(input$variety),
                           heat = h,
                           light = l,
                           side = rep(c("North","South"), each = 6))
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
