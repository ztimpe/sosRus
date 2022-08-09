#' Convert character vector for API call
#'
#' @param x a character vector (or list) of field names
#'
#' @return a character vector with brackets and slahses
#' @export
#'
#' @examples
#' bracketize(letters)
bracketize <- function(x){
  if(!is.list(x) & !is.character(x)){
    stop("This function can only handle character vectors and lists. You have provided something else.")
  }
  else if(is.list(x) & length(x)>= 1){
    x <- unlist(x[1])
  }
  else{
    x <- x
  }
  first <- paste('[\"',x[1],'\",',sep="")
  second <- paste('\"',x[2:(length(x)-1)],'\",',sep="")
  third <- paste('\"',x[length(x)],'\"]',sep="")
  stringr::str_c(first,stringr::str_c(second,collapse=""),third,collapse="")
}
