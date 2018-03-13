
library(shinythemes)
# Define UI for app that predicts how much strength increase with and without creatine ----

ui <- fluidPage( theme = shinytheme("cerulean"),
                 
  # App title ----
  titlePanel("Team Awesome Possum"),
  
  navbarPage("Creatine!",
             tabPanel("About the project",
                        mainPanel(
                          h1("Welcome to Project Creatine"),
                          tags$img(src='group_photo.jpg', height = 600, width = 800),
                          tags$strong("Our mission:"),
                          br(),
                          p("Our group wanted to explore about creatine and its effects on workout. We were interested 
                              about exploring various meta-analysis in order to create our own model to help those unlock
                              their workout potential.")
                        )
             ),
             tabPanel("Unlock your Potential",
                      sidebarLayout(

                        # Sidebar panel for inputs ----
                        sidebarPanel(
                          
                          #Age Input
                          numericInput("inputAge", label = h3("Age Input"), value = 23),
                          
                          #Gender Input
                          selectInput("selectGender", label = h3("Sex Input"), 
                                      choices = list("Male" = 'Male', "Female" = 'Female'), 
                                      selected = 'm'),
                          
                          #Years Trained Input
                          numericInput("selectYearsTrained", label = h3("Years Trained Input"), value = 2),
                          
                          #Body Weight input
                          textInput("inputBodyWeight", label = h3("Bodyweight Input"), value = "60"),
                          radioButtons("inputWeightMeasure", label = h3("Unit of Measurement"), choices = c("kgs", "pounds")),
                          
                          #Bench Output
                          textInput("inputBenchWeight", label = h3("Bench Weight Input"), value = 135),
                          
                          #Squat Input
                          textInput("inputSquatWeight", label = h3("Squat Weight Input"), value = 225)
                        ),
                        
                        # Main panel for displaying outputs ----
                        mainPanel(
                          tags$strong("Disclaimer:"), 
                          p("These numbers are calculated from 
                            working out four days a week for 28 days. Actual variance can differ with the type of workouts 
                            done."),
                          br(),
                          tags$strong("About the calculator:"),
                          p("When committing to a fitness journey, people often debate
                            whether taking supplements would be appropriate. The effect of supplements,
                            particularly creatine, will vary between people, and depends on factors such 
                            as body weight, current strength, etc. To guide your decision and estimate 
                            your potential growth, our calculator takes the most important factors and reports
                            your projected fitness growth, with and without creatine use."),
                          br(),
                          
                          tags$strong("Here are your possible lifts without creatine:"),
                          htmlOutput("no_creatine_response_lifts"),
                          br(),
                          tags$strong("Here are your possible lifts with creatine:"),
                          htmlOutput("yes_creatine_response_lifts"),

                          br(),
                          tags$strong("Here is how much you would weigh after 28 days without creatine:"),
                          br(),
                          htmlOutput("no_creatine_response_bodyweight"),
                          br(),
                          tags$strong("Here is how much you would weigh after 28 days with creatine:"),
                          br(),
                          htmlOutput("yes_creatine_response_bodyweight"),
                          
                          br(),
                          
                          br(),
                          tags$strong("Here is a graphical comparison:"),
                          br(),
                          plotlyOutput("grouped_plot")
                 
                        )
             )
    )
  )
)
