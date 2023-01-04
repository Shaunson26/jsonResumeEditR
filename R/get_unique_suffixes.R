get_unique_suffixes <- function(section_form_data){
  unique(sub('.*-', '', names(section_form_data)))
}
