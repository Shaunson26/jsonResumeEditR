% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/wrap_repeatable_fields.R
\name{wrap_repeatable_fields}
\alias{wrap_repeatable_fields}
\title{Run the repeatable fields JS function}
\usage{
wrap_repeatable_fields(
  wrapper = ".rf-wrapper",
  container = ".rf-container",
  row = ".rf-row",
  add = ".add",
  remove = ".remove",
  move = ".move",
  move_up = ".move-up",
  move_down = ".move-down",
  move_steps = ".move-steps",
  template = ".rf-template",
  is_sortable = TRUE,
  before_add = NULL,
  after_add = "self.after_add",
  before_remove = NULL,
  after_remove = NULL,
  sortable_options = NULL,
  row_count_placeholder = "{{row-count-placeholder}}"
)
}
\arguments{
\item{wrapper}{= ".rf-wrapper",}

\item{container}{= ".rf-container",}

\item{row}{= ".rf-row",}

\item{add}{= ".add",}

\item{remove}{= ".remove",}

\item{move}{= ".move",}

\item{move_up}{= ".move-up",}

\item{move_down}{= ".move-down",}

\item{move_steps}{= ".move-steps",}

\item{template}{= ".rf-template",}

\item{is_sortable}{= TRUE,}

\item{before_add}{= NULL,}

\item{after_add}{= 'self.after_add',}

\item{before_remove}{= NULL,}

\item{after_remove}{= NULL,}

\item{sortable_options}{= NULL,}

\item{row_count_placeholder}{= "{{row-count-placeholder}}"}
}
\description{
Enable repeatable fields over elements
}
