#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Interacciones del usuario con graficas"),
    tabsetPanel(
        tabPanel('Graficas shiny',
                 h1('Graficas en shiny'),
                 plotOutput('grafica_base_r'),
                 plotOutput('Grafica_ggplot')
                 ),
        tabPanel('Interacciones con Plots', 
                 plotOutput("plot_click_option",
                            click = 'clk',
                            dblclick = 'dclk',
                            hover = 'mouse_hover',
                            brush = 'mouse_brush'),
                 verbatimTextOutput('click_data'),
                 tableOutput('mtcars_tbl')
                )
        )

    
    
))
