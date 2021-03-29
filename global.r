## CRAN packages
pkgs <- c("shinyjs","shinyWidgets","shinyRadioMatrix","ggplot2","ggsn","shinyDND","stringr","remotes")
options(warn = -1)
for (i in pkgs){
  if (!require(i, quietly = TRUE, character.only = TRUE)){
    install.packages(i)
  }
  require(i, quietly = TRUE, character.only = TRUE)
}
## packages from GitHub
if(!require("typed",quietly = TRUE, character.only = TRUE)) remotes::install_github("JohnCoene/typed")
require(typed)
options(warn = 0)

## experiment scripts
source("scripts/pumpkin.r")
source("scripts/chickens.r")
source("scripts/tomgro.r")
