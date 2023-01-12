#' Parse data captured from the JSON inputs
#'
#' A named list is captured from the front end. This function parses the list given
#' the names e.g. basics_name, basics_profiles_0_username to correctly structure an
#' output list to parse into JSON. Where elements need to be unnamed in the final output,
#' they will be numbered here e.g. basics$profiles$`0`$username, and thus will need to be
#' unnamed downstream e.g `names(this$basics$profiles) <- NULL`
#'
#' @param form_list a named list
#'
#' @return a list
form_list_parser <- function(form_list){

  if (identical(form_list, list())) {
    stop('An empty list was provided. Please include a list with data.')
  }

  repeatable_fields <- getOption('repeatable_fields')

  form_list_names_split <- strsplit(names(form_list), '_')

  output_list <- list()

  for(i in seq_along(form_list_names_split)){

    n_elements <- length(form_list_names_split[[i]])

    if (form_list[[i]] == '') next

    for(j in n_elements:1){

      if (j == n_elements){

        dot_points <- c('highlights$|keywords$|courses$|roles$')
        needs_splitting <- grepl(dot_points, form_list_names_split[[i]][j])

        if (needs_splitting) {
          list_element <- strsplit(form_list[[i]], "\n")
        } else {
          list_element <- list(form_list[[i]])
        }

      } else {

        list_element <- list(list_element)
      }

      names(list_element) <- form_list_names_split[[i]][j]
    }

    output_list <- utils::modifyList(output_list, list_element)
  }

  # Clean list
  output_list[[".nonce"]] <- NULL

  for(x in repeatable_fields){
    if (x == 'basics_profiles'){
      names(output_list$basics$profiles) <- NULL
    } else {
      names(output_list[[x]]) <- NULL
    }
  }

  #
  protect_json_unbox(output_list)

}
