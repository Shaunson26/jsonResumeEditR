# "references": [{
#   "name": "Jane Doe",
#   "reference": "Reference…"
# }]
references_extender <-
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
                    textarea_input(id = ns('reference'), label = 'Reference', value = purrr::pluck(values, 'reference'))
    )
  },
  value_extractor = function(values){

    out_list <-
      with(values,
           list(name = name,
                reference = reference
           )
      )

    remove_empty_inputs(out_list)
  }
  )
