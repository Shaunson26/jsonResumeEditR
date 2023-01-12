#' Update input values
#'
#' Update input values using a named vector that matches HTML IDs using jQuery
#'
#' @param x named vector with names matching HMTL IDs
update_input_values <- function(x){

  dot_points <- c('highlights$|keywords$|courses$|roles$')

  for(i in seq_along(x)){

    needs_dot_pointing <- grepl(dot_points, names(x)[i])

    if (needs_dot_pointing) {
      code <- sprintf('$("#%s").val($("#%s").val() + "%s" + "\\n")', names(x)[i], names(x)[i], x[i])
    } else {
      code <-  sprintf('$("#%s").val("%s")', names(x)[i], x[i])
    }

    shinyjs::runjs(code)
  }
}
