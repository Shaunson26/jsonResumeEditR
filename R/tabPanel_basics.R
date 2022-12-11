#' TabPanel for JSON resume basics information
#'
#' @param id id to use for shiny namespacing
#'
#' @import shiny
#' @export
tabPanel_basics <- function(id){

  ns <- NS(id)

  tabPanel(title = 'Basics',
           fluidRow(
             column(2,
                    textInput(ns('name'), 'name', placeholder = 'John Doe')
             ),
             column(2,
                    textInput(ns('label'), 'label', placeholder = 'Programmer')
             ),
             column(2,
                    textInput(ns('image'), 'image')
             ),
             column(2,
                    textInput(ns('email'), 'email', placeholder = 'john@gmail.com')
             ),
             column(2,
                    textInput(ns('phone'), 'phone', placeholder = '(912) 555-4321')
             )
           ),

           textInput(ns('url'), 'url', placeholder = 'https://johndoe.com'),
           textAreaInput(ns('summary'), 'summary', placeholder = 'A summary of John Doe'),
           textInput(ns('address'), 'address', placeholder = "2712 Broadway St"),
           textInput(ns('postalCode'),'postalCode', placeholder= "CA 94115"),
           textInput(ns('city'), 'city', placeholder= "San Francisco"),
           textInput(ns('countryCode'), 'countryCode', placeholder = "US"),
           textInput(ns('region'), 'region', placeholder = "California")
  )
}
