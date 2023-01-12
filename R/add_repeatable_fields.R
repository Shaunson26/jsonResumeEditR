add_repeatable_fields <- function(element_counts){

  for(i in seq_along(element_counts)){
    for(j in 1:element_counts[i]){
      shinyjs::runjs(
        sprintf("$('#%s-add-btn').click()", names(element_counts[i]))
      )
    }
  }
}
