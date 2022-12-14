test_that("mod_basics collects and outputs user inputs", {

  testServer(mod_basics, args = list(do_what = 'retrieve'), {

    session$setInputs(name = 'name',
                      label = "label",
                      image = "image",
                      email = "email",
                      phone = "phone",
                      url = "url",
                      summary = "summary",
                      address = "address",
                      postalCode = "postalCode",
                      city = "city",
                      countryCode = "countryCode",
                      region = "region")

    expected_value <-
      list(name = 'name',
           label = "label",
           image = "image",
           email = "email",
           phone = "phone",
           url = "url",
           summary = "summary",
           location = list(
             address = "address",
             postalCode = "postalCode",
             city = "city",
             countryCode = "countryCode",
             region = "region"
           )
      )

    expect_identical(session$returned(), expected_value)

  })

})

test_that("mod_basics updates user inputs", {

  suppressWarnings(
    shinytest2::load_app_env()
  )

  shiny_app <-
    shinyApp(ui = fluidPage(tabsetPanel(tabPanel_basics(id = 'basics'))),
             server = function(input, output, session) {

               #import <- jsonlite::fromJSON('inst/extdata/json-resume-input-tester.json', simplifyDataFrame = FALSE)

               import <-
                 list(
                   basics = list(name = 'name',
                                 label = "label",
                                 image = "image",
                                 email = "email",
                                 phone = "phone",
                                 url = "url",
                                 summary = "summary",
                                 location = list(
                                   address = "address",
                                   postalCode = "postalCode",
                                   city = "city",
                                   countryCode = "countryCode",
                                   region = "region"
                                 )
                   )
                 )

               mod_basics(id = 'basics', do_what = 'import', import = import)

             })

  app <- shinytest2::AppDriver$new(shiny_app)
  app_input_values <- app$get_values()[['input']]
  basics_inputs_inds <-grep('basics', names(app_input_values))
  basics_inputs <- app_input_values[basics_inputs_inds]
  names(basics_inputs) <- sub('basics-', '', names(basics_inputs))

  expected_value <- list(
    name = 'name',
    label = "label",
    image = "image",
    email = "email",
    phone = "phone",
    url = "url",
    summary = "summary",
    address = "address",
    postalCode = "postalCode",
    city = "city",
    countryCode = "countryCode",
    region = "region")

  # Captured order is different to expected_value, need to order by name
  expect_identical(basics_inputs[names(expected_value)], expected_value)

  rm(app)

})

test_that("mod_basics clears user inputs", {

  suppressWarnings(
    shinytest2::load_app_env()
  )

  shiny_app <-
    shinyApp(ui = fluidPage(tabsetPanel(tabPanel_basics(id = 'basics'))),
             server = function(input, output, session) {

               #import <- jsonlite::fromJSON('inst/extdata/json-resume-input-tester.json', simplifyDataFrame = FALSE)

               import <-
                 list(
                   basics = list(name = 'name',
                                 label = "label",
                                 image = "image",
                                 email = "email",
                                 phone = "phone",
                                 url = "url",
                                 summary = "summary",
                                 location = list(
                                   address = "address",
                                   postalCode = "postalCode",
                                   city = "city",
                                   countryCode = "countryCode",
                                   region = "region"
                                 )
                   )
                 )

               mod_basics(id = 'basics', do_what = 'import', import = import)
               mod_basics(id = 'basics', do_what = 'clear', import = import)

             })

  app <- shinytest2::AppDriver$new(shiny_app)
  app_input_values <- app$get_values()[['input']]
  basics_inputs_inds <-grep('basics', names(app_input_values))
  basics_inputs <- app_input_values[basics_inputs_inds]
  names(basics_inputs) <- sub('basics-', '', names(basics_inputs))

  expected_value <- list(
    name = '',
    label = "",
    image = "",
    email = "",
    phone = "",
    url = "",
    summary = "",
    address = "",
    postalCode = "",
    city = "",
    countryCode = "",
    region = "")

  # Captured order is different to expected_value, need to order by name
  expect_identical(basics_inputs[names(expected_value)], expected_value)

})
