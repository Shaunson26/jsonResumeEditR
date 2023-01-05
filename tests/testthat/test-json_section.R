test_that("json_section initialize works", {

  expect_error(json_section$new())

  obj <-
    json_section$new('Basics')

  expect_equal(obj$section_id, 'basics')
  expect_equal(obj$section_name, 'Basics')
  expect_equal(obj$id_counter, 0)
  expect_null(obj$value_extractor())
  expect_null(obj$input_group_ui())

  section_container <- obj$add_section_container()
  expect_equal(section_container$attribs$id, 'basics-container')
  expect_equal(section_container$children[[1]]$children[[1]], 'Basics')
  expect_equal(obj$id_counter, 1)
})
