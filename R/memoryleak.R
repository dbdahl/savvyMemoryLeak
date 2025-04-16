#' @export
memoryleak <- function() {
  mem_used <- function() sum(gc()[, 2])
  print(mem_used())
  for (rep in seq_len(10)) {
    for (i in seq_len(100000)) {
      l2norm(c(1.0))
    }
    print(mem_used())
  }
}
