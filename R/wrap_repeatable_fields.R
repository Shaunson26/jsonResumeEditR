#' Run the repeatable fields JS function
#'
#' Enable repeatable fields over elements
#'
#' @param wrapper = ".rf-wrapper",
#' @param container = ".rf-container",
#' @param row = ".rf-row",
#' @param add = ".add",
#' @param remove = ".remove",
#' @param move = ".move",
#' @param move_up = ".move-up",
#' @param move_down = ".move-down",
#' @param move_steps = ".move-steps",
#' @param template = ".rf-template",
#' @param is_sortable = TRUE,
#' @param before_add = NULL,
#' @param after_add = 'self.after_add',
#' @param before_remove = NULL,
#' @param after_remove = NULL,
#' @param sortable_options = NULL,
#' @param row_count_placeholder = "{{row-count-placeholder}}"
wrap_repeatable_fields <- function(wrapper = ".rf-wrapper",
                                   container = ".rf-container",
                                   row = ".rf-row",
                                   add = ".add",
                                   remove = ".remove",
                                   move = ".move",
                                   move_up = ".move-up",
                                   move_down = ".move-down",
                                   move_steps = ".move-steps",
                                   template = ".rf-template",
                                   is_sortable = TRUE,
                                   before_add = NULL,
                                   after_add = 'self.after_add',
                                   before_remove = NULL,
                                   after_remove = NULL,
                                   sortable_options = NULL,
                                   row_count_placeholder = "{{row-count-placeholder}}"){

  arguments <- as.list(environment())
  arguments_json <- jsonlite::toJSON(arguments, auto_unbox = T, null = 'null', pretty = TRUE)
  code_snippet <- '
  jQuery(function(){
    jQuery(".repeat").each(function(){
      jQuery(this).repeatable_fields(%s);
    });
  });'
  repeatable_fields_js <- sprintf(code_snippet, arguments_json)
  repeatable_fields_js <- gsub("\"(\\w+)\":", "\\1:", repeatable_fields_js)
  repeatable_fields_js <- gsub("\"(self.after_add)\"", "\\1", repeatable_fields_js)
  htmltools::tags$script(repeatable_fields_js)
}
