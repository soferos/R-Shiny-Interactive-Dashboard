shinyServer(function(input, output) {
  
          output$plot <- renderPlot({
            if (input$wants_group) {
              group_col <-  input$group_col
            } else {
              group_col <-  NULL
            }
            
            heart %>% ggplot(
              aes(x = !!input$x_axis, y = cp, color = !!group_col)) +
                geom_point()
            
          })
          output$user_data <- renderDataTable({
            heart
          })
})
