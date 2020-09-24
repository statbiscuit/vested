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
 Esther clearly gets higher yields than Gwenllian. But why? Three variables affect yield 1) variety,
2) heat, and 3) light.")
    output$butter <- renderUI({
        kum <- c("A","B","C","D","E","F","G","H","I","J","K","L") %in% input$kumi
        but <- c("A","B","C","D","E","F","G","H","I","J","K","L")[!kum]
        checkboxGroupInput("up_but","", choices = but, inline = TRUE)
    })
    output$A <- renderUI({
        if("A" %in% input$kumi){
            img(src = "img/kumi.png")
        }else{
            if("A" %in% input$up_but){
                img(src = "img/butter.png")
            }
        }
    })
    output$B <- renderUI({
        if("B" %in% input$kumi){
            img(src = "img/kumi.png")
        }else{
            if("B" %in% input$up_but){
                img(src = "img/butter.png")
            }
        }
    })
    output$C <- renderUI({
        if("C" %in% input$kumi){
            img(src = "img/kumi.png")
        }else{
            if("C" %in% input$up_but){
                img(src = "img/butter.png")
            }
        }
    })
    output$D <- renderUI({
        if("D" %in% input$kumi){
            img(src = "img/kumi.png")
        }else{
            if("D" %in% input$up_but){
                img(src = "img/butter.png")
            }
        }
    })
    output$E <- renderUI({
        if("E" %in% input$kumi){
            img(src = "img/kumi.png")
        }else{
            if("E" %in% input$up_but){
                img(src = "img/butter.png")
            }
        }
    })
    output$F <- renderUI({
        if("F" %in% input$kumi){
            img(src = "img/kumi.png")
        }else{
            if("F" %in% input$up_but){
                img(src = "img/butter.png")
            }
        }
    })
    output$G <- renderUI({
        if("G" %in% input$kumi){
            img(src = "img/kumi.png")
        }else{
            if("G" %in% input$up_but){
                img(src = "img/butter.png")
            }
        }
    })
    output$H <- renderUI({
        if("H" %in% input$kumi){
            img(src = "img/kumi.png")
        }else{
            if("H" %in% input$up_but){
                img(src = "img/butter.png")
            }
        }
    })
    output$I <- renderUI({
        if("I" %in% input$kumi){
            img(src = "img/kumi.png")
        }else{
            if("I" %in% input$up_but){
                img(src = "img/butter.png")
            }
        }
    })
    output$J <- renderUI({
        if("J" %in% input$kumi){
            img(src = "img/kumi.png")
        }else{
            if("J" %in% input$up_but){
                img(src = "img/butter.png")
            }
        }
    })
    output$K <- renderUI({
        if("K" %in% input$kumi){
            img(src = "img/kumi.png")
        }else{
            if("K" %in% input$up_but){
                img(src = "img/butter.png")
            }
        }
    })
    output$L <- renderUI({
        if("L" %in% input$kumi){
            img(src = "img/kumi.png")
        }else{
            if("L" %in% input$up_but){
                img(src = "img/butter.png")
            }
        }
    })
    session$onSessionEnded(stopApp)
}
