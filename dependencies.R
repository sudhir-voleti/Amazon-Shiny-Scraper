# Install / Load relevant packages
if(!"pacman" %in% installed.packages()[,"Package"]) install.packages("pacman")
pacman::p_load(rvest, dplyr, tidyr, stringr,shiny,markdown,DT)
#pacman::p_load(DT)
