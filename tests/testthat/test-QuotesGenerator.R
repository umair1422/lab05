allquetos <- fetchAllQuotes()
random<-fetchRandomQuote()
testthat::test_that("Wrong input", {
  expect_error(fetchQuoteByAuther(123))
  expect_error(fetchQuoteByAuther(abc))
  expect_error(fetchQuoteByAuther(TRUE))
  expect_error(fetchQuoteByAuther(TRUE))
  expect_error(fetchAllQuotes(TRUE))
  expect_error(fetchAllQuotes(123))
  expect_error(fetchAllQuotes("elon musk"))
  expect_error(fetchAllQuotes('Edsger%20W.%20Dijkstra'))
  expect_error(fetchRandomQuote(TRUE))
  expect_error(fetchRandomQuote(123))
  expect_error(fetchRandomQuote("elon musk"))
  expect_error(fetchRandomQuote('Edsger%20W.%20Dijkstra'))

})

testthat::test_that("Correct", {
  expect_success(expect_type(fetchQuoteByAuther('Edsger%20W.%20Dijkstra'),'list'))
  expect_type(allquetos, 'list')
  expect_type(random,'list')
  expect_true(length(random)==3)
})
