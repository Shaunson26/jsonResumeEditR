# "languages": [{
#   "language": "English",
#   "fluency": "Native speaker"
# }]
languages_extender <-
  list(input_group_ui = function(id_suffix, values = NULL, hide = FALSE){

    group_name = self$section_id

    ns <- function(id){
      glue::glue("{group_name}-{id}-{id_suffix}")
    }

    input_group_div(group_name = group_name,
                    id_suffix = id_suffix,
                    style = ifelse(hide, 'display:none;', ''),
                    remove_group_button(),
                    text_input(id = ns('language'), label = 'Language', value = purrr::pluck(values, 'language')),
                    text_input(id = ns('fluency'), label = 'Fluency', value = purrr::pluck(values, 'fluency'))
    )
  },
  value_extractor = function(values){

    out_list <-
      with(values,
           list(language = language,
                fluency = fluency
           )
      )

    remove_empty_inputs(out_list)
  }
  )
