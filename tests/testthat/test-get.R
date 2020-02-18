context("Check model getter")

if(curl::has_internet()){
  res <- httr::GET("http://colormind.io/list")
}

test_that("successful status is returned", {
  skip_if_not(curl::has_internet(), "No internet connection detected")
  expect_equal(httr::status_code(res), 200L)
})

test_that("a valid JSON is returned", {
  skip_if_not(curl::has_internet(), "No internet connection detected")
  res_content <- httr::content(res, as = "text")
  expect_true( jsonlite::validate(res_content) )
})

test_that("a character vector is returned", {
  skip_if_not(curl::has_internet(), "No internet connection detected")
  res_content <- httr::content(res, as = "text")
  lst_content <- jsonlite::fromJSON(res_content)

  expect_is(lst_content, "list" )
  expect_equal( names(lst_content), "result" )
  expect_is(lst_content$result, "character")
})
