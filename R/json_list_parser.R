#' Parse a JSON resume list
#'
#' Adds numbers to unnamed repeatable elements that when unlisted will match
#' input ids on the front end. Assume repeatable fields have been entered into
#' options() (the UI components do this) ..
#'
#' @param list JSON resume parsed list
json_list_parser <- function(list){

  repeatable_fields <- getOption('repeatable_fields')

  if (length(repeatable_fields) < 1){
    stop('repeatable_fields should exist in options(), and none found.')
  }

  repeatable_fields <- sub('basics_', '', repeatable_fields)
  element_counts <- c()

  for(x in repeatable_fields){

    if (x == 'profiles'){

      n_x <- length(list$basics[[x]])
      names(n_x) <- 'basics_profiles'

    } else {

      n_x <- length(list[[x]])
      names(n_x) <- x

    }

    if (n_x > 0){

      if (x == 'profiles'){

        names(list$basics[[x]]) <- (1:n_x) - 1
        element_counts <- c(element_counts, n_x)

      } else {

        names(list[[x]]) <- (1:n_x) - 1
        element_counts <- c(element_counts, n_x)
      }
    }

    rm(n_x)
  }

  attr(list, 'element_counts') <- element_counts

  list
}
