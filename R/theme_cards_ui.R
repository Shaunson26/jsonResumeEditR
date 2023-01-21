#' Create cards show markup template
#'
#' Create card to show previews of templates inlcuded in the package. There is
#' an onclick function that the Shiny server will use to wrangle the template and
#' display in an iframe
theme_cards_ui <- function() {

  themes <-
    list.files(system.file(package = 'jsonResumeEditR', 'themes'),
               full.names = TRUE)

  theme_cards <-

    lapply(themes, function(file_path) {

      author_info <-
        jsonlite::fromJSON(file.path(file_path, 'author.txt'))

      file.copy(
        file.path(file_path, 'thumbnail.jpeg'),
        sprintf('www/%s.jpg', author_info$theme_name)
      )

      div(class = 'col-md-3 col-sm-4', style = 'margin-bottom: 16px;',
             div(class = 'section-container',
                 fluidRow(style='text-align: center;',
                   div(class = 'col-md-12 col-sm-12 col-xs-4', style = 'margin-bottom: 8px; min-width: 150px;overflow:hidden;',
                     img(src = sprintf('%s.jpg', author_info$theme_name), style = "height:130px; object-fit: contain;")
                   ),
                   div(class = 'col-md-12 col-sm-12 col-xs-6', style = 'line-height: 0.7;',
                       p(author_info$theme_name, style = 'font-weight: bold;'),
                       p('by ', a(href = author_info$url, author_info$name)),
                       a('Preview theme', id = basename(file_path), class = 'btn btn-add', onclick = 'returnThemeName(this)')
                   )
                 )
             )
      )
    })

  shiny::tagList(theme_cards[c(1,2,1,2,1)])

}
