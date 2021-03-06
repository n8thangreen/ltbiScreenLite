% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/activetb_qaly_cost.R
\name{activetb_qaly_cost}
\alias{activetb_qaly_cost}
\title{activetb_qaly_cost}
\usage{
activetb_qaly_cost(dectree_res, interv, cohort, folders = NA)
}
\arguments{
\item{dectree_res}{Output of \code{parallel_decision_tree()}. This contains the probability of being cured of LTBI via screening.}

\item{interv}{list of fixed model run parameter values}

\item{cohort}{dataframe of individual level data}

\item{folders}{list of strings locations for data and plots}
}
\value{
\itemize{
  \item QALY.statusquo: For each scenario a vector of total QALYs without screening programme, length number of sims. These are all the same because population QALYs are not varied for the cohort.
  \item QALY.screened: For each scenario a vector of total QALYs with screening programme, length number of sims.
  \item E_cost_screened: For each scenario single expected cost with screening programme.
  \item cost.screened_person: For each scenario a vector of QALYs per person with screening programme, length number of sims.
  \item cost.statusquo_person: For each scenario a vector of costs per person without screening programme, length number of sims.
  \item cost_incur: For each scenario a vector of incurred costs by screening programme, length number of sims.
  \item cost.statusquo: For each scenario a vector of total costs without screening programme, length number of sims. The are not identical because TB costs are randomly sampled.
  \item cost.screened: For each scenario a vector of total costs with screening programme, length number of sims.
  \item E_QALY_screened: For each scenario single expected QALYs with screening programme.
  \item QALY.screened_person: For each scenario a vector of QALYs per person with screening programme, length number of sims.
  \item QALY.statusquo_person: For each scenario a vector of QALYs per person without screening programme, length number of sims. These are all the same.
  \item QALYgain: For each scenario a vector of total QALYs gained with screening programme as the difference between screening and status-quo, length number of sims.
  \item cost_incur_person: For each scenario a vector of total costs incured per person with screening programme as the difference between screening and status-quo, length number of sims.
  \item E_cost_incur: For each scenario the expectedd total cost incured with screening programme as the difference between screening and status-quo.
  \item E_cost_incur_person: For each scenario the expected total cost incured per person with screening programme as the difference between screening and status-quo.
  \item QALYgain_person: For each scenario a vector of total QALY gained per person with screening programme as the difference between screening and status-quo.
  \item E_QALYgain: For each scenario the expected total QALY gained with screening programme as the difference between screening and status-quo.
  \item E_QALYgain_person: For each scenario the expected total QALy gained per person with screening programme as the difference between screening and status-quo.
}
}
\description{
For the Population model,
calculate various QALYs and costs accounting for active TB progression
in non-cured cohort subset.
}
\examples{

}
