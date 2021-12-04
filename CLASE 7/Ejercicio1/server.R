#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(dplyr)
library(ggplot2)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$tabla1 <- DT::renderDataTable({
        mtcars %>%
            DT::datatable(rownames = FALSE, 
                          filter = 'top',
                          options = list(
                              pageLength = 10,
                              lengthMenu = c(5,10,15)
                              
                          )
                          )
    })
    
    output$tabla2 <- DT::renderDataTable({
        diamonds %>%
            mutate(volumen= x*y*z,
                   volumen_promedio = mean(volumen),
                   volp = volumen/volumen_promedio) %>%
            DT::datatable(filter = 'top')%>%
            formatCurrency(columns = 'price', currency = '$')%>%
            formatPercentage(columns='volp',digits=2)%>%
            formatRound(columns= c('volumen','volumen_promedio'),digits = 2)%>%
            formatString(columns='volumen',suffix=' mm^3')
        
        
            
        })
    #SELECCION FILAS
    output$tabla3 <- DT::renderDataTable({
        
        mtcars %>%
            DT::datatable(selection = list(mode = 'single',
                                        target = 'row'
                                        )
                          )
    })
    
    output$output1 <- renderPrint({
        input$tabla3_rows_selected
    })
    
    output$tabla4 <- DT::renderDataTable({
        
        mtcars %>%
            DT::datatable(selection = list(mode = 'multiple',
                                           target = 'row'
            )
            )
    })
    
    output$output2 <- renderPrint({
        input$tabla4_rows_selected
    })
    #SELECCION Columnas
    output$tabla5 <- DT::renderDataTable({
        
        mtcars %>%
            DT::datatable(selection = list(mode = 'single',
                                           target = 'column'
            )
            )
    })
    output$output3 <- renderPrint({
        input$tabla5_columns_selected
    })
    
    output$tabla6 <- DT::renderDataTable({
        
        mtcars %>%
            DT::datatable(selection = list(mode = 'multiple',
                                           target = 'column'
            )
            )
    })
    
    output$output4 <- renderPrint({
        input$tabla6_columns_selected
    })
    
    #seleccion de celdas
    output$tabla7 <- DT::renderDataTable({
        
        mtcars %>%
            DT::datatable(selection = list(mode = 'single',
                                           target = 'cell'
            )
            )
    })
    output$output5 <- renderPrint({
        input$tabla7_cells_selected
    })
    
    output$tabla8 <- DT::renderDataTable({
        
        mtcars %>%
            DT::datatable(selection = list(mode = 'multiple',
                                           target = 'cell'
            )
            )
    })
    
    output$output6 <- renderPrint({
        input$tabla8_cells_selected
    })

})
