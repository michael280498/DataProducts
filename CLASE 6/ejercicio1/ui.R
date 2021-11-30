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
    titlePanel("Cargador de archivos"),
    sidebarLayout(
      sidebarPanel(
        fileInput('cargar_archivo','Cargar Archivo',
                  buttonLabel = 'Buscar',
                  placeholder = "No hay archivo seleccionado"),
        dateRangeInput('rango de fechas','Seleccione fechas',
                       min = '1900-01-05',
                       max = '2007-09-30',
                       start = '1900-01-05',
                       end = '2007-09-30'),
        downloadButton("download_dataframe","Descargar archivo")
      ),
      mainPanel(
        DT::dataTableOutput('contenido_archivo')
      )
    )

    
))
