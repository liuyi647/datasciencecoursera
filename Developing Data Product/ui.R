library(shiny)

shinyUI(
    fluidPage(
        titlePanel("Earthquakes Between 22 Apr 2017 and 22 May 2017 in New Zealand"),
        hr(),
        br(),
        h4("Instruction"),
        p("This web application presents the earthquake data between 22/04/2017 - 22/05-2017 in New Zealand."),
        p("The data includes date time when earthquakes happened, location of earthquake center (longitude and latitude), magnitude level, depth(km) and depth levels"),
        p("Users are able to filter the data by the control panel on the left side. Select a range of magnitude by the Magnitude sliding bar. Select depth by the Depth checking boxes. The main table will list the filtered results. Meanwhile, user also can set the entry number per page and paging the table."),
        br(),
        sidebarPanel(
            sliderInput("magnitude",
                        "Magnitude:",
                        min = 0,
                        max = 7,
                        value = c(0, 7),
                        format="####"),
            uiOutput("depthControls"),
            actionButton(inputId = "clear_all", label = "Clear selection", icon = icon("check-square")),
            actionButton(inputId = "select_all", label = "Select all", icon = icon("check-square-o"))),
    
        mainPanel(dataTableOutput(outputId="table"))
    )
)