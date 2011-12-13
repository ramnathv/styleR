#' Reindent lines from 4 spaces to 2

reindent_block <- function(text_block){
  require(stringr)
  leading_spaces <- nchar(gsub("^(\\s*)(.*)", "\\1", text_block))
  text_block     <- str_trim(text_block)
  text_block     <- str_c(str_dup(" ", leading_spaces %/% 2),   
    text_block)
}

#  Pseudocode
#  1. count leading spaces and remove them
#  2. pad each line with half the number of leading spaces
