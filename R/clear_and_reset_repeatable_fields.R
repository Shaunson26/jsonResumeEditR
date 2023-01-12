clear_and_reset_repeatable_fields <- function(fields = c('basics_profiles', 'work')){

  for(x in fields){
    shinyjs::runjs(
      sprintf("$('.%s-btn-remove').not(':first').click()", x)
    )

    shinyjs::runjs(
      sprintf("$('#%s-rf-container').attr('data-rf-row-count', '0')", x)
    )
  }
}
