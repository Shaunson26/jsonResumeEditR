volunteer_extender <-
  list(input_group_ui = function(id_suffix, values = NULL, hide = FALSE) {

    group_name = 'volunteer'

    ns <- function(id){
      glue::glue("{group_name}-{id}-{id_suffix}")
    }

    input_group_div(group_name = group_name,
                    id_suffix = id_suffix,
                    style = ifelse(hide, 'display:none;', ''),
                    remove_group_button(),
                    text_input(id = ns('organization'), label = 'Organization', value = purrr::pluck(values, 'organization')),
                    text_input(id = ns('position'), label = 'Position', value = purrr::pluck(values, 'position')),
                    text_input(id = ns('url'), label = 'URL', value = purrr::pluck(values, 'url')),
                    date_input(id = ns('startDate'), label = 'Start date', purrr::pluck(values, 'startDate')),
                    date_input(id = ns('endDate'), label = 'End date', purrr::pluck(values, 'endDate')),
                    textarea_input(id = ns('summary'), label = 'Summary', value = purrr::pluck(values, 'summary')),
                    textarea_input(id = ns('highlights'), label = 'Highlights', value = purrr::pluck(values, 'highlights'))
    )

  },
  value_extractor = function(values){
    with(values,
         list(organization = organization,
              position = position,
              url = url,
              startDate = startDate,
              endDate = startDate,
              summary = summary,
              highlights = strsplit(highlights, '\n')[[1]]
         )
    )
})
