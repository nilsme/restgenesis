#' Test connection to Genesis API
#'
#' @return
#' @export
#'
#' @examples test_conn()
test_conn <- function() {
  require('httr')
  require('jsonlite')
  request <- 'https://www-genesis.destatis.de/genesisWS/rest/2020/helloworld/whoami'
  response <- GET(request)
  content(response)
}


#' Get table from Genesis API and store response as data frame
#'
#' @param username Genesis username
#' @param password Genesis password
#' @param name Number of the statistic
#' @param out_format Default to flat file csv for direct export to data frame
#' @param area 
#' @param lang 'de' or 'en'
#'
#' @return df
#' @export
#'
#' @examples
get_tablefile <- function(username,
                          password,
                          name='12411-0001',
                          out_format='ffcsv',
                          area='all',
                          lang='de') {
  require('httr')
  require('jsonlite')
  request <- paste0('https://www-genesis.destatis.de/genesisWS/rest/2020/data/',
                    'tablefile?',
                    'username=', username,
                    '&password=', password,
                    '&name=', name,
                    '&area=', area,
                    '&compress=false',
                    '&transpose=false',
                    '&startyear=',
                    '&endyear=',
                    '&timeslices=',
                    '&regionalvariable=',
                    '&regionalkey=',
                    '&classifyingvariable1=',
                    '&classifyingkey1=',
                    '&classifyingvariable2=',
                    '&classifyingkey2=',
                    '&classifyingvariable3=',
                    '&classifyingkey3=',
                    '&format=', out_format,
                    '&job=false',
                    '&stand=01.01.1970',
                    '&language=', lang)
  df <- read.csv2(request)
  return(df)
}
