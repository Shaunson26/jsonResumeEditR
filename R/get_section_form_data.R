get_section_form_data <- function(id, form_data){
  section_inds <- grep(paste0('^', id), names(form_data))
  form_data[section_inds]
}
