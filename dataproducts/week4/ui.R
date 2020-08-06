library(plotly)
library(shiny)
library(dplyr)
library(readr)
library(purrr)

#spend  = read_csv("https://jguru2020.github.io/data/Expenses.csv") 
#cats = unique(spend$category)
ui <-fluidPage(
  plotlyOutput("pie"),uiOutput("back"))

