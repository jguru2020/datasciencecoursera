library(plotly)
library(shiny)
library(dplyr)
library(readr)
library(purrr)

shinyUI(
  navbarPage("Shiny Application",
             tabPanel("Analysis",
                      fluidPage(plotlyOutput("pie"),uiOutput("back"))
             ),
             tabPanel("Data Set",
                      
                      p("A data frame with 263 observations and 5 variables. 
                        This data related to individuals expenses for the year 2019")
             ),
             tabPanel("How-To",
                      h2("Usage of the application"),
                      p("Drill-down the pie chart by clicking on individual categories. 
                        Navigate back using the Back button ")
                      
             ),
             tabPanel("Source Code",
                      p(" Source code related to Shiny App (ui.R & server.R) uploaded to the following repository"),
                      a("https://github.com/jguru2020/jguru2020.github.io/tree/master/dataproducts/week4")
                      
             )
  )
)
