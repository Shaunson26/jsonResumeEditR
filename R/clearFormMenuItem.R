clearFormMenuItem <- function(inputId, label){
  tags$li(
    actionLink('clear',
               label = tagList(
                 tags$i(class = "fa-solid fa-file-export"),
                 tags$span(label)
               ),
               style = "margin: 0;"
    )
  )
}
