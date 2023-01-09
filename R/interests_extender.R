# "interests": [{
#   "name": "Wildlife",
#   "keywords": [
#     "Ferrets",
#     "Unicorns"
#   ]
# }],
interests_extender <-
  list(input_group_ui = function(id_suffix, values = NULL, hide = FALSE){

    group_name = self$section_id

    ns <- function(id){
      glue::glue("{group_name}-{id}-{id_suffix}")
    }

    input_group_div(group_name = group_name,
                    id_suffix = id_suffix,
                    style = ifelse(hide, 'display:none;', ''),
                    remove_group_button(),
                    text_input(id = ns('name'), label = 'Name', value = purrr::pluck(values, 'name')),
                    textarea_input(id = ns('keywords'), label = 'Keywords',
                                   value = paste(purrr::pluck(values, 'keywords'), collapse = "\n"))
    )
  },
  value_extractor = function(values){

    out_list <-
      with(values,
           list(name = name,
                keywords = strsplit(keywords, '\n')[[1]]
           )
      )

    remove_empty_inputs(out_list)
  }
  )
