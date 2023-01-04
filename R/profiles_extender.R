profiles_extender <-
  list(input_group_ui = function(id_suffix, values = NULL, hide = FALSE) {

    group_name = 'profiles'

    ns <- function(id){
      glue::glue("{group_name}-{id}-{id_suffix}")
    }

    input_group_div(
      group_name = group_name,
      id_suffix = id_suffix,
      style = ifelse(hide, 'display:none;', ''),
      remove_group_button(),
      text_input(id = ns('network'), label = 'Network', value = purrr::pluck(values, 'network')),
      text_input(id = ns('username'), label = 'Username', value = purrr::pluck(values, 'username')),
      text_input(id = ns('url'), label = 'URL', value = purrr::pluck(values, 'username'))
    )

  },
  value_extractor = function(values){
    with(values,
         list(network = network,
              username = username,
              url = url
         )
    )
  }
  )
