exportFormMenuItem <- function(inputId, label){
  tags$li(
    tags$a(
      style = 'cursor: pointer;',
      onclick = sprintf('%s();', inputId),
      tags$i(class = "fa-solid fa-file-export"), tags$span(label)
    )
  )
}
