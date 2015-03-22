## Load shiny library
library(shiny)
library(httr)
library(jsonlite)
## Standard shinyserver function to caculate the outputs to be displayed
shinyServer(
        function(input, output) {
                
                output$from <- reactive({input$from})
                output$to <- reactive(input$to)
                output$sum <- reactive(paste(input$sum, input$from))
                  
                output$converted <- reactive({
                        rate <- fromJSON(paste0("http://rate-exchange.appspot.com/currency?from=", 
                                                          input$from, "&to=", input$to))
                        converted <- paste((input$sum*rate$rate), input$to)
                        })                
        }
)