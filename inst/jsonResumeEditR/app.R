library(shiny)
library(htmltools)
library(shinydashboard)
library(magrittr)

options(repeatable_fields = NULL)

# Define UI for application that draws a histogram
ui <-
  dashboardPage(
    dashboardHeader(
      title = 'JSON resume editR'
    ),
    dashboardSidebar(
      sidebarMenu(
        menuItem("Home", tabName = "home", icon = icon("fas fa-house")),
        h3('Sections', class = 'h3-menu'),
        menuItem("Basics", tabName = "basics", icon = icon("fas fa-address-card")),
        menuItem('Work',tabName = 'Work', icon = icon("fas fa-briefcase")),
        menuItem('Volunteer', tabName ='Volunteer', icon = icon('fas fa-handshake-angle')),
        menuItem('Education', tabName ='Education', icon = icon('fas fa-graduation-cap')),
        menuItem('Awards', tabName ='Awards', icon = icon('fas fa-award')),
        menuItem('Certificates', tabName ='Certificates', icon = icon("fas fa-award")),
        menuItem('Publications', tabName ='Publications', icon = icon('fas fa-book')),
        menuItem('Skills', tabName ='Skills', icon = icon("fas fa-screwdriver-wrench")),
        menuItem('Languages', tabName ='Languages', icon = icon('fas fa-walkie-talkie')),
        menuItem('Interests', tabName ='Interests', icon = icon('fas fa-heart')),
        menuItem('References', tabName ='References', icon = icon('fas fa-passport')),
        menuItem('Projects', tabName ='Projects', icon = icon('fas fa-diagram-project')),
        h3('Input/Output', class = 'h3-menu'),
        exportFormMenuItem('getFormData', 'Export'),
        fileInputMenuItem('import', 'Import'),
        clearFormMenuItem('clear', 'Clear form'),
        hr(style = 'width: 75%; margin: 20px auto;'),
        menuItem('About', tabName = 'about', icon = icon("fas fa-circle-info"))
      )
    ),
    dashboardBody(
      use_jsonResumeEditR(),
      shinyjs::useShinyjs(),
      includeCSS(system.file(package = 'jsonResumeEditR', 'www/styles.css')),
      tabItems(
        tabItem(tabName = "home", p('A simple JSON resume editor using R Shiny.')),
        tabItem(tabName = 'basics',
                section_container(
                  h3('Basics'), basics_inputs(),
                  h4('Profiles'), make_repeatable('basics_profiles', profiles_inputs()))
        ),
        tabItem('Work',
                section_container(
                  h3('Work'), make_repeatable('work', work_inputs()))
        ),
        tabItem('Volunteer',
                section_container(
                  h3('Volunteer'), make_repeatable('volunteer', volunteer_inputs())))
        ,
        tabItem('Education',
                section_container(
                  h3('Education'), make_repeatable('education', education_inputs()))
        ),
        tabItem('Awards',
                section_container(
                  h3('Awards'), make_repeatable('awards', awards_inputs()))
        ),
        tabItem('Certificates',
                section_container(
                  h3('Certificates'), make_repeatable('certificates', certificates_inputs()))
        ),
        tabItem('Publications',
                section_container(
                  h3('Publications'), make_repeatable('publications', publications_inputs()))
        )  ,
        tabItem('Skills',
                section_container(
                  h3('Skills'), make_repeatable('skills', skills_inputs()))
        ),
        tabItem('Languages',
                section_container(
                  h3('Languages'), make_repeatable('languages', languages_inputs()))
        ),
        tabItem('Interests',
                section_container(
                  h3('Interests'), make_repeatable('interests', interests_inputs()))
        ),
        tabItem('References',
                section_container(
                  h3('References'), make_repeatable('references', references_inputs()))
        ),
        tabItem('Projects',
                section_container(
                  h3('Projects'), make_repeatable('projects', projects_inputs()))
        ),
        tabItem(tabName = "about", p('Why I did this?'))
      ),
      wrap_repeatable_fields()
    )
  )

# Define server logic required to draw a histogram
server <- function(input, output, session) {

  import <-
    reactive({
      file <- input$import
      req(file)
      jsonlite::fromJSON(file$datapath, simplifyDataFrame = FALSE)
    }) %>%
    bindEvent(input$import)

  observe({

    json_list_import <- json_list_parser(import())
    element_counts <- attr(json_list_import, 'element_counts')
    json_list_import_unlisted <- unlist_and_rename(json_list_import)
    clear_these <- getOption('repeatable_fields')
    clear_and_reset_repeatable_fields(clear_these)
    add_repeatable_fields(element_counts)
    update_input_values(json_list_import_unlisted)

  }) %>%
    bindEvent(import())

  observe({
    showModal(
      modalDialog('Are you sure?',
                  size = 's',
                  footer = tagList(
                    actionButton('clear_clear', 'Yes'),
                    modalButton("Dismiss")
                  ))
    )
  }) %>%
    bindEvent(input$clear)

  observe({
    clear_these <- getOption('repeatable_fields')
    clear_and_reset_repeatable_fields(clear_these)
    update_input_values(basics_empty())
    shinyjs::runjs("$('#import-fileInfo').fadeOut()")
    shinyjs::runjs("$('a[href=\"#shiny-tab-basics\"]').click()")
    removeModal()
  }) %>%
    bindEvent(input$clear_clear)

  form_data <-
    reactive({
      input$getFormData
    }) %>%
    bindEvent(input$getFormData)

  json_list <-
    reactive({
      form_list_parser(form_data())
    })

  output$json_download <-
    json_downloadHandler(json_list = json_list())

  observe({
    json_preview_modal(json_list = json_list(), downloadButton_id = 'json_download')
  }) %>%
    bindEvent(json_list())

}

# Run the application
shinyApp(ui = ui, server = server)
