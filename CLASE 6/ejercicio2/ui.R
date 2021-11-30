#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("UI Dinamico"),
    tabsetPanel(tabPanel("Ejemplo 1", 
                         numericInput('min1',"limite inferior",value=5),
                         numericInput('max1',"limite inferior",value=10),
                         sliderInput('slider1','Seleccione Valor',
                                     min=0,max=15,value=5)
                        ),
                tabPanel("Ejemplo 2",
                         sliderInput('s1','Seleccione Valor',min=-5,max=5,value=0),
                         sliderInput('s2','Seleccione Valor',min=-5,max=5,value=0),
                         sliderInput('s3','Seleccione Valor',min=-5,max=5,value=0),
                         sliderInput('s4','Seleccione Valor',min=-5,max=5,value=0),
                         actionButton('reset','Reiniciar')
                        ),
                tabPanel("Ejemplo 3",
                         numericInput('n','corridas',value=10),
                         actionButton('correr','correr')
                         ),
                tabPanel("Ejemplo 4",
                         numericInput('nvalue','valor',value=0)
                         ),
                tabPanel("Ejemplo 5",
                         numericInput('celcius','temperatura en celcius',value=NA),
                         numericInput('farenheit','temperatura en farenheit',value=NA)
                         ),
                tabPanel("Ejemplo 6",
                         br(),
                         selectInput('dist','Seleccione Distribucion',
                                     choices = c('Normal','Uniforme','Exponencial')),
                         numericInput('n_random','Cuantos numero aleatorios',value=100,min=0),
                         hr(),
                         tabsetPanel(id='params',
                                     type='hidden',
                                     tabPanel('Normal',
                                              h1('Distribucion Normal'),
                                              numericInput('media','media',value = 0),
                                              numericInput('sd','sd',value = 1)
                                              ),
                                     tabPanel('Uniforme',
                                              h1('Distribucion Uniforme'),
                                              numericInput('unif_min','minimo',value = 0),
                                              numericInput('unif_max','maximo',value = 1)
                                              ),
                                     tabPanel('Exponencial',
                                              h1('Exponencial'),
                                              numericInput('razon','razon',value = 1,min=0)
                                              )
                                     ),
                         plotOutput('plot_dist')
                         )
        
    )

  
))
