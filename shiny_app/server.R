source("../firstmodel.R")
source("../bodyweight-model.R")
library(plotly)


server <- function(input, output) {
  
  ### This renders a Plotly Grouped Bar Chart that takes in inputs from initial training, 
  ### and gender,in order to predict how much increase will be gained for bench press and squats.
  output$grouped_plot <-  renderPlotly({
    with_creatine_data <- c(predict(model1,  data.frame(Initial.Training = input$selectYearsTrained,
                                                        Creatine..y.n.="Y", Sex = input$selectGender)), 
               predict(model1,  data.frame(Initial.Training = input$selectYearsTrained,
                                           Creatine..y.n.="Y", Sex = input$selectGender)))
    without_creatine_data <- c( predict(model1,  data.frame(Initial.Training = input$selectYearsTrained,
                                                            Creatine..y.n.="N", Sex = input$selectGender)), 
                predict(model1,  data.frame(Initial.Training = input$selectYearsTrained,
                                            Creatine..y.n.="N", Sex = input$selectGender)))
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
   
  output$yes_creatine_response_bodyweight <- reactive({
    weight_amount <- predict(bodyMassModel, data.frame(Age = input$inputAge, Creatine = c(1)))
    weight_amount <- as.numeric(weight_amount)
    round(weight_amount, digits = 2)
    new_weight <- weight_amount + as.numeric(input$inputBodyWeight)
    
    if(input$inputWeightMeasure == "kgs") {
      text <- paste("If you currently weigh <b>", input$inputBodyWeight,
                    "</b> kgs ", 
                    ". You would go from weighing <b>", input$inputBodyWeight, "</b> kgs to weighing
                    a <b>",  round(new_weight, digits = 2), "</b> kgs.", sep = "")   
    } else {
      new_weight <- (weight_amount * 2.2) + as.numeric(input$inputBodyWeight) 
      
      text <- paste("If you currently weigh <b>", input$inputBodyWeight,
                    "</b> lbs ", 
                    ". You would go from weighing <b>", input$inputBodyWeight, "</b> lbs to weighing
                    a <b>",  round(new_weight, digits = 2), "</b> lbs", sep = "")
  
    }
  })
  
  
  output$no_creatine_response_bodyweight <- reactive({
    weight_amount <- predict(bodyMassModel, data.frame(Age = input$inputAge, Creatine = c(0)))
    weight_amount <- as.numeric(weight_amount)
    round(weight_amount, digits = 2)
    new_weight <- weight_amount + as.numeric(input$inputBodyWeight)
    
    if(input$inputWeightMeasure == "kgs") {
      text <- paste("If you currently weigh <b>", input$inputBodyWeight,
                    "</b> kgs. You would go from weighing <b>", input$inputBodyWeight, "</b> kgs to weighing
                    a <b>",  round(new_weight, digits = 2), "</b> kgs.", sep = "")   
    } else {
      new_weight <- (weight_amount * 2.2) + as.numeric(input$inputBodyWeight) 
      
      text <- paste("If you currently weigh <b>", input$inputBodyWeight,
                    "</b> lbs. You would go from weighing <b>", input$inputBodyWeight, "</b> lbs to weighing
                    a <b>",  round(new_weight, digits = 2), "</b> lbs", sep = "")
      
    }
    
  })
    
  ### This creates a message displaying how much increase would happen if creatine was taken.
  output$yes_creatine_response_lifts <- reactive({
    years_response <- predict(model1,  data.frame(Initial.Training = input$selectYearsTrained,
                                                  Creatine..y.n.="Y", Sex = input$selectGender))
    years_response <- as.numeric(years_response)
    round(years_response, digits = 2)
    
    if(input$inputWeightMeasure == "pounds") {
      years_response <- years_response * 2.2
      new_bench <- (1 + years_response/100) * as.numeric(input$inputBenchWeight)
      
      text <- HTML(paste("If you have worked out for <b>", input$selectYearsTrained,
                         "</b> years you would increase your Bench 1RM by <b>", round(years_response, digits = 2), 
                         "% </b> without creatine. You would go from having a <b>", input$inputBenchWeight, "lbs</b> to having
                         a <b>",  round(new_bench, digits = 2), "lbs</b> 1RM in 28 days.", sep = ""))
    } else {
      new_bench <- (1 + years_response/100) * as.numeric(input$inputBenchWeight)
      text <- HTML(paste("If you have worked out for <b>", input$selectYearsTrained,
                         "</b> years you would increase your Bench 1RM by <b>", round(years_response, digits = 2), 
                         "%</b> without creatine. You would go from having a <b>", input$inputBenchWeight, "kgs</b> to having
                  a <b>",  round(new_bench, digits = 2), "kgs</b> 1RM in 28 days.", sep = ""))
    }
  })
  
  ### This creates a message displaying how much increase would happen without creatine being taken.
  output$no_creatine_response_lifts <- reactive({
    years_response <- predict(model1,  data.frame(Initial.Training = input$selectYearsTrained,
                                                  Creatine..y.n.="N", Sex = input$selectGender))
    years_response <- as.numeric(years_response)
    
    if(input$inputWeightMeasure == "pounds") {
      years_response <- years_response * 2.2
      new_bench <- (1 + years_response/100) * as.numeric(input$inputBenchWeight)
      
      text <- HTML(paste("If you have worked out for <b>", input$selectYearsTrained,
                         "</b> years you would increase your Bench 1RM by <b>", round(years_response, digits = 2), 
                         "% </b> without creatine. You would go from having a <b>", input$inputBenchWeight, "lbs</b> to having
                         a <b>",  round(new_bench, digits = 2), "lbs</b> 1RM in 28 days.", sep = ""))
    } else {
      new_bench <- (1 + years_response/100) * as.numeric(input$inputBenchWeight)
      text <- HTML(paste("If you have worked out for <b>", input$selectYearsTrained,
                  "</b> years you would increase your Bench 1RM by <b>", round(years_response, digits = 2), 
                  "%</b> without creatine. You would go from having a <b>", input$inputBenchWeight, "kgs</b> to having
                  a <b>",  round(new_bench, digits = 2), "kgs</b> 1RM in 28 days.", sep = ""))
     }
    })


  ### This group of renders creates the inputs for the user to interact with the artifact.
  output$inputBodyInfo <- renderPrint({input$inputBodyWeight})
  output$inputGenderInfo <- renderPrint({input$selectGender})
  output$inputYearsInfo <- renderPrint({input$selectYearsTrained})
  output$inputBenchInfo <- renderPrint({input$inputBenchWeight})
  output$inputSquatInfo <- renderPrint({input$inputSquatWeight})
  

}