% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/VISUALIZE_compare_forecasts_performance.R
\name{compare_forecasts_performance}
\alias{compare_forecasts_performance}
\title{Create plot to compare forecast performance}
\usage{
compare_forecasts_performance(
  accuracy_overview,
  fc_models = c(),
  demo_mode = FALSE
)
}
\arguments{
\item{accuracy_overview}{A tibble containing an overview of the overall
forecast accuracy of each forecast model in the main_forecasting_table,
limited to data for a single group.}

\item{fc_models}{A character vector specifying which forecast models to
display.}

\item{demo_mode}{Boolean, which is to be set to TRUE if any potentially
sensitive figures should be hidden from the audience for demo purposes, or
set to FALSE if all figures can safely be displayed.}
}
\value{
A plotly object displaying performance per forecast model.
}
\description{
\code{compare_forecasts_performance} is a function to create a plot which
displays the forecast performance of one or more forecast models, based on a
selected performance summary variable. For demo purposes, sensitive figures
can be hidden from the audience.
}
\examples{
accuracy_overview <- tstools::initialize_ts_forecast_data(
      data = dummy_gasprice,
      date_col = "year_month",
      col_of_interest = "gasprice",
      group_cols = c("state", "oil_company")
   ) \%>\%
   create_main_forecasting_table() \%>\%
   head(10) \%>\%
   add_fc_models_to_main_forecasting_table(
      periods_ahead = 12,
      fc_methods = c("linear")
   ) \%>\%
   get_forecast_accuracy_overview()
compare_forecasts_performance(
   accuracy_overview = accuracy_overview,
   fc_models = c("fc_linear_trend", "fc_linear_trend_seasonal")
)
}
