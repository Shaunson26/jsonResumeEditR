test_that("mod_template collects and outputs user inputs", {

  testServer(mod_template, args = list(do_what = 'retrieve'), {

    session$setInputs(fieldId = 'abc')

    expected_value <-
      list(fieldId = 'abc')

    expect_identical(session$returned(), expected_value)

  })

})

test_that("mod_template imports data", {

  suppressWarnings(
    shinytest2::load_app_env()
  )

  import <- list(fieldId = 'a value')

  shiny_app <-
    shinyApp(ui = tabPanel_template(id = 'test'),
             server = function(input, output, session) {
               mod_template(id = 'test', do_what = 'import', import = import)
             })

  #devtools::install()
  #devtools::uninstall()

  ns_id = 'test'
  ns_id = paste0('^', ns_id, '-')

  app <- shinytest2::AppDriver$new(shiny_app)

  app_input_values <- app$get_values()[['input']]
  id_inputs_inds <-grep(ns_id, names(app_input_values))
  id_inputs <- app_input_values[id_inputs_inds]
  names(id_inputs) <- sub(ns_id, '', names(id_inputs))

  expected_value <- import

  # Captured order is different to expected_value, need to order by name
  expect_identical(id_inputs[names(expected_value)], expected_value)

  rm(app)

})

test_that("mod_template clears user inputs", {

  suppressWarnings(
    shinytest2::load_app_env()
  )

  import <- list(fieldId = 'a value')

  shiny_app <-
    shinyApp(ui = tabPanel_template(id = 'test'),
             server = function(input, output, session) {
               mod_template(id = 'test', do_what = 'import', import = import)
               mod_template('test', do_what = 'clear')
             })

  ns_id = 'test'
  ns_id = paste0('^', ns_id, '-')

  app <- shinytest2::AppDriver$new(shiny_app)

  app_input_values <- app$get_values()[['input']]
  id_inputs_inds <-grep(ns_id, names(app_input_values))
  id_inputs <- app_input_values[id_inputs_inds]
  names(id_inputs) <- sub(ns_id, '', names(id_inputs))

  expected_value <- list(fieldId = '')

  # Captured order is different to expected_value, need to order by name
  expect_identical(id_inputs[names(expected_value)], expected_value)

  rm(app)

})

test_that("mod_demo works", {

  suppressWarnings(
    shinytest2::load_app_env()
  )

  import <- list(fieldId = 'a value')

  shiny_app <- demo_template()

  ns_id = 'test'
  ns_id = paste0('^', ns_id, '-')

  app <- shinytest2::AppDriver$new(shiny_app)

  # initial value is ''
  app_input_values <- app$get_values()[['input']]
  expect_equal(app_input_values[['test-fieldId']], '')

  # import value
  app$click('import')
  app_input_values <- app$get_values()[['input']]
  expect_equal(app_input_values[['test-fieldId']], 'a value')

  # set a value
  app$set_inputs(`test-fieldId` = "cars")
  app_input_values <- app$get_values()[['input']]
  app$click('retrieve')
  app_output_values <- app$get_values()[['output']]
  expect_equal(app_output_values[['result']], 'cars')



})
