% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/kantorovich_CVX.R
\name{kantorovich_CVX}
\alias{kantorovich_CVX}
\title{Computes Kantorovich distance with CVX}
\usage{
kantorovich_CVX(
  mu,
  nu,
  dist,
  solution = FALSE,
  stop_if_fail = TRUE,
  solver = "ECOS",
  ...
)
}
\arguments{
\item{mu}{(row margins) probability measure in numeric mode}

\item{nu}{(column margins) probability measure in numeric mode}

\item{dist}{matrix defining the distance to be minimized on average}

\item{solution}{logical; if \code{TRUE} the solution is returned in the
\code{"solution"} attributes of the output}

\item{stop_if_fail}{logical; if \code{TRUE}, an error is returned in the
case when no solution is found; if \code{FALSE}, the output of
\code{\link[CVXR]{psolve}} is returned with a warning}

\item{solver}{the \code{CVX} solver, passed to \code{\link[CVXR]{psolve}}}

\item{...}{other arguments passed to \code{\link[CVXR]{psolve}}}
}
\description{
Kantorovich distance using the \code{CVXR} package
}
\examples{
x <- c(1.5, 2, -3)
mu <- c(1/7, 2/7, 4/7)
y <- c(4, 3.5, 0, -2)
nu <- c(1/4, 1/4, 1/4, 1/4)
M <- outer(x, y, FUN = function(x, y) abs(x - y))
kantorovich_CVX(mu, nu, dist = M)

}
