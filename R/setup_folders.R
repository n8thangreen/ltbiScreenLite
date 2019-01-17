
#' Setup folders
#'
#' @param policy_name String
#' @param interv List of model run constants
#'
#' @return List of folder locations
#' @export
#'
#' @examples
#'
setup_folders <- function(policy_name,
                          interv) {

  root_wd <- here::here()
  on.exit(setwd(root_wd))
  folders <- list()

  folders$output$scenario <- paste("output", "data", policy_name, sep = "/")

  dir.create(folders$output$scenario, showWarnings = FALSE, recursive = TRUE)

  folders$output$parent <- paste("output", "data", sep = "/")

  folders$plots$scenario <- paste("output", "plots", policy_name, sep = "/")
  dir.create(folders$plots$scenario, showWarnings = FALSE, recursive = TRUE)

  folders$plots$parent <- paste("output", "plots", sep = "/")

  cp_in_data_to_out_dir(file_names = c("scenario_params_df.csv",
                                       "policies-inputs.csv"),
                        to_dir = folders$output$scenario)

  save(folders, file = here::here("output", "data", policy_name, "folders.RData"))

  return(folders)
}


#' Copy input data to output folder
#'
#' @param file_names vector of text strings
#' @param to_dir
#'
#' @return
#' @export
#'
cp_in_data_to_out_dir <- function(file_names,
                                  to_dir) {

  home_dir <- here::here()
  on.exit(setwd(home_dir))
  setwd(to_dir)

  for (i in seq_along(file_names)) {

    file.copy(from = paste(home_dir, "data", file_names[i], sep = "/"),
              to = paste("..", file_names[i], sep = "/"))
  }

  return()
}
