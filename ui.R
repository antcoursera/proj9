
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)

shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Predict Salaries for the U.S. Professors"),
  
  # Sidebar with a slider input for number of bins
  sidebarPanel(
    h4("Please change the settings below to receive a new prediction"),
    radioButtons("rank", "Acadmeic Rank:",
                  c("Assistant Professor" = "AsstProf",
                       "Associate Professor" = "AssocProf", 
                       "Professor" = "Prof")),
    radioButtons("discipline", "Discipline:",
                c("Theoretical Departments" = "A",
                     "Applied Departments" = "B")),
    sliderInput("yrsphd",
                "Years since PhD:",
                min = 0,
                max = 70,
                value = 10),
    sliderInput("yrssrvc",
                "Years of Service:",
                min = 0,
                max = 70,
                value = 8),
    radioButtons("sex", "Sex:",
                 c("Male" = "Male",
                   "Female" = "Female"))
  ),
  # Show a plot of the generated distribution
  mainPanel(
    h2("Predicted Yearly Salary (US$)"),
    verbatimTextOutput("salary")
  )
))
