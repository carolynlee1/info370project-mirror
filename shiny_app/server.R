source("../firstmodel.R")

server <- function(input, output) {

 #  output$getUpdatedQH3 <- reactive({
#    total <- (housingVariables(input$QH1) + housingVariables(input$QH2) + 6 + housingVariables(input$QH4) + housingVariables(input$QH5) )
#    predictedHappiness(total / 5, input$Age, input$Gender, input$School)
#  })
  
  output$asdf <- reactive({
    predict(model1,  data.frame(Initial.Training.Status..years. = input$selectYearsTrained, With.or.Without ="With"))
    })

  
  output$inputBodyInfo <- renderPrint({input$inputBodyWeight})
  output$inputGenderInfo <- renderPrint({input$selectGender})

  output$inputYearsInfo <- renderPrint({input$selectYearsTrained})
  output$inputBenchInfo <- renderPrint({input$inputBenchWeight})
  output$inputSquatInfo <- renderPrint({input$inputSquatWeight})

}