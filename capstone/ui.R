shinyUI(navbarPage("Capstone: Word Prediction Project",
                   tabPanel("Predict Your Next Word",
                            # Sidebar
                            sidebarLayout(
                              sidebarPanel(
                                helpText("Enter a partial/complete sentence to begin the next word prediction"),
                                textInput("inputString", "Enter a word phrase",value = ""),
                                br(),
                                br(),
                                br(),
                                br()
                              ),
                              mainPanel(
                                h1("Next Word Prediction"),
                                verbatimTextOutput("prediction"),
                                strong("Sentence Input:"),
                                tags$style(type='text/css', '#text1 {background-color: rgba(254,255,0,0.30); color: brown;}'), 
                                textOutput('text1'),
                                br(),
                                strong("Note:"),
                                tags$style(type='text/css', '#text2 {background-color: rgba(255,255,0,0.40); color: Red;}'),
                                textOutput('text2')
                              )
                            )
                            
                   ),
                   tabPanel("Info",
                            mainPanel(
                              includeMarkdown("Info.md")
                            )
                   )
)
)