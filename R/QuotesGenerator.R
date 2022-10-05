#' Lab5: Quotes generator API
#' @import httr
#' @import jsonlite
#' @description This package generates quotes of different authors
#' @export

baseUrl <- "https://programming-quotes-api.herokuapp.com"

#' Random quotes function
#' @description
#' This function generates random quote
#' @return the list containing id,author's name and quote
#' @export
fetchRandomQuote <- function() {

  endPoint <- '/quotes/random'
  randomQuote <- GET(url = paste0(baseUrl,endPoint))
  randomQuote <- content(randomQuote, as="raw")
  json <- fromJSON(rawToChar(randomQuote))
  df <- flatten(as.data.frame(json))
  return(df)

}

#fetchRandomQuote()

#' All quotes function
#' @description
#' This function generates all quotes
#' @return the list containing id,author's name and quote
#' @export
fetchAllQuotes <- function() {
  endPoint <- '/quotes'
  randomQuote <- GET(url = paste0(baseUrl,endPoint))
  randomQuote <- content(randomQuote, as="raw")
  json <- fromJSON(rawToChar(randomQuote))
  df <- flatten(as.data.frame(json))
  return(df)
}

#fetchAllQuotes()

#' All quotes by author name function
#' @description
#' This function generates all quotes of an author
#' @param author name
#' @return the list containing id,author's name and quote
#' @export

fetchQuoteByAuther <- function(author) {
  if(is.character(author))
  {
  endPoint <- '/quotes/author/'
  randomQuote <- GET(url = paste0(baseUrl,endPoint, author))
  randomQuote <- content(randomQuote, as="raw")
  json <- fromJSON(rawToChar(randomQuote))
  df <- flatten(as.data.frame(json))
  return(df)
  }
  else
    {
      stop("Wrong input type")
    }
}

#fetchQuoteByAuther(author = 'Edsger%20W.%20Dijkstra')

