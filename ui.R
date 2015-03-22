## Load shiny library
library(shiny)
shinyUI(pageWithSidebar(
        titlePanel("Currency conversion application"),
        ## Sidebar
        sidebarPanel(
                helpText(p(h5("This application converts the selected currency based on your inputs."))),            
                br(),            
                selectInput("from", "From:", c("USD","UAH","EUR"), selected = "USD"),
                br(),    
                selectInput("to", "To:", c("USD","UAH","EUR"), selected = "EUR"),
                br(),
                numericInput("sum", label = p(h5("Choose the sum you want to convert")), value = 100)
                ),
        
        ## MainPanel
        mainPanel(
                tabsetPanel(
                        tabPanel("Output",
                                 p(h3("You exchange:")),
                                 textOutput("sum"),
                                 p(h3("You get:")), 
                                 tableOutput("converted")
                        ),
                        tabPanel("Documentation",
                                p(h4("Simple currency Converter:")),
                                 br(),
                                 helpText("This application converts currency one unit to another 
                                 Just to simplify input I chose 3 variants - USD, EUR and UAH (Ukrainian Hrivna)."),
                                 HTML("<b>I used real-time information about currency rates from <a href='http://finance.yahoo.com/q?s=API'>Yahoo! Finance</a> for the conversion</b>
                                 <br> <br>
                                
                                <br>USAGE:
                                User selects one of the conversion types and enters the interested sum, 
                                the application gets rate, converts the selected currency 
                                and displays the result on the Output tab.<br> 
                                  ")                
                        )
                )
        )      
))