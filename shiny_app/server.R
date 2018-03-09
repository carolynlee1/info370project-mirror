server <- function(input, output) {
  
  
  
  output$inputBodyInfo <- renderPrint({input$inputBodyWeight})
  output$inputGenderInfo <- renderPrint({input$selectGender})

  output$inputYearsInfo <- renderPrint({input$selectYearsTrained})
  output$inputBenchInfo <- renderPrint({input$inputBenchWeight})
  output$inputSquatInfo <- renderPrint({input$inputSquatWeight})

}