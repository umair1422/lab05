#' Lab5: Quotes generator API
#' @import httr
#' @import jsonlite
#' @description This package generates quotes of different authors
#' @export

baseUrl <- "https://programming-quotes-api.herokuapp.com"

#' @description
#' This function generates random quote
#' @return the list containing id,author's name and quote
library(httr)
library(jsonlite)
fetchRandomQuote <- function() {

  endPoint <- '/quotes/random'
  randomQuote <- GET(url = paste0(baseUrl,endPoint))
  randomQuote <- content(randomQuote, as="raw")
  json <- fromJSON(rawToChar(randomQuote))
  df <- flatten(as.data.frame(json))
  return(df)

}

#fetchRandomQuote()

#' @description
#' This function generates all quotes
#' @return the list containing id,author's name and quotes

fetchAllQuotes <- function() {
  endPoint <- '/quotes'
  randomQuote <- GET(url = paste0(baseUrl,endPoint))
  randomQuote <- content(randomQuote, as="raw")
  json <- fromJSON(rawToChar(randomQuote))
  df <- flatten(as.data.frame(json))
  return(df)
}

#fetchAllQuotes()

#' @description
#' This function generates all quotes of specific author
#' @return the list containing id,author's name and quotes
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

fetchQuoteByAuther(author = 'Edsger%20W.%20Dijkstra')

