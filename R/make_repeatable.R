#' Create a repeatable form section
#'
#'
#' @param link_to section id to link to e.g. basics_profiles, work
#' @param ... form inputs
make_repeatable <- function(link_to, ...){

  option_name = ifelse(link_to == 'basics_profiles', 'basics_profiles', link_to)
  options(repeatable_fields = c(options()$repeatable_fields, option_name))

  tags$div(id = paste0(link_to, '-collapse'), class="repeat collapse in",
           tags$div(class="rf-wrapper", style="padding: 8px;",
                    tags$div(
                      # id JS clicked to add sections
                      tags$span(id = paste0(link_to, "-add-btn"),
                                class="add btn btn-add", "Add"),
                      tags$hr(style="width: 90%; margin: 8px auto;")
                    ),
                    # id JS clicked to reset data-rf-row-count
                    tags$div(id = paste0(link_to, '-rf-container'),
                             class="rf-container",
                             tags$div(class="rf-row rf-template",
                                      #<!-- template -->
                                      tags$div(style="display: flex; gap: 8px;",
                                               #<!-- UI buttons -->
                                               tags$div(style="white-space: nowrap;",
                                                        tags$span(class="move btn btn-info", '\U2195'),
                                                        tags$span(class="move-up btn btn-info", '\U2191'),
                                                        tags$span(class="move-down btn btn-info", '\U2193')
                                               ),
                                               #<!-- Inputs -->
                                               ...
                                               ,
                                               #<!-- Remove button-->
                                               tags$div(
                                                 tags$span(class=c("remove btn btn-danger",
                                                                   # JS clicked for removal
                                                                   paste0(link_to, "-btn-remove")),
                                                           "\U2716"),
                                               )
                                      ), # flex end
                                      tags$hr(style="width: 90%; margin: 8px auto;")
                             )
                    )
           )
  )

}
