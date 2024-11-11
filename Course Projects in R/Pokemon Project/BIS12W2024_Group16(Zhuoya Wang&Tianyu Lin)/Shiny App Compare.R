library("tidyverse")
library("janitor")
library("naniar")
library("dplyr")
library(shiny)
library(shinydashboard)

pokemon <- read_csv("pokemon.csv")

pokemon <- pokemon %>%
  mutate_all(~ifelse(. == "", NA, .))%>%
  mutate(type2 = replace_na(type2, 'none'))

pokemon$capture_rate <- as.numeric(as.character(pokemon$capture_rate))

ui <- dashboardPage(
  dashboardHeader(title = "Pokemon Compare"),
  dashboardSidebar(disable=T),
  dashboardBody(
    fluidRow(
      box(title = "Plot Options", width = 3,
          textInput("x", "Name"),
          textInput("y", "Name"),
          selectInput("z", "Select what to compare", choices = c("against_bug","against_dark","against_dragon","against_electric","against_fairy","against_fight","against_fire","against_flying","against_ghost","against_grass","against_ground","against_ice","against_normal","against_poison","against_psychic","against_rock","against_steel","against_water","attack","capture_rate","defense","hp","sp_attack","sp_defense","speed"),
                      selected = "hp")
      ), # close the first box
      box(title = "Compare", width = 9,
          plotOutput("plot", width = "600px", height = "500px")
      ) # close the second box
    ) # close the row
  ) # close the dashboard body
) # close the ui

server <- function(input, output, session) { 
  
  output$plot <- renderPlot({
    pokemon %>% 
      filter(name==input$x | name==input$y) %>%
      ggplot(aes_string(x="name",y=input$z, fill = "name")) + 
      geom_bar(stat = "identity",color="black",alpha=0.75) +
      geom_text(aes_string(label=input$z),size=5.5,vjust=-0.5,face="bold")+
      theme(axis.text.x = element_text(hjust = 1,size=15,face="bold"),
            axis.text.y = element_text(hjust = 1,size=15,face="bold"),
            axis.title.y = element_text(size=15,face="bold"))+
      labs(x = "")
  })
  
  session$onSessionEnded(stopApp)
  
}

shinyApp(ui, server)
