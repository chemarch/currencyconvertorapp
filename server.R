## Load shiny library
library(shiny)
library(httr)
## Standard shinyserver function to caculate the outputs to be displayed
shinyServer(
        function(input, output) {
                
                output$from <- reactive({input$from})
                output$to <- reactive(input$to)
                output$sum <- reactive(paste(input$sum, input$from))
                  
                output$converted <- reactive({
                        rate <- read.csv(paste0("http://quote.yahoo.com/d/quotes.csv?s=", 
                                   input$from, input$to, "=X&f=sl1&e=.csv"), header = FALSE)
                        converted <- paste((input$sum*rate$V2), input$to)
                        })                
        }
)