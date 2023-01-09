# "projects": [{
#   "name": "Project",
#   "description": "Description…",
#   "highlights": [
#     "Won award at AIHacks 2016"
#   ],
#   "keywords": [
#     "HTML"
#   ],
#   "startDate": "2019-01-01",
#   "endDate": "2021-01-01",
#   "url": "https://project.com/",
#   "roles": [
#     "Team Lead"
#   ],
#   "entity": "Entity",
#   "type": "application"
# }]
projects_extender <-
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
                    textarea_input(id = ns('description'), label = 'Description', value = purrr::pluck(values, 'description')),
                    textarea_input(id = ns('highlights'), label = 'Highlights',
                                   value = paste(purrr::pluck(values, 'highlights'), collapse = "\n")),
                    textarea_input(id = ns('keywords'), label = 'Keywords',
                                   value = paste(purrr::pluck(values, 'keywords'), collapse = "\n")),
                    date_input(id = ns('startDate'), label = 'Start date', value = purrr::pluck(values, 'startDate')),
                    date_input(id = ns('endDate'), label = 'End date', value = purrr::pluck(values, 'endDate')),
                    text_input(id = ns('url'), label = 'URL', value = purrr::pluck(values, 'url')),
                    textarea_input(id = ns('roles'), label = 'Roles',
                                   value = paste(purrr::pluck(values, 'roles'), collapse = "\n")),
                    text_input(id = ns('entity'), label = 'Entity', value = purrr::pluck(values, 'entity')),
                    text_input(id = ns('type'), label = 'Type', value = purrr::pluck(values, 'type'))
    )
  },
  value_extractor = function(values){

    out_list <-
      with(values,
           list(name = name,
                description = description,
                highlights = strsplit(highlights, split = '\n')[[1]],
                keywords = strsplit(keywords, split = '\n')[[1]],
                startDate = startDate,
                endDate = endDate,
                url = url,
                roles = strsplit(roles, split = '\n')[[1]],
                entity = entity,
                type = type
           )
      )

    remove_empty_inputs(out_list)
  }
  )
