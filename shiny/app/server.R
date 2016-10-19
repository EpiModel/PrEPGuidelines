library(shiny)
library(shinydashboard)
library(wesanderson)
library(plotly)
source("fx.R")


shinyServer(function(input, output, session) {
    
    scenarioA <- reactive({
        runScenario(input$prevalence, input$a_coverage, input$a_adherence, input$years)
    })
    scenarioB <- reactive({
        runScenario(input$prevalence, input$b_coverage, input$b_adherence, input$years)
    })
    
    output$a_Plot <- renderPlot({
        par(mar = c(3,3,1,1), mgp = c(2,1,0))
        plotScenario(datA = scenarioA(), datB = scenarioB(),
                     dtype = input$dtype, quantile = input$quantile)
    })
    
    
    output$table <- renderTable({
        tabScenario(datA = scenarioA(), datB = scenarioB(), quantile = input$quantile)
    })
    
    output$tablecaption <- renderUI({
        helpText("Epidemiological outcomes after", input$nyears,
                 "years of simulations. Reported values are simulation means with a",
                 paste0(input$quantile*100, "%"), "credible interval. Editing",
                 "inputs in the left panel and/or plot options will update the",
                 "table values.")
    })
})
