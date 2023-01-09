#' Create an JSON section R6 object
#'
#' @description
#' Create an object that has a number of generic methods for creating JSON resume
#' input sections, retrieving input values and updating values.
#' @export
json_section <- R6::R6Class(
  "json_section",
  public = list(

    #' @description
    #' Initialize an `json_section` object
    #'
    #' @param section_name The name of the section. This will be used as the prefix for many
    #' tag IDs, text, as well as to match to the JSON schema.
    initialize = function(section_name){
      self$section_name = section_name
      self$section_id = tolower(section_name)
    },

    #' @field section_name character, section name from `initialize`
    #' @field section_id character, lower case section name
    #' @field id_counter numeric, the count of inputs created for a section.
    section_name = character(0),
    section_id = character(0),
    id_counter = 0,

    #' @description
    #' Create a HTML container for section inputs. Expects that the method `input_group_ui`
    #' exists
    add_section_container = function(){

      if (is.null(self$input_group_ui)){
        stop('self$input_group_ui has not been defined yet. Please add to object.')
      }

      section_id = self$section_id

      container <-
        tags$div(
          class = 'section-container',
          id = paste0(section_id, '-container'),
          # content
          h3(self$section_name),
          if (section_id != 'basics') {
            actionButton(paste0('add-', section_id), label = '\U271A', class='jr-btn-add')
          },
          self$input_group_ui(self$id_counter, values = NULL, hide = FALSE)
        )

      self$id_counter = self$id_counter + 1

      container
    },

    #' @description
    #' A slot for the input group UI. Expected that this class will be extended
    #' and this method updated then.
    #'
    #' @param id_suffix a number to append to tag IDs - use `self$id_counter`
    #' @param values a list of values to fill inputs
    #' @param hide whether to create the UI hidden
    input_group_ui = function(id_suffix, values = NULL, hide = FALSE){
      NULL
    },

    #' @description
    #' Insert self$input_group_ui into section container
    #'
    #' @param values a list of values to fill inputs
    #' @param hide whether to include display:none as an inline style
    insert_section_ui = function(values = NULL, hide = FALSE){

      if (is.null(self$input_group_ui)){
        stop('self$input_group_ui has not been defined yet. Please add to object.')
      }

      selector = paste0('#', self$section_id, '-container')

      insertUI(selector = selector, where = 'beforeEnd',
               ui = self$input_group_ui(self$id_counter, values, hide))

      self$id_counter = self$id_counter + 1

    },

    #' @description
    #' Remove all inputs for a current section.
    clear_inputs = function(){
      selector = paste0('.', self$section_id, '-input-group')
      removeUI(selector = selector, multiple = TRUE)
    },

    #' @description
    #' Update input values from that imported from a JSON resume. Assumes `jsonlite::fromJSON()`
    #'
    #' @param values values a list of named values
    import_values = function(values){

      self$clear_inputs()

      if (self$section_id == 'basics') {

        values = values[['basics']]

        self$insert_section_ui(values = values, hide = TRUE)

      } else {

        if (self$section_id == 'profiles'){
          values = values$basics$profiles
        } else {
          values = values[[self$section_id]]
        }

        n_elements <- length(values)

        for(i in 1:n_elements){

          element_values = values[[i]]
          self$insert_section_ui(element_values)

        }
      }

    },

    #' @description
    #' Add a shiny observer to links the 'add *' to self$insert_section_ui()
    #'
    #' @param input shiny input list
    observe_add_section = function(input){

      input_id =  paste0('add-', self$section_id)

      observe({
        self$insert_section_ui()
      }) %>%
        bindEvent(input[[input_id]])
    },

    #' @description
    #' Retrieve values from the frontend input sectins
    #'
    #' @param form_data list from JS that returns input values
    get_values = function(form_data){

      if (is.null(self$value_extractor)){
        stop('self$value_extractor has not been defined yet. Please add to object.')
      }

      section_form_data <-
        get_section_form_data(self$section_id, form_data = form_data)

      unique_suffix <-
        get_unique_suffixes(section_form_data)

      values_list <-
        lapply(unique_suffix, function(suffix){

          section_group_form_data <-
            get_section_group_data(suffix, section_form_data)

          self$value_extractor(section_group_form_data)

        })

      if (self$section_id == 'basics'){
        values_list <-  values_list[[1]]
      }

      if (length(values_list) == 0){
        values_list <- NULL
      }

      values_list

    },
    #' @description
    #'  A slot for a function that extracts name values and returns a named list for
    #'  a specific JSON resume section. It is expected that this class will be extended
    #' and this method updated then.
    #'
    #' @param values list from JS that returns input values
    value_extractor = function(values){
      NULL
    }
  )
)

