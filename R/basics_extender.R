#' Basics extender functions list
#'
#' List containing functions to extend `json_section`
basics_extender <-
  list(input_group_ui = function(id_suffix, values = NULL, hide = FALSE){

    section_prefix = self$section_id

    ns <- function(id){
      glue::glue("{section_prefix}-{id}-{id_suffix}")
    }

    div(class = c('jr-input-group', glue::glue('{section_prefix}-input-group')),
        id = glue::glue('{section_prefix}-input-group-{id_suffix}'),
        style = ifelse(hide, 'display:none;', ''),

        text_input(id = ns('name'), label = 'Name', value = purrr::pluck(values, 'name'), width = '300px'),
        text_input(id = ns('label'), label = 'Job label', value = purrr::pluck(values, 'label'), width = '300px'),
        text_input(id = ns('image'), label = 'Image', value = purrr::pluck(values, 'image'), width = '300px'),
        text_input(id = ns('email'), label = 'Email', value = purrr::pluck(values, 'email'), width = '300px'),
        text_input(id = ns('phone'), label = 'Phone', value = purrr::pluck(values, 'phone'), width = '200px'),
        text_input(id = ns('url'), label = 'URL', value = purrr::pluck(values, 'url')),
        textarea_input(id = ns('summary'), label = 'Summary', value = purrr::pluck(values, 'summary')),
        text_input(id = ns('address'), label = 'Address', value = purrr::pluck(values, 'location', 'address'), width = '300px'),
        text_input(id = ns('city'), label = 'City', value = purrr::pluck(values, 'location', 'city'), width = '200px'),
        text_input(id = ns('region'), label = 'Region', value = purrr::pluck(values, 'location', 'region'), width = '100px'),
        text_input(id = ns('postalCode'), label = 'Postal code', value = purrr::pluck(values, 'location', 'postalCode'), width = '100px'),
        text_input(id = ns('countryCode'), label = 'Country', value = purrr::pluck(values, 'location', 'countryCode'), width = '100px')
    )

  },
  value_extractor = function(values){
    with(values,{

         id_list <-
           list(name = name,
                label = label,
                image = image,
                email = email,
                phone = phone,
                url = url,
                summary = summary)

         location_list <-
           list(address = address,
                postalCode = postalCode,
                city = city,
                countryCode = countryCode,
                region = region)

         id_list <- remove_empty_inputs(id_list)
         location_list <- remove_empty_inputs(location_list)

         if (length(location_list) > 0){
           id_list$location <- location_list
         }

         id_list
    })
  }
  )
