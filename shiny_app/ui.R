
library(shinythemes)

# Define UI for app that predicts how much strength increase with and without creatine ----

ui <- fluidPage( theme = shinytheme("cerulean"),
  
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
                          numericInput("selectYearsTrained", label = h3("Years Trained"), value = 1),
                          
                          #Bench Output
                          textInput("inputBenchWeight", label = h3("Bench weight input"), value = 135),
                          
                          #Squat Input
                          textInput("inputSquatWeight", label = h3("Squat weight input"), value = 225)
                        ),
                        
                        # Main panel for displaying outputs ----
                        mainPanel(
                        
                          tags$strong("About the calculator:"),
                          p("When committing to a fitness journey, people often debate
                            whether taking supplements would be appropriate. The effect of supplements,
                            particularly creatine, will vary between people, and depends on factors such 
                            as body weight, current strength, etc. To guide your decision and estimate 
                            your potential growth, our calculator takes the most important factors and reports
                            your projected fitness growth, with and without creatine use."),
                          br(),
                          
                          tags$strong("Here are your possible lifts without creatine:"),
                          textOutput("no_creatine_response"),
                          br(),
                          tags$strong("Here are your possible lifts with creatine:"),
                          textOutput("yes_creatine_response"),

                          
                          br(),
                          tags$strong("Here is a graphical comparison"),
                          plotlyOutput("bench_plot")
                 
                        )
             )
    )
  )
)
