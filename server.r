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
    ## Pumpkin outputs
    output$txt <- renderText("Two
 farmers, Esther and Gwenllian, grow pumpkins
 in Pukekohe for the farmer's market. After several years,
 Esther clearly gets higher yields than Gwenllian. But why? Three variables, which can be controlled by the farmers,
 affect yield 1) variety, 2) heat, and 3) light. To ascertain what the ")
    lapply(LETTERS[1:12], function(i) {
        output[[i]] <- renderUI({
            tagList(
                ## img(src = "img/sparkle.gif"),
                if(i %in% input$heat) icon("solar-panel"),
                if(i %in% input$light) icon("sun"),
                validate(need(!is.null(input$variety[[i]]),"")),
                if(input$variety[[i]] == "Kumi Kumi"){
                    img(src = "img/kumi.png")
                }else{
                    if(input$variety[[i]] == "Buttercup"){
                        img(src = "img/butter.png")
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
    output$tpe <- renderTyped(typed::typed(list(h2("randomisation"),h2("blocking"),h2("replication")),
                                               typeSpeed = 100, loop = TRUE))
    output$download_pumpkin <- downloadHandler(
        filename = function() {
            paste('pumpkin_data-', Sys.Date(), '.csv', sep='')
        },
        content = function(con) {
            showModal(modalDialog(typedOutput("tpe"), footer = NULL))
            Sys.sleep(10)
            removeModal()
            write.csv(data(), con, row.names = LETTERS[1:12])
            
        }
    )
    session$onSessionEnded(stopApp)
}
