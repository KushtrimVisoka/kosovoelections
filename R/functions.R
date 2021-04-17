#' Get elections data for Kosovo
#'
#' @param type c("national", "local", "mayor", "mayor2")
#' @param year From 2010 and above
#' @param by c("party", "candidate")
#' @param level c("national", "municipality", "pc", "ps")
#'
#' @return
#' @export
#'
#' @examples
get_election_results <- function(type = c("national", "local", "mayor", "mayor2"),
                                 year = NULL,
                                 by = c("party", "candidate"),
                                 level = c("national", "municipality", "pc", "ps")){
  if (missing(type)){
    stop("'type = ' must have one of the following elements: 'national', 'local', 'mayor', 'mayor2'.")
  }
  if (missing(year)){
    stop("'year = ' must have one of the following elements: '2021', '2019', '2017', '2014'.")
  }
  if (missing(by)){
    stop("'by = ' must have one of the following elements: 'party', 'candidate'.")
  }
  if (missing(level)){
    stop("'level = ' must have one of the following elements: 'national', 'municipality', 'pc', 'ps'.")
  }
  linku <- stringr::str_glue("https://github.com/Kushtrimvisoka/datasets/blob/main/elections/{type}/{year}/{by}/{level}.RData?raw=true")
  rlang::inform(stringr::str_glue("Downloading data for {year} {type} assembly elections, by {by}, at {level} level..."))
  load(url(linku))
  return(data)
}
