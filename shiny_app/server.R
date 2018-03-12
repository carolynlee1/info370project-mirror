source("../firstmodel.R")
library(plotly)


server <- function(input, output) {
  

  output$bench_plot<- renderPlotly({plot_ly(, x=c("With creatine", "Without Creatine"), 
                                     y=c( predict(model1,  data.frame(Initial.Training.Status..years. = input$selectYearsTrained,
                                                                      With.or.Without ="With")), 
                                          predict(model1,  data.frame(Initial.Training.Status..years. = input$selectYearsTrained,
                                                                      With.or.Without ="Without"))), type="bar", 
                                     marker = list(color = c('purple', 'gold'))) %>%  
      layout(title = "Bench Press Improvement", xaxis = list(title = "Creatine Usage"), yaxis = list(title = "Percentage of Increase"))
    })
  
   


  output$yes_creatine_response <- reactive({
    years_response <- predict(model1,  data.frame(Initial.Training.Status..years. = input$selectYearsTrained,
                                                  With.or.Without ="With"))
    years_response <- as.numeric(years_response)
    round(years_response, digits = 2)
    new_bench <- (1 + years_response/100) * as.numeric(input$inputBenchWeight)
    
    text <- paste("If you have worked out for ", input$selectYearsTrained,
                  " years you would increase your Bench 1RM by ", round(years_response, digits = 2), 
                  "% with creatine. You would go from having a ", input$inputBenchWeight, " to having
                  a ",  round(new_bench, digits = 2), " 1RM.", sep = "")
  })
  
  
  output$no_creatine_response <- reactive({
    years_response <- predict(model1,  data.frame(Initial.Training.Status..years. = input$selectYearsTrained,
                                                  With.or.Without ="Without"))
    years_response <- as.numeric(years_response)
    new_bench <- (1 + years_response/100) * as.numeric(input$inputBenchWeight)
    text <- paste("If you have worked out for ", input$selectYearsTrained,
                  " years you would increase your Bench 1RM by ", round(years_response, digits = 2), 
                  "% without creatine. You would go from having a ", input$inputBenchWeight, " to having
                  a ",  round(new_bench, digits = 2), " 1RM.", sep = "")
  })

  asdf <- reactive({
    years_response <- predict(model1,  data.frame(Initial.Training.Status..years. = input$selectYearsTrained,
                                                  With.or.Without ="Without"))
    years_response <- as.numeric(years_response)
    new_bench <- (1 + years_response/100) * as.numeric(input$inputBenchWeight)
    text <- paste("If you have worked out for ", input$selectYearsTrained,
                  " years you would increase your Bench 1RM by ", round(years_response, digits = 2), 
                  "% without creatine. You would go from having a ", input$inputBenchWeight, " to having
                  a ",  round(new_bench, digits = 2), " 1RM.", sep = "")
  })


  output$inputBodyInfo <- renderPrint({input$inputBodyWeight})
  output$inputGenderInfo <- renderPrint({input$selectGender})

  output$inputYearsInfo <- renderPrint({input$selectYearsTrained})
  output$inputBenchInfo <- renderPrint({input$inputBenchWeight})
  output$inputSquatInfo <- renderPrint({input$inputSquatWeight})

}