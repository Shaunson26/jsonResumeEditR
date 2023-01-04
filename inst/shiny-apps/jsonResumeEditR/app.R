library(shiny)
library(magrittr)
library(R6)

# create section objects
sections <-
  list(
    basics = create_section_object('Basics', basics_extender),
    profiles = create_section_object('Profiles', profiles_extender),
    work = create_section_object('Work', work_extender),
    volunteer = create_section_object('Volunteer', volunteer_extender),
    education = create_section_object('Education', education_extender),
    awards = create_section_object('Awards', awards_extender),
    certificates = create_section_object('Certificates', certificates_extender),
    publications = create_section_object('Publications', publications_extender),
    skills = create_section_object('Skills', skills_extender),
    languages = create_section_object('Languages', languages_extender),
    interests = create_section_object('Interests', interests_extender),
    references = create_section_object('References', references_extender),
    projects = create_section_object('Projects', projects_extender)
  )

# Define UI for application that draws a histogram
ui <-
  fluidPage(
    use_jsonResumeEditR(),
    shinyjs::useShinyjs(),
    includeCSS('assets/css/fonts.css'),
    includeCSS('assets/css/styles.css'),
    title = 'JSON resume editR',

    h1('JSON resume editR'),

    fluidRow(
      column(12,
             div(class='section-container',
                 id='top-container',
                 p('A simple JSON resume editor using R Shiny.'),
                 fileInput('import', 'Import JSON', width = '100%'),
                 actionButton('export', 'Export JSON', onclick='getFormData()', style = 'font-weight:bold;')
             )
      )
    ),

    # add: <div id="name-container" + input_group_ui <div class= 'jr-input-group' ...
    lapply(sections, function(e){
      fluidRow(
        column(12,
               e$add_section_container()
        )
      )
    })
  )

# Define server logic required to draw a histogram
server <- function(input, output, session) {

  # add observers for adding new fields to sections ---
  lapply(sections, function(e){
    # add: <div class="name-input-group", id ="name-input-group-n" ...
    e$observe_add_section(input)
  })

  # Import JSON logic ----
  import <- reactive({
    file <- input$import
    req(file)
    jsonlite::fromJSON(file$datapath, simplifyDataFrame = FALSE)
  })

  observe({

    # hide/show the sections gracefully
    shinyjs::runjs("$('.jr-input-group').hide(500)")
    Sys.sleep(0.6)

    lapply(sections, function(e){
      e$import_values(import())
    })

    # run after reactive updating, otherwise it does not work
    session$onFlushed( function(){
      shinyjs::runjs("$('.jr-input-group').show(500)")
    })

  }) %>%
    bindEvent(import())

  # Submit ----
  json_list <-
    reactive({
      form_data <- input$getFormData
      build_json_list(form_data, sections)
    }) %>%
    bindEvent(input$getFormData)

  output$json_download <-
    json_downloadHandler(json_list = json_list())

  observe({
    json_preview_modal(json_list = json_list(), downloadButton_id = 'json_download')
  }) %>%
    bindEvent(json_list())

}

# Run the application
shinyApp(ui = ui, server = server)
