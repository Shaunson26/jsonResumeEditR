#' jsonResumeEditR app
#'
#' Page with text inputs, where sections are separated into tab panels
library(shiny)
library(jsonlite)

ui <-
  fluidPage(
    titlePanel('JSON resume editor'),
    fluidRow(
      column(12,
             p('A form interface to create, edit and export a JSON resume.')
      )
    ),
    fluidRow(
      column(6,
             fileInput('import', 'Import JSON')
      ),
      column(6,
             actionButton('export', 'Export JSON')
      )
    ),

    tabsetPanel(
      tabPanel_basics(id = 'basics'),
      tabPanel_profiles(id = 'profiles')
    )
  )

server <-
  function(input, output, session) {

    mod_profiles('profiles')

    # Import JSON logic ----
    observe({

      file <- input$import
      req(file)
      import <- jsonlite::fromJSON(file$datapath, simplifyDataFrame = FALSE)
      #import <- jsonlite::fromJSON('inst/extdata/json-resume-input-tester.json', simplifyDataFrame = FALSE)

      # clear form - TODO
      mod_basics(id = 'basics', do_what = 'clear', import = import)


      # update form - TODO
      mod_basics(id = 'basics', do_what = 'import', import = import)

    })


    # JSON build logic ----
    # TODO - autobox issues with length 1 list
    json_resume <-
      reactive({

        # profiles
        #profileInputs <- return_complete_profile_inputs(input)

        # work
        #workInputs <- return_complete_work_inputs(input)

        # Build list
        json_resume_list <-
          list(
            basics = mod_basics(id = 'basics', do_what = 'retrieve')()
          )

        json_resume_list %>%
          toJSON(pretty = TRUE, auto_unbox = TRUE)
      }) %>%
      bindEvent(input$export)

    observe({
      json_resume() %>%
        print()
    }) %>%
      bindEvent(json_resume())


  }

# Run the application
shinyApp(ui = ui, server = server)
