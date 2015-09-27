
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)
Salaries = read.csv('salaries.csv')
fit = lm(salary ~ ., Salaries)

shinyServer(function(input, output) {
  output$salary = renderText({round(
      predict(fit,data.frame(rank = factor(input$rank), discipline = factor(input$discipline), 
            yrs.since.phd = input$yrsphd, yrs.service = input$yrssrvc,
            sex = factor(input$sex))))
  })
})
