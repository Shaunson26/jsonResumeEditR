education_extender <-
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
                      text_input(id = ns('institution'), label = 'Institution', value = purrr::pluck(values, 'institution')),
                      text_input(id = ns('url'), label = 'URL', value = purrr::pluck(values, 'url')),
                      text_input(id = ns('area'), label = 'Subject area', value = purrr::pluck(values, 'area')),
                      text_input(id = ns('studyType'), label = 'Study type', value = purrr::pluck(values, 'studyType')),
                      date_input(id = ns('startDate'), label = 'Start date', value = purrr::pluck(values, 'startDate')),
                      date_input(id = ns('endDate'), label = 'End date', value = purrr::pluck(values, 'endDate')),
                      text_input(id = ns('score'), label = 'Score', value = purrr::pluck(values, 'score')),
                      textarea_input(id = ns('courses'), label = 'Courses', value = purrr::pluck(values, 'courses'))
      )

    },
    value_extractor = function(values){

      out_list <-
        with(values,
             list(institution = institution,
                  url = url,
                  area = area,
                  studyType = studyType,
                  startDate = startDate,
                  endDate = startDate,
                  score = score,
                  courses = strsplit(courses, '\n')[[1]]
             )
        )

      remove_empty_inputs(out_list)
    }
  )
