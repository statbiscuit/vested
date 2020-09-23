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
    output$A <- renderUI({
        if(input$varietyA == 'kumi'){
            img(src = "img/kumi.png")
        }else{
            if(input$varietyA == 'butter'){
                img(src = "img/butter.png")
            }
        }
    })
    output$B <- renderUI({
        if(input$varietyB == 'kumi'){
            img(src = "img/kumi.png")
        }else{
            if(input$varietyB == 'butter'){
                img(src = "img/butter.png")
            }
        }
    })
    output$C <- renderUI({
        if(input$varietyC == 'kumi'){
            img(src = "img/kumi.png")
        }else{
            if(input$varietyC == 'butter'){
                img(src = "img/butter.png")
            }
        }
    })
    output$D <- renderUI({
        if(input$varietyD == 'kumi'){
            img(src = "img/kumi.png")
        }else{
            if(input$varietyD == 'butter'){
                img(src = "img/butter.png")
            }
        }
    })
    output$E <- renderUI({
        if(input$varietyE == 'kumi'){
            img(src = "img/kumi.png")
        }else{
            if(input$varietyE == 'butter'){
                img(src = "img/butter.png")
            }
        }
    })
    output$F <- renderUI({
        if(input$varietyF == 'kumi'){
            img(src = "img/kumi.png")
        }else{
            if(input$varietyF == 'butter'){
                img(src = "img/butter.png")
            }
        }
    })
    output$G <- renderUI({
        if(input$varietyG == 'kumi'){
            img(src = "img/kumi.png")
        }else{
            if(input$varietyG == 'butter'){
                img(src = "img/butter.png")
            }
        }
    })
    output$H <- renderUI({
        if(input$varietyH == 'kumi'){
            img(src = "img/kumi.png")
        }else{
            if(input$varietyH == 'butter'){
                img(src = "img/butter.png")
            }
        }
    })
    output$I <- renderUI({
        if(input$varietyI == 'kumi'){
            img(src = "img/kumi.png")
        }else{
            if(input$varietyI == 'butter'){
                img(src = "img/butter.png")
            }
        }
    })
    output$J <- renderUI({
        if(input$varietyJ == 'kumi'){
            img(src = "img/kumi.png")
        }else{
            if(input$varietyJ == 'butter'){
                img(src = "img/butter.png")
            }
        }
    })
    output$K <- renderUI({
        if(input$varietyK == 'kumi'){
            img(src = "img/kumi.png")
        }else{
            if(input$varietyK == 'butter'){
                img(src = "img/butter.png")
            }
        }
    })
    output$L <- renderUI({
        if(input$varietyL == 'kumi'){
            img(src = "img/kumi.png")
        }else{
            if(input$varietyL == 'butter'){
                img(src = "img/butter.png")
            }
        }
    })
    session$onSessionEnded(stopApp)
}
