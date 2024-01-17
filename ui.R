#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Linear Model Summary of mtcars Investigating How the Inclusion of Variables Affect MPG"),

    # Sidebar for Variable Selection
    sidebarLayout(
        sidebarPanel(
          checkboxGroupInput("varSelect", label = h3("Variables to Include:"),
                             choices = list("cyl", "disp", "hp", "drat", "wt", "qsec", "vs", "am", "gear", "carb"),
                             selected = list("cyl", "disp", "hp", "drat", "wt", "qsec", "vs", "am", "gear", "carb"))
        ),

        # Show a table of the model summary
        mainPanel(fluidRow(
          column(12,
                 dataTableOutput('model')
          )
        ),
        h3("Description of Variables:"),
        h4("cyl = Number of Cylinders"),
        h4("disp = Displacement (cu.in.)"),
        h4("hp = Gross horsepower"),
        h4("drat = Rear axle ratio"),
        h4("wt = Weight (1000 lbs)"),
        h4("qsec = 1/4 mile time"),
        h4("vs = Engine (0 = V-shaped, 1 = straight)"),
        h4("am = Transmission (0 = automatic, 1 = manual)"),
        h4("gear = Number of forward gears"),
        h4("carb = Number of carburetors")
        )
    )
)
)