json_preview_modal <- function(json_list, downloadButton_id){
  shiny::showModal(
    shiny::modalDialog(
      htmltools::h3('JSON export preview'),
      htmltools::div(style = 'max-height: 300px; overflow-y:scroll;',
                     shiny::renderPrint(jsonlite::toJSON(json_list, pretty = TRUE, auto_unbox = TRUE))
      ),
      footer = htmltools::tagList(
        shiny::downloadButton(downloadButton_id, "Download"),
        shiny::modalButton("Go back")
      )
    )
  )
}
