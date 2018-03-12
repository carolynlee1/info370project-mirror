source("../firstmodel.R")
library(plotly)


server <- function(input, output) {
  

  output$bench_plot<- renderPlotly({plot_ly( x=c("With Creatine", "Without Creatine"), 
                                     y=c( predict(model1,  data.frame(Initial.Training.Status..years. = input$selectYearsTrained,
                                                                      With.or.Without ="With")), 
                                          predict(model1,  data.frame(Initial.Training.Status..years. = input$selectYearsTrained,
                                                                      With.or.Without ="Without"))), type="bar", 
                                     marker = list(color = c('purple', 'gold'))) %>%  
      layout(title = "Bench Press Improvement", xaxis = list(title = "Creatine Usage"), yaxis = list(title = "Percentage of Increase"))
    })
  
  
  
  output$squat_plot <- renderPlotly({plot_ly( x=c("With Creatine", "Without Creatine"), 
                                            y=c( predict(model1,  data.frame(Initial.Training.Status..years. = input$selectYearsTrained,
                                                                             With.or.Without ="With")), 
                                                 predict(model1,  data.frame(Initial.Training.Status..years. = input$selectYearsTrained,
                                                                             With.or.Without ="Without"))), type="bar", 
                                            marker = list(color = c('purple', 'gold'))) %>%  
      layout(title = "Bench Press Improvement", xaxis = list(title = "Creatine Usage"), yaxis = list(title = "Percentage of Increase"))
  })
  

  
  output$grouped_plot <-  renderPlotly({
    with_creatine_data <- c(predict(model1,  data.frame(Initial.Training.Status..years. = input$selectYearsTrained,
                                           With.or.Without ="With")), 
               predict(model1,  data.frame(Initial.Training.Status..years. = input$selectYearsTrained,
                                           With.or.Without ="With")))
    without_creatine_data <- c( predict(model1,  data.frame(Initial.Training.Status..years. = input$selectYearsTrained,
                                            With.or.Without ="Without")), 
                predict(model1,  data.frame(Initial.Training.Status..years. = input$selectYearsTrained,
                                            With.or.Without ="Without")))
    data %>% 
      plot_ly() %>%
      add_trace(name = 'With Creatine', x = ~c("Bench Press", "Squat"), y = with_creatine_data, type = "bar",
                text = round(with_creatine_data, digits=2), textposition = 'auto',
                marker = list(color = 'rgb(158,202,225)',
                              line = list(color = 'rgb(8,48,107)', width = 1.5))) %>%
      add_trace(name = 'Without Creatine', x = ~c("Bench Press", "Squat"), y = without_creatine_data, 
                                   type = "bar",
                text = round(without_creatine_data, digits = 2), textposition = 'auto',
                marker = list(color = 'rgb(58,200,225)',
                              line = list(color = 'rgb(8,48,107)', width = 1.5))) %>%
      layout(title = "Type of workout vs Percentage of Increase",
             barmode = 'group',
             xaxis = list(title = "Type of workout"),
             yaxis = list(title = "Percentage of Increase"))
  })
   


  output$yes_creatine_response <- reactive({
    years_response <- predict(model1,  data.frame(Initial.Training.Status..years. = input$selectYearsTrained,
                                                  With.or.Without ="With"))
    years_response <- as.numeric(years_response)
    round(years_response, digits = 2)
    new_bench <- (1 + years_response/100) * as.numeric(input$inputBenchWeight)
    
    text <- paste("If you have worked out for <b>", input$selectYearsTrained,
                  "</b> years you would increase your Bench 1RM by <b>", round(years_response, digits = 2), 
                  "%</b> with creatine. You would go from having a <b>", input$inputBenchWeight, "</b> to having
                  a <b>",  round(new_bench, digits = 2), "</b> 1RM.", sep = "")
  })
  
  
  output$no_creatine_response <- reactive({
    years_response <- predict(model1,  data.frame(Initial.Training.Status..years. = input$selectYearsTrained,
                                                  With.or.Without ="Without"))
    years_response <- as.numeric(years_response)
    new_bench <- (1 + years_response/100) * as.numeric(input$inputBenchWeight)
    text <- HTML(paste("If you have worked out for <b>", input$selectYearsTrained,
                  "</b> years you would increase your Bench 1RM by <b>", round(years_response, digits = 2), 
                  "%</b> without creatine. You would go from having a <b>", input$inputBenchWeight, "</b> to having
                  a <b>",  round(new_bench, digits = 2), "</b> 1RM.", sep = ""))
  })


  
  output$inputBodyInfo <- renderPrint({input$inputBodyWeight})
  output$inputGenderInfo <- renderPrint({input$selectGender})

  output$inputYearsInfo <- renderPrint({input$selectYearsTrained})
  output$inputBenchInfo <- renderPrint({input$inputBenchWeight})
  output$inputSquatInfo <- renderPrint({input$inputSquatWeight})

}