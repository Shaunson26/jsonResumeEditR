awards_extender <-
  list(
    input_group_ui = function(id_suffix, values = NULL, hide = FALSE) {

      group_name = self$section_id

      ns <- function(id){
        glue::glue("{group_name}-{id}-{id_suffix}")
      }

      input_group_div(group_name = group_name,
                      id_suffix = id_suffix,
                      style = ifelse(hide, 'display:none;', ''),
                      remove_group_button(),
                      text_input(id = ns('title'), label = 'Institution', value = purrr::pluck(values, 'title')),
                      date_input(id = ns('date'), label = 'Date', value = purrr::pluck(values, 'date')),
                      text_input(id = ns('awarder'), label = 'Awarder', value = purrr::pluck(values, 'awarder')),
                      textarea_input(id = ns('summary'), label = 'Summary', value = purrr::pluck(values, 'summary'))
      )

    },
    value_extractor = function(values){
      with(values,
           list(title = title,
                date = date,
                awarder = awarder,
                summary = summary
           )
      )
    }
  )
