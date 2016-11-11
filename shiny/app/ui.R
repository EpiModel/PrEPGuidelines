library(shiny)
library(shinydashboard)
library(wesanderson)
library(plotly)
source("fx.R")

shinyUI(dashboardPage(
    dashboardHeader(title = "CDC PrEP Guidelines Model"),
    dashboardSidebar(
        width = 200,
        sidebarMenu(
            menuItem("Introduction", tabName = "Introduction", icon = icon("book")),
            menuItem("Model Scenarios", tabName = "Model", icon = icon("line-chart"))
        )
        
            
        ),
    dashboardBody(
        tabItems(
            
            ## Introduction tab ##
            tabItem(tabName = "Introduction",
                    column(10, offset = 1,
                           h3("Impact of HIV Pre-Exposure Prophylaxis among MSM in the United States",
                              style = "color: #193556;"),
                           h4("A Web-Based Modeling Tool for Public Health Practice", style = "color: #2E619E;"),
                           hr(),
                           p("This software tool provides additional opportunities to explore the
                             mathematical models of the paper:",
                             tags$blockquote("Jenness SM, Goodreau SM, Rosenberg E,
                                             Beylerian EN, Hoover KW, Smith DK, Sullivan P.",
                                             "Impact of CDC's HIV Preexposure Prophylaxis
                                             Guidelines among MSM in the United States.", em("In Press, Journal of Infectious Diseases."),
                                             "2016. Advance access online ahead of print:  DOI: 10.1093/infdis/jiw223", 
                                             tags$a("[Paper Link]", target="_blank", href = "http://jid.oxfordjournals.org/content/early/2016/07/12/infdis.jiw223.full")),                 "This webtool provides tools to explore the simulation results from the main CDC guidelines
                             modeling scenario (J2) that served as the basis of the main analysis results and
                             sensitivity analyses."),
                           p("To get started, enter a desired number of years in the simulation. One model alone
                             or a two-model comparison set may be shown together based on different coverage and 
                             adherence parameters. The parameters are defined as follows:"),
                           tags$ul(
                               tags$li(strong("PrEP Coverage:"), "the proportion of MSM indicated for PrEP
                                       under the CDC guidelines who initiate PrEP. The default value is 40%
                                       coverage."),
                               tags$li(strong("PrEP Adherence:"), "the proportion of MSM who are highly adherent
                                       to PrEP, defined as taking 4+ pills per week, which is associated with a
                                       95% reduction in the per-act probability of infection. The default value is
                                       60%, following adherence data from an open-label demonstration project.")
                               ),
                           p("After selecting the parameters set in each model, the model will
                             automatically update the plots and summary data tables."),
                           p("In addition to these model parameters, select a starting HIV prevalence
                             that corresponds to the local value of interest and the number of years for
                             the PrEP intervention simulation. Note that the model in the paper corresponds
                             to a starting prevalence of 26% that corresponds to observed values in a cohort of
                             Atlanta-area MSM. Bayesian calibration methods were used to arrive at the other
                             starting prevalences by adjusting the frequency of anal intercourse within
                             partnerships; since other factors may also contribute to variation in local HIV
                             prevalence, this model assumption should be considered when evaluating the
                             results."),
                           hr(),
                           p(em("We acknowledge support from the CDC/NCHHSTP Epidemiological and Economic Modeling Agreement (5U38PS004646).
                                The findings and conclusions used to build this tool are solely the responsibility of the authors and do not
                                necessarily represent the official views of the Centers for Disease Control and Prevention or the Department
                                of Health and Human Services."))
                           )
                    
                           ),
        tabItem(
            ## Model Scenarios Tab ##
            tabName = "Model",
            tags$head(
                tags$link(rel = "stylesheet", type = "text/css", href = "style.css"),
                tags$script(type = "text/javascript", src = "busy.js")
            ),
            
            div(class = "busy",
                img(src = "ajax-loader.gif")
            ),
            
            fluidRow(
                column(width = 8,
                box(width = NULL,
                    title = "Model Plots", status = "primary", solidHeader = TRUE,
                    plotOutput("a_Plot", height = 510),
                    selectInput(inputId = "dtype", label = "Summary Statistic",
                                choices = c("Prevalence", "Incidence", "Number Infections Averted",
                                            "Percent Infections Averted", "Number Needed to Treat"))
                ),
                box(width = NULL,
                    title = "Summary Statistics", status = "primary", solidHeader = TRUE,
                    uiOutput("tablecaption"),
                    div(class = "table3",
                        tableOutput("table")
                    )
                )
                    ),
                
                column(width = 4,
                box(width = NULL,
                title = "Model 1 Parameters" , status = "success", solidHeader = TRUE,
                sliderInput(inputId = "a_coverage",
                            label = "PrEP Coverage (%)",
                            min = 10, max = 90, step = 10, value = 40),
                sliderInput(inputId = "a_adherence",
                            label = "Proportion Highly Adherent",
                            min = 10, max = 90, step = 10, value = 60)
                ),
                box(width = NULL,
                title = "Model 2 Parameters" , status = "success", solidHeader = TRUE,
                sliderInput(inputId = "b_coverage",
                            label = "PrEP Coverage (%)",
                            min = 10, max = 90, step = 10, value = 40),
                sliderInput(inputId = "b_adherence",
                            label = "Proportion Highly Adherent",
                            min = 10, max = 90, step = 10, value = 60)
                ),
                box(width = NULL,
                title = "Model Settings" , status = "success", solidHeader = TRUE,
                selectInput(inputId = "prevalence", label = "Starting HIV Prevalence",
                            choices = c("26% (Paper Model)",
                                        "20%", "15%", "10%")),
                sliderInput(inputId = "years", label = "Simulation Years",
                            min = 1, max = 10, step = 1, value = 10),
                sliderInput(inputId = "quantile", label = "Credible Interval",
                            min = 0, max = 1, step = 0.01, value = 0.95)
                )
                    )
            ),
            
            fluidRow(
                box(width = 12, height = 210,
                    title = "Definitions", status = "info", solidHeader = TRUE,
                    p("The following epidemiological outcomes are featured in the tables and plots:"),
                    tags$ul(
                        tags$li(strong("Prevalence:"), "the proportion of MSM infected at the final time step of the simulation."),
                        tags$li(strong("Incidence:"), "the number of new infections per 100 person-years of
                                time at risk the final time step in the simulation."),
                        tags$li(strong("Number of Infections Averted (NIA):"), "compared to a base model in which
                                there would be no PrEP available, the number of infections averted due to PrEP over the cumulative
                                simulation time. This is expressed in terms of 100,000 person-years at risk."),
                        tags$li(strong("Percent of Infections Averted (PIA):"), "the NIA over the total number
                                of infections that occurred in the base model, in the absence of any PrEP."),
                        tags$li(strong("Number Needed to Treat (NNT):"), "the number of person-years on PrEP needed to prevent one
                                new HIV infection in the population.")
                        )
                    
                        )
            
                
                )
            )
            )
                           )
                           )
                           )




