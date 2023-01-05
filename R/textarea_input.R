#' Text area input
#'
#' Create a text input
#'
#' @param id The input slot that will be used to access the value.
#' @param label Display label for the control, or NULL for no label.
#' @param value Initial value.'
#' @param placeholder	A character string giving the user a hint as to what can be
#' entered into the control. Internet Explorer 8 and 9 do not support this option.
textarea_input <- function(id, label, value=NULL, placeholder=NULL){

  htmltools::tags$div(
    class = 'jr-input-container',
    htmltools::tags$label(`for` = id, label),
    htmltools::tags$textarea(
      type = "text",
      class="form-control",
      cols = 100,
      rows = 5,
      id = id,
      name = id,
      placeholder = placeholder,
      style = 'resize: vertical',
      value
    )
  )

}
