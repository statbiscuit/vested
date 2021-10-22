## CRAN packages
pkgs <- c("shinyjs",              
          "shinyWidgets",
          "shinyRadioMatrix",
          "ggplot2",
          "ggsn",
          "stringr",
          "remotes")
options(warn = -1)
for (i in pkgs){
    if (!require(i, quietly = TRUE, character.only = TRUE)){
        install.packages(i)
        require(i)
    }
}

## packages from GitHub
if(!require(typed, quietly = TRUE)) {remotes::install_github("JohnCoene/typed")} 
require(typed, quietly = TRUE)
if(!require(shinyDNDvested, quietly = TRUE)) {remotes::install_github("statbiscuit/shinyDNDvested")} 
require(shinyDNDvested, quietly = TRUE)
options(warn = 0)

## experiment scripts
source("scripts/pumpkin.r")
source("scripts/chickens.r")
source("scripts/tomgro.r")
## helper script
source("scripts/ui-helpers.r")
