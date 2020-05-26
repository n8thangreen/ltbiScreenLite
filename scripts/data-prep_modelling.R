
#' ---
#' title: "LTBI screening model:
#'         pre-process imputed dataset;
#'         from Aldridge (2016) Lancet
#'
#' author: "N Green"
#' date: "`r format(Sys.Date())`"
#' output:
#'   html_document:
#'     keep_md: TRUE
#' ---


library(ETSeda)


IMPUTED_sample <- ETSeda::clean_ETS(IMPUTED_IOM_ETS_WHO_merged_15_2_9)
