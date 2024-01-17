#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(broom)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  df <- mtcars
  df$cyl <- as.factor(df$cyl)
  df$vs <- as.factor(df$vs)
  df$am <- as.factor(df$am)
  
    output$model <- renderDataTable({
      
      modelmtcars <-  reactive({ 
        lm(as.formula(paste("mpg ~ ",paste0(input$varSelect,collapse="+"))), data=mtcars)
      })

   modelmtcars2 <- modelmtcars()
      broom::tidy(modelmtcars2)

    })
    

    
})
