#' Create JSON section R6 object
#'
#' Extend the `json_section` R6 to include specifics for a section
#'
#' @param name R6 class name, will be used as the section name
#' @param extender list of functions including input_group_ui and value_extractor
#'
#' @return an R6 object
#'
#' @export
create_section_object <- function(name, extender){

  tmp <-
    R6::R6Class(name,
            inherit = json_section,
            public = list(
              input_group_ui = extender$input_group_ui,
              value_extractor = extender$value_extractor
            )
    )

  tmp$new(section_name = name)

}
