#' Template server for JSON resume information
#'
#' @param id id to use for shiny namespacing
#' @param do_what character, flag to indicate what to do with inputs: clear, import (used with \code{import}) or retrieve
#' @param import list, imported JSON resume used for populating inputs
#' @export
mod_template <- function(id, do_what = c('clear', 'import', 'retrieve'), import) {

  do_what = do_what[1]

  moduleServer(
    id,
    function(input, output, session) {

      # Clear is simple reset value to ''
      # Be mindful of repeatable fields fieldId-1, fieldId-2, fieldId-n
      if (do_what == 'clear'){
        for(fieldId in c('fieldId')){
          updateTextInput(session, fieldId, value = '')
        }
      }

      # Import may need to match a scalar (shiny id) to a nested list element
      # fieldId == import[fieldId] or fieldId == import$element[[fieldId]]
      if (do_what == 'import'){
        for(fieldId in c('fieldId')){
          updateTextInput(session, fieldId, value = import[[fieldId]])
        }
      }

      # Retrieve may need to fill a nested list element from a scalar (shiny id)
      # list(fieldId = input[[fieldId]]) or list(element=list(fieldId = input[[fieldId]]))
      if (do_what == 'retrieve'){
        reactive({
          list(
            fieldId = input[['fieldId']]
            )
        })
      }

    }

  )
}
