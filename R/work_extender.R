# "work": [{
#   "name": "Company",
#   "position": "President",
#   "url": "https://company.com",
#   "startDate": "2013-01-01",
#   "endDate": "2014-01-01",
#   "summary": "Description…",
#   "highlights": [
#     "Started the company"
#   ]

work_extender <-
  list(
    input_group_ui = function(id_suffix, values = NULL, hide = FALSE) {

      group_name = 'work'

      ns <- function(id){
        glue::glue("{group_name}-{id}-{id_suffix}")
      }

      input_group_div(group_name = group_name,
                      id_suffix = id_suffix,
                      style = ifelse(hide, 'display:none;', ''),
                      remove_group_button(),
                      text_input(id = ns('name'), label = 'Name', value = purrr::pluck(values, 'name')),
                      text_input(id = ns('position'), label = 'Position', value = purrr::pluck(values, 'position')),
                      text_input(id = ns('url'), label = 'URL', value = purrr::pluck(values, 'url')),
                      date_input(id = ns('startDate'), label = 'Start date', value = purrr::pluck(values, 'startDate')),
                      date_input(id = ns('endDate'), label = 'End date',  value = purrr::pluck(values, 'endDate')),
                      textarea_input(id = ns('summary'), label = 'Summary', value = purrr::pluck(values, 'summary')),
                      textarea_input(id = ns('highlights'), label = 'Highlights', value = purrr::pluck(values, 'name'),
                                     placeholder = 'Dot points (new line per point)')
      )

    }
    ,
    value_extractor = function(values){
      with(values,
           list(name = name,
                position = position,
                url = url,
                startDate = startDate,
                endDate = endDate,
                summary = summary,
                highlights = strsplit(highlights, '\n')[[1]]
           )
      )
    }
  )
