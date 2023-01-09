certificates_extender <-
  list(input_group_ui = function(id_suffix, values = NULL, hide = FALSE) {

    group_name = self$section_id

    ns <- function(id){
      glue::glue("{group_name}-{id}-{id_suffix}")
    }

    input_group_div(group_name = group_name,
                    id_suffix = id_suffix,
                    style = ifelse(hide, 'display:none;', ''),
                    remove_group_button(),
                    text_input(id = ns('name'), label = 'Name', value = purrr::pluck(values, 'name')),
                    date_input(id = ns('date'), label = 'Date', value = purrr::pluck(values, 'date')),
                    text_input(id = ns('issuer'), label = 'Issuer', value = purrr::pluck(values, 'issuer')),
                    text_input(id = ns('url'), label = 'URL', value = purrr::pluck(values, 'url'))
    )

  },
  value_extractor = function(values){
    out_list <-
      with(values,
           list(name = name,
                date = date,
                issuer = issuer,
                url = url
           )
      )

    remove_empty_inputs(out_list)
  }
  )
