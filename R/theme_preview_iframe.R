#' Create an iframe for previewing (built) templates
#'
#' @return tagList
theme_preview_iframe <- function(){
  column(12,
         div(class='section-container', style = 'display: none; width:100%;max-width: 1600px;',
             tags$script("function resizeIframe(obj) {obj.style.height = obj.contentWindow.document.documentElement.scrollHeight + 'px';}"),
             tags$iframe(id = 'template-preview', style = 'width: 100%;height: 500px;', frameborder="0", scrolling="no", onload="resizeIframe(this)")

         )
  )
}
