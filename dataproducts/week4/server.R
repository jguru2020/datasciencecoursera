server = function(input, output, session) {
  expenses    = read_csv("https://jguru2020.github.io/data/Expenses.csv") 
  categories  = unique(expenses$category)
  current_category = reactiveVal()
  
  spendData = reactive({
    if (!length(current_category())) {
      return(count(expenses, category, wt = spend))
    }
    expenses %>% filter(category %in% current_category()) %>% 
      count(sub_category, wt = spend)
  })
  
  output$pie = renderPlotly({
    descriptions = setNames(spendData(), c("labels", "values"))
    plot_ly(descriptions) %>%
      add_pie(
        labels = ~labels,
        values = ~values,
        customdata = ~labels
      ) %>%
      layout(title = current_category() %||% "Spend Analysis")
      
  })
  
  observe({
    catgry = event_data("plotly_click")$customdata[[1]]
      if(isTRUE(catgry %in% categories))
        current_category(catgry)
    
  })
  
  output$back <-renderUI({
    if (length(current_category()))
      actionButton("clear", "Back", icon("chevron-left",lib = "glyphicon"))
  })
  
  observeEvent(input$clear, current_category(NULL))
}