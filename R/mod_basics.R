#' Server for JSON resume basics information
#'
#' @param id id to use for shiny namespacing
#' @param do_what character, flag to indicate what to do with inputs: clear, import (used with \code{import}) or retrieve
#' @param import list, imported JSON resume used for populating inputs
#'
#' @export
mod_basics <- function(id, do_what = c('clear', 'import', 'retrieve'), import) {

  do_what = do_what[1]

  moduleServer(
    id,
    function(input, output, session) {

      if (do_what == 'clear'){
        for(x in c("name", "label", "image", "email", "phone", "url","summary",
               "address", "postalCode", "city", "countryCode", "region")){
          updateTextInput(session, x, value = '')
        }
      }

      if (do_what == 'import'){

        for(x in c("name", "label", "image", "email", "phone", "url","summary")){
          updateTextInput(session, x, value = import$basics[[x]])
        }

        for(x in c("address", "postalCode", "city", "countryCode", "region")){
          updateTextInput(session, x, value = import$basics$location[[x]])
        }
      }

      if (do_what == 'retrieve'){

        reactive({
          list(
            name = input$name,
            label = input$label,
            image = input$image,
            email = input$email,
            phone = input$phone,
            url = input$url,
            summary = input$summary,
            location = list(
              address = input$address,
              postalCode = input$postalCode,
              city = input$city,
              countryCode = input$countryCode,
              region = input$region
            )
          )
        })


      }


    }

  )
}
