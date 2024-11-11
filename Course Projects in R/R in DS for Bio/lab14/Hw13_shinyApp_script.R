


library(tidyverse)
library(shiny)
#install.packages("shinydashboard")
library(shinydashboard)


######## Q2
ui <- dashboardPage(
  dashboardHeader(title = "UC Admissions"),
  dashboardSidebar( radioButtons("x", "Select Campus", choices = c("Davis", "Berkeley", "Irvine" ,"Los_Angeles", "Merced","Riverside", "San_Diego", "Santa_Barbara", "Santa_Cruz"), selected = "Davis"),
                    radioButtons( "y", "Select Status", choices = c("Applicants", "Admits","Enrollees"), selected = "Applicants"),
                    radioButtons("z", "Select Year", choices = unique(UC_admit$academic_yr))
  ),
  
  dashboardBody(
    plotOutput("plot", width = "500px", height = "400px")
    
  )
)

server <- function(input, output, session) {
  
  output$plot <- renderPlot({
    UC_admit%>%
      filter(campus == input$x)%>%
      filter(category == input$y)%>%
      filter(academic_yr == input$z)%>%
      ggplot(aes_string( x=  "ethnicity", y =  "filtered_count_fr"))+
      theme(plot.title = element_text(size = 10, angle = 60))+
      geom_bar(stat = "identity", fill = "lightskyblue")+
      labs(title = "Admissions by Ethnicity ")
    
  })
  output$plot <- renderPlot({
    UC_admit%>%
      filter(category == input$y)%>%
      filter(academic_yr == input$z)%>%
      ggplot(aes_string( x=  "ethnicity", y =  "filtered_count_fr"))+
      theme(plot.title = element_text(size = 10, angle = 60))+
      geom_bar(stat = "identity", fill = "lightskyblue")+
      labs(title = "Admissions by Ethnicity ") +theme_light()
    
  })
  
  session$onSessionEnded(stopApp)
}

shinyApp(ui, server)

##########Q3


ui <- dashboardPage(
  dashboardHeader(title = "UC Admissions"),
  dashboardSidebar( radioButtons("x", "Select Campus", choices = c("Davis", "Berkeley", "Irvine" ,"Los_Angeles", "Merced","Riverside", "San_Diego", "Santa_Barbara", "Santa_Cruz"), selected = "Davis"),
                    radioButtons( "y", "Select Status", choices = c("Applicants", "Admits","Enrollees"), selected = "Applicants"),
                    radioButtons("z", "Select Enthnicity", choices = unique(UC_admit$ethnicity))
  ),
  
  dashboardBody(
    plotOutput("plot", width = "500px", height = "400px")
    
  )
)

server <- function(input, output, session) {
  
  output$plot <- renderPlot({
    UC_admit%>%
      filter(campus == input$x)%>%
      filter(category == input$y)%>%
      filter(ethnicity == input$z)%>%
      ggplot(aes_string( x=  "academic_yr", y =  "filtered_count_fr"))+
      theme(plot.title = element_text(size = 10, angle = 60))+
      geom_bar(stat = "identity", fill = "lightskyblue")+
      labs(title = "Applicants by year ")
    
  })
  
  session$onSessionEnded(stopApp)
}

shinyApp(ui, server)

