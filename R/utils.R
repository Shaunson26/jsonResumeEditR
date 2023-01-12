#' Unlist a list and convert . to _
#'
#' List elements and HTML ID can be easily matched if we prepare well. Unlist
#' a list generates '.' in nested elements, and we want them to be '_' to match
#' HTML IDs were prepared eariler.
#'
#' @param list a list
unlist_and_rename <- function(list){
  list_unlisted <- unlist(list)
  names(list_unlisted) <- gsub('\\.', '_', names(list_unlisted))
  names(list_unlisted) <- sub('\\d+$', '', names(list_unlisted))
  list_unlisted
}

basics_empty <- function(){
  c(basics_name = '',
    basics_label = '',
    basics_image = '',
    basics_email = '',
    basics_phone = '',
    basics_url = '',
    basics_summary = '',
    basics_location_address = '',
    basics_location_city = '',
    basics_location_region = '',
    basics_location_postalCode = '',
    basics_location_countryCode = '')
}
