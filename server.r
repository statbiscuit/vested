## server.R ##
function(input, output,session) {
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
Yileds are down, money's tight, and the farm is at risk of bankruptcy. There is however rumour
of some fertilizer recipie handed down from your great-great-grandmother that will maximise
the yield of tomatoes. The exact recipie has however been lost to the hands of time.")
     output$tomtxt2 <- renderText("You know it involves horse manure, but what is the optimal dose?
 To save your family's farm you must find the optimal dose of fertilier that produces the maximum
average biomass of tomatoes. You should note that the greenhouse
is bordered to the East and West with heating strips. In addition,
the greenhouse is lighted by light tubes, see the pattern of the floor
for the resulting light intensity pattern
that will be experienced by the plants. Heat and light are known to affect plant growth.")
    ## seedling weights for tray 1
    output$tray1 <- renderUI({
        out_list <- lapply(paste("a",1:12,sep = ""),function(t){
            dragUI(t,h3(icon("seedling",class = "tray1"), 
                        renderText({
                            round(runif(1,0,3),1)
                        }), h5("tray 1")))
        })
        do.call('tagList',out_list)
    })
     ## seedling weights for tray 2
    output$tray2 <- renderUI({
        out_list <- lapply(paste("b",1:12,sep = ""),function(t){
            dragUI(t,h3(icon("seedling",class = "tray2"), 
                        renderText({
                            round(runif(1,0,3),1)
                        }), h5("tray 2")))
        })
        do.call('tagList',out_list)
    })
    ## seedling weights for tray 3
    output$tray3 <- renderUI({
        out_list <- lapply(paste("c",1:12,sep = ""),function(t){
            dragUI(t,h3(icon("seedling",class = "tray3"), 
                        renderText({
                            round(runif(1,0,3),1)
                        }), h5("tray 3")))
        })
        do.call('tagList',out_list)
    })
     ## seedling weights for tray 4
    output$tray4 <- renderUI({
        out_list <- lapply(paste("d",1:12,sep = ""),function(t){
            dragUI(t,h3(icon("seedling",class = "tray4"), 
                        renderText({
                            round(runif(1,0,3),1)
                        }), h5("tray 4")))
        })
        do.call('tagList',out_list)
    })
     ## seedling weights for tray 5
    output$tray5 <- renderUI({
        out_list <- lapply(paste("e",1:12,sep = ""),function(t){
            dragUI(t,h3(icon("seedling",class = "tray5"), 
                        renderText({
                            round(runif(1,0,3),1)
                        }), h5("tray 5")))
        })
        do.call('tagList',out_list)
    })
     ## seedling weights for tray 6
    output$tray6 <- renderUI({
        out_list <- lapply(paste("f",1:12,sep = ""),function(t){
            dragUI(t,h3(icon("seedling",class = "tray6"), 
                        renderText({
                            round(runif(1,0,3),1)
                        }), h5("tray 6")))
        })
        do.call('tagList',out_list)
    })
    ## seedling weights for tray 7
    output$tray7 <- renderUI({
        out_list <- lapply(paste("g",1:12,sep = ""),function(t){
            dragUI(t,h3(icon("seedling",class = "tray7"), 
                        renderText({
                            round(runif(1,0,3),1)
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
                            round(runif(1,0,3),1)
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
                            round(runif(1,0,3),1)
                        }), h5("tray 11")))
        })
        do.call('tagList',out_list)
    })
     ## seedling weights for tray 12
    output$tray12 <- renderUI({
        out_list <- lapply(paste("l",1:12,sep = ""),function(t){
            dragUI(t,h3(icon("seedling",class = "tray12"), 
                        renderText({
                            round(runif(1,0,3),1)
                        }), h5("tray 12")))
        })
        do.call('tagList',out_list)
    })
    observeEvent(input$greenhouse, {
        ## 12 places in the below important
        x <- paste(gsub("            ", "", input$greenhouse,fixed = TRUE))
        x <- paste(gsub("  ", "NA",x,fixed = TRUE))
        x <- stringr::str_sub(x, 3, stringr::str_length(x))
        x <- paste(gsub("\n\nNANANANANA", "",x,fixed = TRUE))
        x <-  matrix(stringr::str_split(x, "\n\n\n")[[1]], ncol = 1)
        x <- apply(x,1, stringr::str_split, pattern = "\n", simplify = FALSE)
        idx <- lapply(x,function(k) c(unlist(sapply(k, function(y) grep("tray",y)))))
        out <- replicate(12,rep("",12))
        ## figure out placement in 12 by 12 layout
        for(j in 1:12){
            if(length(idx[[j]]) != 0){
                for (i in idx[[j]]){
                    k <- (i-3):(i+1)
                    ts <- paste0(x[[j]][[1]][k],collapse = "")
                    ts1 <- gsub("NA", "",ts,fixed = TRUE)
                    res <- gsub("\n", "",ts1,fixed = TRUE)
                    col <- ifelse(min(k) > 12,min(k)  - (length(idx[[j]]) - 1)*5,min(k))
                    ## crude catch for 13 col
                    if(col > 12) col <- 12
                    out[j,col] <- res
                }
            }
        }

        print(out)
    })
    ## Chick output
    output$chicktxt <- renderText("You have been employed by the University's Poultry Research Farm
to look into how pullets respond to the amount of copper added to basic diets of either wheat or maize
You need to determine the optimum amount of copper to add to their diets to improve growth rate.")
     output$chicktxt1 <- renderText("You are told that 150 units of copper added to either
diet seems to improve growth. It is also known that there is a level of copper beyond which
 toxic effects will reduce growth rate. So what is the optimum amount to add?")
    output$chicktxt2 <- renderText("At your disposal you have  32 cages that each contain 16 chicks.
In addition to the amount of copper in their diet there are other factors that influence the growth rate of
chicks (e.g., brooder, tier position within the hen house etc.).")
    lapply(paste(letters[1:8],1,sep = ""), function(i) {
        output[[i]] <- renderUI({
            tagList(
                validate(need(!is.null(input$diet1[[i]]),"")),
                if(input$diet1[[i]] == "Maize"){
                    div(class = "boxed_emo",h4("Diet"), img(class = "grow", src = "img/corn.png"),
                        h4("Copper units added"), h4(input[[i]]))
                }else{
                     div(class = "boxed_emo",h4("Diet"), img(class = "grow", src = "img/wheat.png"),
                        h4("Copper units added"), h4(input[[i]]))}
                
            )
        })
    })
    lapply(paste(letters[1:8],2,sep = ""), function(i) {
        output[[i]] <- renderUI({
            tagList(
                validate(need(!is.null(input$diet2[[i]]),"")),
                if(input$diet2[[i]] == "Maize"){
                    div(class = "boxed_emo",h4("Diet"), img(class = "grow", src = "img/corn.png"),
                        h4("Copper units added"), h4(input[[i]]))
                }else{
                     div(class = "boxed_emo",h4("Diet"), img(class = "grow", src = "img/wheat.png"),
                        h4("Copper units added"), h4(input[[i]]))}
                
            )
        })
    })
    lapply(paste(letters[1:8],3,sep = ""), function(i) {
        output[[i]] <- renderUI({
            tagList(
                validate(need(!is.null(input$diet3[[i]]),"")),
                if(input$diet3[[i]] == "Maize"){
                    div(class = "boxed_emo",h4("Diet"), img(class = "grow", src = "img/corn.png"),
                        h4("Copper units added"), h4(input[[i]]))
                }else{
                     div(class = "boxed_emo",h4("Diet"), img(class = "grow", src = "img/wheat.png"),
                        h4("Copper units added"), h4(input[[i]]))}
                
            )
        })
    })
    lapply(paste(letters[1:8],4,sep = ""), function(i) {
        output[[i]] <- renderUI({
            tagList(
                validate(need(!is.null(input$diet4[[i]]),"")),
                if(input$diet4[[i]] == "Maize"){
                    div(class = "boxed_emo",h4("Diet"), img(class = "grow", src = "img/corn.png"),
                        h4("Copper units added"), h4(input[[i]]))
                }else{
                     div(class = "boxed_emo",h4("Diet"), img(class = "grow", src = "img/wheat.png"),
                        h4("Copper units added"), h4(input[[i]]))}
                
            )
        })
    })
    observe({
        if(length(unlist(input$diet1)) == 8 & length(unlist(input$diet2)) == 8 &
           length(unlist(input$diet3)) == 8 & length(unlist(input$diet4)) == 8){
            shinyjs::show("download_chick")
        }
    })
    data_chick <- reactive({
        data <- data.frame(
            chicknumber = 1:(32*16),
            nest = rep(1:32,each = 16),
            brooder = rep(rep(1:4, each = 8), each = 16),
            tier = rep(rep(rep(1:4, each = 2), times = 4),each = 16))
        data$diet <- rep(c(input$diet1, input$diet2, input$diet3, input$diet4),each = 16)
        print(dim(data))
        copper <- c(input$a1 , input$b1 , input$c1 , input$d1 , input$e1 , input$f1 , input$g1 , input$h1,
                         input$a2 , input$b2 , input$c2 , input$d2 , input$e2 , input$f2 , input$g2 , input$h2,
                         input$a3 , input$b3 , input$c3 , input$d3 , input$e3 , input$f3 , input$g3 , input$h3,
                         input$a4 , input$b4 , input$c4 , input$d4 , input$e4 , input$f4 , input$g4 , input$h4)
        data$copper <- rep(copper, each = 16)
        print(dim(data))
        data$growth <- round(sim_chick_growth(data),2)
        print(str(data))
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
 shee uses natural heating, ambient lighting, and a variety of
 pumpkin called Kumi Kumi, whilst Gwenllian uses
 supplementary heating, controlled lighting, and a variety
 called Buttercup. Can you design a two-stage experiment and,
 based on the results, decide which combination of the three factors of
 heat, light, and variety gives the highest pummpkin yield?")
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
