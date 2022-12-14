#' TabPanel template for JSON resume basics information
#'
#' @param id id to use for shiny namespacing
#'
#' @import shiny
#' @export
tabPanel_template <- function(id){

  ns <- NS(id)

  tabPanel(title = 'template',
           # inputId should match the JSON fields e.g. 'name' (basics$name)
           textInput(ns('fieldId'), 'fieldId', placeholder = 'fill me')
  )
}
