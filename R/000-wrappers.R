# Generated by savvy: do not edit by hand
#
# Note:
#   This wrapper file is named as `000-wrappers.R` so that this file is loaded
#   first, which allows users to override the functions defined here (e.g., a
#   print() method for an enum).

#' @useDynLib savvyMemoryLeak, .registration = TRUE
#' @keywords internal
NULL

# Check class and extract the external pointer embedded in the environment
.savvy_extract_ptr <- function(e, class) {
  if(is.null(e)) {
    return(NULL)
  }

  if(inherits(e, class)) {
    e$.ptr
  } else {
    msg <- paste0("Expected ", class, ", got ", class(e)[1])
    stop(msg, call. = FALSE)
  }
}

# Prohibit modifying environments

#' @export
`$<-.savvy_savvyMemoryLeak__sealed` <- function(x, name, value) {
  class <- gsub("__bundle$", "", class(x)[1])
  stop(class, " cannot be modified", call. = FALSE)
}

#' @export
`[[<-.savvy_savvyMemoryLeak__sealed` <- function(x, i, value) {
  class <- gsub("__bundle$", "", class(x)[1])
  stop(class, " cannot be modified", call. = FALSE)
}

#' Multiply Input By Another Input
#'
#' @param x An integer vector.
#' @param y An integer to multiply.
#' @returns An integer vector with values multiplied by `y`.
#' @export
`int_times_int` <- function(`x`, `y`) {
  .Call(savvy_int_times_int__impl, `x`, `y`)
}

#' @export
`l2norm` <- function(`x`) {
  .Call(savvy_l2norm__impl, `x`)
}

#' Convert Input To Upper-Case
#'
#' @param x A character vector.
#' @returns A character vector with upper case version of the input.
#' @export
`to_upper` <- function(`x`) {
  .Call(savvy_to_upper__impl, `x`)
}

### wrapper functions for Person

`Person_name` <- function(self) {
  function() {
    .Call(savvy_Person_name__impl, `self`)
  }
}

`Person_set_name` <- function(self) {
  function(`name`) {
    invisible(.Call(savvy_Person_set_name__impl, `self`, `name`))
  }
}

`.savvy_wrap_Person` <- function(ptr) {
  e <- new.env(parent = emptyenv())
  e$.ptr <- ptr
  e$`name` <- `Person_name`(ptr)
  e$`set_name` <- `Person_set_name`(ptr)

  class(e) <- c("Person", "savvy_savvyMemoryLeak__sealed")
  e
}



`Person` <- new.env(parent = emptyenv())

### associated functions for Person

`Person`$`associated_function` <- function() {
  .Call(savvy_Person_associated_function__impl)
}

`Person`$`new` <- function() {
  .savvy_wrap_Person(.Call(savvy_Person_new__impl))
}


class(`Person`) <- c("Person__bundle", "savvy_savvyMemoryLeak__sealed")

#' @export
`print.Person__bundle` <- function(x, ...) {
  cat('Person\n')
}

