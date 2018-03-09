# Define UI for app that draws a histogram ----
ui <- fluidPage(
  
  # App title ----
  titlePanel("Team Awesome Possum"),
  
  navbarPage("Creatine!",
             tabPanel("About the project",
                        mainPanel(
                          h1("Welcome to Project Creatine"),
                          p("Our group wanted to explore about creatine and its effects on workout. We were interested 
                              about exploring various meta-analysis in order to create our own model to help those unlock
                              their workout potential.")
                        )
             ),
             tabPanel("Unlock your Potential",
                      sidebarLayout(
                        
                        # Sidebar panel for inputs ----
                        sidebarPanel(
                          
                          #Body Weight input
                          textInput("inputBodyWeight", label = h3("Bodyweight input"), placeholder = "Enter Weight..."),
                          
                          #Gender Input
                          selectInput("selectGender", label = h3("Gender"), 
                                      choices = list("Male" = 'm', "Female" = 'f', "Other" = 'o'), 
                                      selected = 'm'),
                          
                          #Years Trained Input
                          selectInput("selectYearsTrained", label = h3("Years Trained"), 
                                      choices = list("1" = 1, "2" = 2, "3" = 3,"4" = 4,"5" = 5,"6" = 6,"7" = 7,"8" = 8,"9" = 9,"10" = 10), 
                                      selected = 1),
                          
                          #Bench Output
                          textInput("inputBenchWeight", label = h3("Bench weight input"), placeholder = "Enter Bench Weight..."),
                          
                          #Squat Input
                          textInput("inputSquatWeight", label = h3("Squat weight input"), placeholder = "Enter Squat Weight...")
                        ),
                        
                        # Main panel for displaying outputs ----
                        mainPanel(
                          #Testing to see if inputs are going in
                          textOutput("inputBodyInfo"),
                          textOutput("inputGenderInfo"),
                          textOutput("inputYearsInfo"),
                          textOutput("inputBenchInfo"),
                          textOutput("inputSquatInfo")
                          
                          #Output: ModelPlot 
                          # plotOutput(outputId = "modelPlot")
                        )
             )
    )
  )
)
