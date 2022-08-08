#' Build an API URL
#'
#' @param fields Column names of data to be pulled from API connection.
#' @param table_name Name of table to draw from API.
#' @param key String providing log-in access to API.
#' @param base_url Home page of API.
#' @param page Default of 0, number of total pages in table is number records/100.
#'
#' @return A character vector
#' @export
#'
#' @examples
#' apify("fields","table_name","key","base_url")
apify <- function(fields,
                  table_name,
                  key,
                  base_url="https://api.civicore.com/newsos/api/v3/data/",
                  page=0){
    if(page == 0){
      glue::glue("{ base_url }{ table_name }?key={ key }&fields={ fields }&page=0")
    }
    else{
      glue::glue("{ url_root }{ table_name }?key={ key }&fields={ fields }&page={ page }")
    }
}
