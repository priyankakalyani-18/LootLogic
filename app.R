
# App URL: https://priyankakalyani.shinyapps.io/LootLogic/
# GitHub Repository: https://github.com/priyankakalyani-18/LootLogic/

library(shiny)
library(ggplot2)
library(dplyr)
library(shinythemes)

ui <- fluidPage(
  theme = shinythemes::shinytheme("slate"),
  titlePanel("LootLogic: Gacha Statistical Simulator"),
  sidebarLayout(
    sidebarPanel(
      h4("Simulation Parameters"),
      sliderInput("prob", "Base Rare Item Probability (%):", 
                  min = 0.1, max = 5.0, value = 0.6, step = 0.1),
      numericInput("pity_threshold", "Pity System Threshold (Pulls):", 
                   value = 90, min = 1, max = 200),
      numericInput("n_sims", "Number of Simulated Players:", 
                   value = 1000, min = 100, max = 5000),
      hr(),
      h5("Analysis Settings"),
      p("This uses Monte Carlo methods to simulate player outcomes.")
    ),
    mainPanel(
      h3("Simulation Results"),
      p("Distribution of pulls required to hit a rare item."),
      plotOutput("pullPlot"),
      hr(),
      h4("Statistical Summary Table"),
      tableOutput("statsTable")
    )
  )
)

server <- function(input, output) {
  sim_results <- reactive({
    set.seed(42)
    n_players <- input$n_sims
    prob <- input$prob / 100
    pity <- input$pity_threshold
    results <- replicate(n_players, {
      pulls <- 0
      success <- FALSE
      while(!success) {
        pulls <- pulls + 1
        if (runif(1) <= prob || pulls >= pity) { success <- TRUE }
      }
      return(pulls)
    })
    data.frame(PullsNeeded = results)
  })
  
  output$pullPlot <- renderPlot({
    df <- sim_results()
    ggplot(df, aes(x = PullsNeeded)) +
      geom_histogram(binwidth = 2, fill = "#4c96d7", color = "white", alpha = 0.8) +
      geom_vline(aes(xintercept = mean(PullsNeeded)), color = "red", linetype = "dashed") +
      theme_minimal() +
      theme(text = element_text(color = "white"),
            plot.background = element_rect(fill = "#272b30", color = NA),
            panel.background = element_rect(fill = "#272b30", color = NA))
  })
  
  output$statsTable <- renderTable({
    df <- sim_results()
    df %>% summarise("Avg Pulls" = mean(PullsNeeded), "Median" = median(PullsNeeded), 
                     "Min" = min(PullsNeeded), "Max" = max(PullsNeeded))
  })
}

shinyApp(ui = ui, server = server)

