#' Función que devuelva todas las hojas y dentro de las hojas las columnas en listas anidadas
#'
#' @param ruta Ruta del archivo excel
#'
#' @returns Es un evector con las hojas del excel
#' @export
#'
#' @examples
#' hojas_excel(NULL)
#' @import readxl
#' @import dplyr
#' @import purrr
#' @import RSQLite
hojas_excel <- function(ruta){
  # test
  if(!is.null(ruta)){
    hojas <- readxl::excel_sheet(ruta)

    hojas %>%
      purrr::map(~read_excel(ruta,sheet = .x) %>% names())

  }
}
