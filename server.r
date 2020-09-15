## server.R ##
function(input, output,session) {
    output$distPlot <- renderPlot({
        hist(rnorm(input$obs), col = 'darkgray', border = 'white')
    })
    session$onSessionEnded(stopApp)
}
