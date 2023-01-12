#' JSON section inputs
#'
#' @import shiny
basics_inputs <- function(){

  ns <- function(id){
    sprintf("basics_%s", id)
  }

  tags$div(class="form-group", style="width: 100%;padding: 4px;",
           textInput(ns('name'), label = 'Name'),
           textInput(ns('label'), label = 'Job label'),
           textInput(ns('image'), label = 'Image'),
           textInput(ns('email'), label = 'Email'),
           textInput(ns('phone'), label = 'Phone'),
           textInput(ns('url'), label = 'URL'),
           textAreaInput(ns('summary'), label = 'Summary', width = '100%', resize = 'vertical'),
           textInput(ns('location_address'), label = 'Address'),
           textInput(ns('location_city'), label = 'City'),
           textInput(ns('location_region'), label = 'Region'),
           textInput(ns('location_postalCode'), label = 'Postal code'),
           textInput(ns('location_countryCode'), label = 'Country')
  )

}

profiles_inputs <- function(){

  ns <- function(id){
    sprintf("basics_profiles_{{row-count-placeholder}}_%s", id)
  }

  tags$div(class="form-group", style="width: 100%;padding: 4px;",
           textInput(ns('network'), label = 'Network'),
           textInput(ns('username'), label = 'Username'),
           textInput(ns('url'), label = 'URL')
  )

}

work_inputs <- function(){

  ns <- function(id){
    sprintf("work_{{row-count-placeholder}}_%s", id)
  }

  tags$div(class="form-group", style="width: 100%;padding: 4px;",
           textInput(ns('name'), label = 'Name'),
           textInput(ns('position'), label = 'Position'),
           textInput(ns('url'), label = 'URL'),
           date_input(ns('startDate'), label = 'Start date'),
           date_input(ns('endDate'), label = 'End date'),
           textAreaInput(ns('summary'), label = 'Summary', width = '100%', resize = 'vertical'),
           textAreaInput(ns('highlights'), label = 'Highlights', width = '100%', resize = 'vertical',
                         placeholder = 'Dot points (new line per point)')
  )
}

volunteer_inputs <- function() {

  ns <- function(id){
    sprintf("volunteer_{{row-count-placeholder}}_%s", id)
  }

  tags$div(class="form-group", style="width: 100%;padding: 4px;",

           textInput(ns('organization'), label = 'Organization'),
           textInput(ns('position'), label = 'Position'),
           textInput(ns('url'), label = 'URL'),
           date_input(id = ns('startDate'), label = 'Start date'),
           date_input(id = ns('endDate'), label = 'End date'),
           textAreaInput(ns('summary'), label = 'Summary', width = '100%', resize = 'vertical'),
           textAreaInput(ns('highlights'), label = 'Highlights', width = '100%', resize = 'vertical')
  )

}

education_inputs <- function(){

  ns <- function(id){
    sprintf("education_{{row-count-placeholder}}_%s", id)
  }

  tags$div(class="form-group", style="width: 100%;padding: 4px;",

           textInput(ns('institution'), label = 'Institution'),
           textInput(ns('url'), label = 'URL'),
           textInput(ns('area'), label = 'Subject area'),
           textInput(ns('studyType'), label = 'Study type'),
           date_input(ns('startDate'), label = 'Start date'),
           date_input(ns('endDate'), label = 'End date'),
           textInput(ns('score'), label = 'Score'),
           textAreaInput(ns('courses'), label = 'Courses', width = '100%', resize = 'vertical')
  )

}

awards_inputs <- function(){

  ns <- function(id){
    sprintf("awards_{{row-count-placeholder}}_%s", id)
  }

  tags$div(class="form-group", style="width: 100%;padding: 4px;",

           textInput(ns('title'), label = 'Institution'),
           date_input(id = ns('date'), label = 'Date'),
           textInput(ns('awarder'), label = 'Awarder'),
           textAreaInput(ns('summary'), label = 'Summary', width = '100%', resize = 'vertical')
  )

}


certificates_inputs <- function(){

  ns <- function(id){
    sprintf("certificates_{{row-count-placeholder}}_%s", id)
  }

  tags$div(class="form-group", style="width: 100%;padding: 4px;",

           textInput(ns('name'), label = 'Name'),
           date_input(id = ns('date'), label = 'Date'),
           textInput(ns('issuer'), label = 'Issuer'),
           textInput(ns('url'), label = 'URL')
  )

}

publications_inputs <- function(){

  ns <- function(id){
    sprintf("publications_{{row-count-placeholder}}_%s", id)
  }

  tags$div(class="form-group", style="width: 100%;padding: 4px;",

           textInput(ns('name'), label = 'Name'),
           textInput(ns('publisher'), label = 'publisher'),
           date_input(id = ns('releaseDate'), label = 'Release date'),
           textInput(ns('url'), label = 'URL'),
           textAreaInput(ns('summary'), label = 'Summary', width = '100%', resize = 'vertical')
  )

}

skills_inputs <- function(){

  ns <- function(id){
    sprintf("skills_{{row-count-placeholder}}_%s", id)
  }

  tags$div(class="form-group", style="width: 100%;padding: 4px;",

           textInput(ns('name'), label = 'Name'),
           textInput(ns('level'), label = 'Level'),
           textAreaInput(ns('keywords'), label = 'Keywords', width = '100%', resize = 'vertical')
  )

}

languages_inputs <- function(){

  ns <- function(id){
    sprintf("languages_{{row-count-placeholder}}_%s", id)
  }

  tags$div(class="form-group", style="width: 100%;padding: 4px;",

           textInput(ns('language'), label = 'Language'),
           textInput(ns('fluency'), label = 'Fluency')
  )

}

interests_inputs <- function(){

  ns <- function(id){
    sprintf("interests_{{row-count-placeholder}}_%s", id)
  }

  tags$div(class="form-group", style="width: 100%;padding: 4px;",

           textInput(ns('name'), label = 'Name'),
           textAreaInput(ns('keywords'), label = 'Keywords', width = '100%', resize = 'vertical')
  )

}

references_inputs <- function(){

  ns <- function(id){
    sprintf("references_{{row-count-placeholder}}_%s", id)
  }

  tags$div(class="form-group", style="width: 100%;padding: 4px;",

           textInput(ns('name'), label = 'Name'),
           textAreaInput(ns('reference'), label = 'Reference', width = '100%', resize = 'vertical')
  )

}

projects_inputs <- function(){

  ns <- function(id){
    sprintf("projects_{{row-count-placeholder}}_%s", id)
  }

  tags$div(class="form-group", style="width: 100%;padding: 4px;",

           textInput(ns('name'), label = 'Name'),
           textAreaInput(ns('description'), label = 'Description'),
           textAreaInput(ns('highlights'), label = 'Highlights', width = '100%', resize = 'vertical'),
           textAreaInput(ns('keywords'), label = 'Keywords', width = '100%', resize = 'vertical'),
           date_input(id = ns('startDate'), label = 'Start date'),
           date_input(id = ns('endDate'), label = 'End date'),
           textInput( ns('url'), label = 'URL'),
           textAreaInput(ns('roles'), label = 'Roles', width = '100%', resize = 'vertical'),
           textInput(ns('entity'), label = 'Entity'),
           textInput(ns('type'), label = 'Type')
  )

}




















