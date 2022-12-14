demo_template <- function(){

  ui <-
    fluidPage(
      tabPanel_template(id = 'test'),
      actionButton('clear', 'clear'),
      actionButton('import', 'import'),
      actionButton('retrieve', 'retrieve'),
      textOutput('result')
    )

  server <-
    function(input, output, session) {

      import <- list(fieldId = 'a value')

      # clear form
      observe(
        mod_template(id = 'test', do_what = 'clear')
      ) %>%
        bindEvent(input$clear)

      # import form
      observe(
        mod_template(id = 'test', do_what = 'import', import = import)
      ) %>%
        bindEvent(input$import)

      # retrieve values
      result <-
        reactive({
          list(field = mod_template(id = 'test', do_what = 'retrieve')())
        }) %>%
        bindEvent(input$retrieve)

      observe({
        result() %>%
          print()
      })

      # for testing
      output$result <- renderText(
        unlist(result())
      )

    }

  shiny::shinyApp(ui, server)
}
