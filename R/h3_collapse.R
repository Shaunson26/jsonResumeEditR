#' Create h3 with collapsable inner
#'
#' A h3 title with inners collapsable. Uses the JS script ...
#'
#' @param title title text
#' @param ... inner elements
h3_collapse <- function(title, ...) {

  tagList(
    tags$h3(
      class = "btn-collapse",
      `data-toggle` = 'collapse',
      href = paste0('#', title, '-collapse'),
      paste("\U25BC", title)
    ),
    tags$div(
      id = paste0(title, '-collapse'),
      class = "collapse in",
      ...
    )
  )

}
