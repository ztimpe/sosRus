#' Get number of API pages
#'
#' @param x a number
#'
#' @return number
#' @export
#'
#' @examples
#' num_pages(100)
num_pages <- function(x){
  ceiling(x/100)
}
