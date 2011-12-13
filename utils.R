escape_backslash <- function(...){
  strings <- unlist(list(...))
   gsub("\\\\", "\\\\\\\\\\", strings)  
}
