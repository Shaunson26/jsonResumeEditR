test_that('repeatable_fields must be present', {

  options(repeatable_fields = NULL)

  json_input <-
    list(
      basics = list(
        name = "John",
        label = 'worker',
        image = 'image',
        email = 'email',
        phone = '0123456789',
        url = 'url',
        summary = 'summary',
        location = list(
          address = '123 Fake street',
          city = 'Springfield',
          region = 'CA',
          postalCode = '90210',
          countryCode = 'US'
        ),
        profiles = list(
          list(network = "Tubber",
               username = "Jojo",
               url = "tubber.com"),
          list(network= "aaa",
               username= "bbb",
               url= "ccc")
        )
      ),
      work = list(
        list(
          place = 'place 1',
          position = 'position 1'
        ),
        list(
          place = 'place 2',
          position = 'position 2'
        )
      )
    )

  expect_error(json_list_parser(json_input))

})

test_that("full list is parsed", {

  options(repeatable_fields = c('basics_profiles', 'work'))

  json_input <-
    list(
      basics = list(
        name = "John",
        label = 'worker',
        image = 'image',
        email = 'email',
        phone = '0123456789',
        url = 'url',
        summary = 'summary',
        location = list(
          address = '123 Fake street',
          city = 'Springfield',
          region = 'CA',
          postalCode = '90210',
          countryCode = 'US'
        ),
        profiles = list(
          list(network = "Tubber",
               username = "Jojo",
               url = "tubber.com"),
          list(network= "aaa",
               username= "bbb",
               url= "ccc")
        )
      ),
      work = list(
        list(
          place = 'place 1',
          position = 'position 1'
        ),
        list(
          place = 'place 2',
          position = 'position 2'
        )
      )
    )

  test_parse <- json_list_parser(json_input)

  expected_parse <-
    list(
      basics = list(
        name = "John",
        label = 'worker',
        image = 'image',
        email = 'email',
        phone = '0123456789',
        url = 'url',
        summary = 'summary',
        location = list(
          address = '123 Fake street',
          city = 'Springfield',
          region = 'CA',
          postalCode = '90210',
          countryCode = 'US'
        ),
        profiles = list(
          `0` = list(network = "Tubber",
                     username = "Jojo",
                     url = "tubber.com"),
          `1` = list(network= "aaa",
                     username= "bbb",
                     url= "ccc")
        )
      ),
      work = list(
        `0` = list(
          place = 'place 1',
          position = 'position 1'
        ),
        `1` = list(
          place = 'place 2',
          position = 'position 2'
        )
      )
    )

  attr(expected_parse, 'element_counts') <-
    c(basics_profiles = 2L, work = 2L)

  expect_identical(test_parse, expected_parse)

  options(repeatable_fields = NULL)

})
