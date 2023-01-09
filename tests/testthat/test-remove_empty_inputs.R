test_that("remove_empty_inputs returns a full list when no empty values exists", {

  # full list returned
  out_list <-
    list(name = 'john',
         position = 'doe',
         highlights = strsplit('highlights', '\n')[[1]])

  removed_list <-
    remove_empty_inputs(out_list)

  expected_list <-
    out_list
  expect_identical(removed_list, expected_list)

})

test_that("remove_empty_inputs removes values", {

  # scalar values
  out_list <-
    list(name = 'john',
         position = '',
         highlights = strsplit('highlights', '\n')[[1]])

  removed_list <-
    remove_empty_inputs(out_list)

  expected_list <-
    list(name = 'john',
         highlights = strsplit('highlights', '\n')[[1]])

  expect_identical(removed_list, expected_list)

  # nested values, list hardcoded in function
  out_list <-
    list(name = 'john',
         position = '',
         highlights = strsplit('', '\n')[[1]],
         courses = strsplit('course', '\n')[[1]])


  removed_list <-
    remove_empty_inputs(out_list)

  expected_list <-
    list(name = 'john',
         courses = 'course')

  expect_identical(removed_list, expected_list)

  out_list <-
    list(name = 'john',
         position = '',
         highlights = strsplit('', '\n')[[1]],
         courses = strsplit('', '\n')[[1]])


  removed_list <-
    remove_empty_inputs(out_list)

  expected_list <-
    list(name = 'john')

  expect_identical(removed_list, expected_list)

})
