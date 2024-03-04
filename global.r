## CRAN packages
## Has to be done this awkward way because shinyapps throws a tantrum otherwise
if(!require(shinyjs, quietly = TRUE)) {install.packages("shinyjs")} 
require(shinyjs, quietly = TRUE)
if(!require(shinyWidgets, quietly = TRUE)) {install.packages("shinyWidgets")} 
require(shinyWidgets, quietly = TRUE)
if(!require(shinyRadioMatrix, quietly = TRUE)) {install.packages("shinyRadioMatrix")} 
require(shinyRadioMatrix, quietly = TRUE)
if(!require(ggplot2, quietly = TRUE)) {install.packages("ggplot2")} 
require(ggplot2, quietly = TRUE)
if(!require(ggsn, quietly = TRUE)) {install.packages("ggsn")} 
require(ggsn, quietly = TRUE)
if(!require(stringr, quietly = TRUE)) {install.packages("stringr")} 
require(stringr, quietly = TRUE)
if(!require(remotes, quietly = TRUE)) {install.packages("remotes")} 
require(remotes, quietly = TRUE)
## packages from GitHub
if(!require(typedjs, quietly = TRUE)) {remotes::install_github("JohnCoene/typedjs")} 
require(typedjs, quietly = TRUE)
if(!require(shinyDNDvested, quietly = TRUE)) {remotes::install_github("statbiscuit/shinyDNDvested")} 
require(shinyDNDvested, quietly = TRUE)
options(warn = 0)

## experiment scripts
source("scripts/pumpkin.r")
source("scripts/chickens.r")
source("scripts/tomgro.r")
## helper script
source("scripts/ui-helpers.r")
