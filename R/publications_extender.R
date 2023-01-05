publications_extender <-
  list(
    input_group_ui = function(id_suffix, values = NULL, hide = FALSE){

      group_name = self$section_id

      ns <- function(id){
        glue::glue("{group_name}-{id}-{id_suffix}")
      }

      input_group_div(group_name = group_name,
                      id_suffix = id_suffix,
                      style = ifelse(hide, 'display:none;', ''),
                      remove_group_button(),
                      text_input(id = ns('name'), label = 'Name', value = purrr::pluck(values, 'name')),
                      text_input(id = ns('publisher'), label = 'publisher', value = purrr::pluck(values, 'publisher')),
                      date_input(id = ns('releaseDate'), label = 'Release date', value = purrr::pluck(values, 'releaseDate')),
                      text_input(id = ns('url'), label = 'URL', value = purrr::pluck(values, 'url')),
                      textarea_input(id = ns('summary'), label = 'Summary', value = purrr::pluck(values, 'summary'))
      )
    },
    value_extractor = function(values){
      with(values,
           list(name = name,
                publisher = publisher,
                releaseDate = releaseDate,
                url = url,
                summary = summary
           )
      )
    }
  )
