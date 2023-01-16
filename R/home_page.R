#' Home page text
#'
#' `tagList()` containing home page text
home_page <- function(){
  tagList(
    h3('What is a JSON resume?'),
    p('A JSON resume is a JSON-based standardised data structure holding resume information
      such a personal information, work experience and education details. Once completed,
      there are various templates that can be used to mark-up this data into a
      beautiful resume, ready for publication and distribution.'),
    p('Information on the JSON resume initiative can be found at',
      a(href = 'https://jsonresume.org/', target="_blank", 'https://jsonresume.org/'))
    ,
    h3('How to use this app'),
    p('This app can be used to:',
      tags$ul(
        tags$li('start a new JSON resume'),
        tags$li('edit a previous resume'),
        tags$li('export a resume'),
        tags$li('todo - preview a resume in a template'),
        tags$li('todo - send a resume to a Github gist for hosting by jsonresume.org')
      )
    ),
    p('Use the navigation menu to complete relevant sections, import/export resumes,
                    (and to view template previews).'),
    h3('Issues and bugs'),
    p('Create an issue in the ',
      a(href = 'https://github.com/Shaunson26/jsonResumeEditR/issues', target="_blank", 'Github repo issues page'),
      'or clone the repo, fix the bug and create a pull request for review'),
    h3('About'),
    p('This app was created by me, Mario! No, Shaun Nielsen. It was a means to explore R Shiny and other web related things.',
      'Funnily enough, a goal now is to create this without the need of R Shiny and do everything within the browser.')
  )
}
