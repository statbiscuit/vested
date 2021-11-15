
brooderRadio <- function(x) {
  radioobjs <- list()

  for (i in 1:8)
    radioobjs[[i]] <- radioButtons(
      paste0('diet', letters[i], x),
      label = paste("Nest", seq(0, 24, by = 8)[x] + i),
      choices = c("Maize", "Wheat"),
      selected = character(0),
      inline = TRUE
    )

  do.call(inputPanel, c(radioobjs))
}

updateDiets <- function(old, new, input, output) {
  changed <- which(new != old)
  ids <- paste0(rep(letters[1:8], 4), rep(1:4, each = 8))
  if (length(changed) > 0) {
    updates <- list()

    for (i in changed) {
      if (!is.null(new[i])) {
        x <- tagList(if (new[i] == "Maize") {
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
        output[[ids[i]]] <- renderUI(x)
      }
    }
  }
}

heatRandomise <- function(session) {
    n <- sample(1:12, size = 1)
    newVals <- sample(LETTERS[1:12], size = n)
    updateCheckboxGroupInput(session, "heat", selected = newVals)
}
lightRandomise <- function(session) {
    n <- sample(1:12, size = 1)
    newVals <- sample(LETTERS[1:12], size = n)
    updateCheckboxGroupInput(session, "light", selected = newVals)
}
chickRandomise <- function(session, x) {
    newVals <- sample(c("Maize", "Wheat"), 8, replace = TRUE)
    for (i in 1:8) {
        updateRadioButtons(session, paste0('diet', letters[i], x),
                           selected = newVals[i])
    }
}

