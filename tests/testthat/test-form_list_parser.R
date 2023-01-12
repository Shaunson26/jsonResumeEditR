test_that("error with empty fields", {

  form_example <- list()

  expect_error(form_list_parser(form_example))

})

test_that("excludes empty fields", {

  form_example <-
    list(
      basics_name= "John",
      basics_job = '',
      basics_profiles_0_network= "February",
      basics_profiles_0_username= "June",
      basics_profiles_0_url= "August",
      basics_profiles_1_network= "aaa",
      basics_profiles_1_username= "bbb",
      basics_profiles_1_url= ""
    )

  form_example_parsed <- form_list_parser(form_example)

  form_example_expected <-
    list(
      basics = list(
        name = "John",
        profiles = list(
          `0` = list(network = "February",
               username = "June",
               url = "August"),
          `1` = list(network= "aaa",
               username= "bbb")
        )
      )
    )

  expect_identical(form_example_parsed, form_example_expected)

})

test_that("works on full list", {

  form_example <-
    list(
      basics_name= "John",
      basics_job = 'worker',
      basics_profiles_0_network= "February",
      basics_profiles_0_username= "June",
      basics_profiles_0_url= "August",
      basics_profiles_1_network= "aaa",
      basics_profiles_1_username= "bbb",
      basics_profiles_1_url= "ccc"
    )

  form_example_parsed <- form_list_parser(form_example)

  form_example_expected <-
    list(
      basics = list(
        name = "John",
        job = 'worker',
        profiles = list(
          `0` = list(network = "February",
               username = "June",
               url = "August"),
          `1` = list(network= "aaa",
               username= "bbb",
               url= "ccc")
        )
      )
    )

  expect_identical(form_example_parsed, form_example_expected)

})
