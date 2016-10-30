library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Betting Analyzer"),
  
  # Sidebar with a slider input for number of dollars 
  sidebarLayout(
    sidebarPanel(
      h3("Give me the amount of money that you want to earn from your betting coupon"),
       sliderInput("money",
                   "Earnings in dollars:",
                   min = 100,
                   max = 2000000,
                   value = 1000),
      
      h3("Give me the number of games that you want to include in your betting coupon"),
      sliderInput("num_bets",
                  "Num of games:",
                  min = 1,
                  max = 15,
                  value = 5)
      
    ),
   
    # Show a plot of the generated distribution
    mainPanel(
      h4("Link to User Documentation:"),
      a("https://github.com/gtargus/datasciencecoursera/tree/master/DevelopNewProducts"),
      h3("The average per game return to make that cash is :"),
      textOutput("bettingAnalysis"),
      h3("The probability of making that cash is(e-4)% :"),
      textOutput("Odds")
    )
  )
))
