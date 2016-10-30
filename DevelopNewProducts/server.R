library(shiny)

shinyServer(function(input, output) {

  bettingAnalysis<- reactive ({
    exp((log(input$money)/input$num_bets))  
  })
  num_bets<- reactive ({input$num_bets })   

  Odds<-reactive ({ 
    1/(bettingAnalysis() ^ num_bets()) *10000
    })  
  output$bettingAnalysis=renderText(bettingAnalysis())
  output$Odds=renderText(Odds())
})
