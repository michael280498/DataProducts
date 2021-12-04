#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(DT)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
    
    titlePanel("Tablas en DT"),
    tabsetPanel(
        tabPanel('Tablas DT',
                 h1('Vista Basica'),
                 DT::dataTableOutput('tabla1'),
                 h1('Filtros'),
                 DT::dataTableOutput('tabla2')
                 ),
        tabPanel('click en tablas',
                 fluidRow(
                     column(6,
                            h2('Single Select Row'),
                            DT::dataTableOutput('tabla3'),
                            verbatimTextOutput('output1')
                         
                     ),
                     column(6,
                            h2('Multiple Select Row'),
                            DT::dataTableOutput('tabla4'),
                            verbatimTextOutput('output2')
                            
                     )
                 ),
                    fluidRow(
                        column(6,
                               h2('Single Select Column'),
                               DT::dataTableOutput('tabla5'),
                               verbatimTextOutput('output3')
                               
                        ),
                        column(6,
                               h2('Multiple Select Column'),
                               DT::dataTableOutput('tabla6'),
                               verbatimTextOutput('output4')
                               
                        )
                    ),
                 fluidRow(
                     column(6,
                            h2('Single Select cell'),
                            DT::dataTableOutput('tabla7'),
                            verbatimTextOutput('output5')
                            
                     ),
                     column(6,
                            h2('Multiple Select cell'),
                            DT::dataTableOutput('tabla8'),
                            verbatimTextOutput('output6')
                            
                     )
                 )

                 )
    )

))
