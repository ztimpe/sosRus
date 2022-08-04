#' Convert character vector for API call
#'
#' @param x a character vector of field names
#'
#' @return a character vector with brackets and slahses
#' @export
#'
#' @examples
#' bracketize(letters)
bracketize <- function(x){
  first <- paste('[\"',x[1],'\",',sep="")
  second <- paste('\"',x[2:(length(x)-1)],'\",',sep="")
  third <- paste('\"',x[length(x)],'\"]',sep="")
  stringr::str_c(first,stringr::str_c(second,collapse=""),third,collapse="")
}
