get_section_group_data <- function(suffix, section_form_data){
  # location of group fields
  section_group_inds <- grep(paste0(suffix, '$'), names(section_form_data))
  # get data
  section_group_form_data <- section_form_data[section_group_inds]
  #print(section_group_form_data)
  # remove unique id parts
  names(section_group_form_data) <- sub('(.*)-(.*)-(.*)', '\\2', names(section_group_form_data))
  section_group_form_data
}
