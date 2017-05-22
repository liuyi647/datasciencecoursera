library(shiny)
library(data.table)

source("dataFilter.R", local = TRUE)


rawDt <- fread('data/earthquakes.csv')
dt <- subset(rawDt, select=c("datetime", "longitude", "latitude", "magnitude", "depth"))

dt$depthLevel <- ifelse(dt$depth <= 15, "very shallow",
                 ifelse(dt$depth > 15 & dt$depth <= 50, "mid shallow",
                 ifelse(dt$depth > 50 & dt$depth <= 70, "deep shallow",
                 ifelse(dt$depth > 70 & dt$depth <= 300, "intermediate-depth",
                 ifelse(dt$depth > 300, "deep-depth", NA)))))


depths <- sort(unique(dt$depthLevel))

shinyServer(function(input, output, session) {
    values <- reactiveValues()
    values$depths <- depths
    
    output$depthControls <- renderUI({
        checkboxGroupInput('depths', 'Depth', depths, selected=values$depths)
    })
    
    observe({
        if(input$clear_all == 0) return()
        values$depths <- c()
    })
    
    observe({
        if(input$select_all == 0) return()
        values$depths <- depths
    })
     
    dt.ordered <- reactive({
        filterData(dt, input$magnitude[1], input$magnitude[2], input$depths)
    })
    
    dataTable <- reactive({
        dt.ordered()
    })

    output$table <- renderDataTable(
        {dataTable()}, options = list(bFilter = FALSE, iDisplayLength = 50))
})