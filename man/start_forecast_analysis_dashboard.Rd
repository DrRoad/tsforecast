% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/WRAPPER_start_forecast_analysis_dashboard.R
\name{start_forecast_analysis_dashboard}
\alias{start_forecast_analysis_dashboard}
\title{Start a local forecast analysis dashboard}
\usage{
start_forecast_analysis_dashboard(main_forecasting_table, test_mode = F)
}
\arguments{
\item{main_forecasting_table}{A tibble containing several columns of data
required for time series forecasting, which has been created using the
\code{create_main_forecasting_table} function and which has been extended
with the fc_models and fc_errors columns using the
\code{add_fc_models_to_main_forecasting_table} function.}

\item{test_mode}{Boolean, which is only set to TRUE when testing this
function within the testthat framework for building the tsforecast
package.}
}
\value{
Starts a local Shiny dashboard to analyse the forecasts.
}
\description{
\code{start_forecast_analysis_dashboard} is a wrapper function around several
visualization functions to start a local Shiny dashboard to analyse the
forecast data available in the main_forecasting_table.
}
\examples{
tstools::initialize_ts_forecast_data(
      data = dummy_gasprice,
      date_col = "year_month",
      col_of_interest = "gasprice",
      group_cols = c("state", "oil_company")
   ) \%>\%
   create_main_forecasting_table(
      min_train_periods = 180
   ) \%>\%
   add_fc_models_to_main_forecasting_table(
      periods_ahead = 12,
      fc_methods = c("basic", "linear")
   ) \%>\%
   start_forecast_analysis_dashboard()
}
