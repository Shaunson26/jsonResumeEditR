#' Action button to remove input fields
#'
#' Runs custom javascript to remove input fields
#'
#' @return HTML tag
#' @export
remove_group_button <- function() {
  htmltools::tags$div(
    class = 'jr-btn-remove-container',
    htmltools::tags$button(
      id = 'remove',
      onclick = 'deleteInputGroup(this)',
      type = 'button',
      class = 'btn btn-default jr-btn-remove',
      '\U2716'
    )
  )
}
