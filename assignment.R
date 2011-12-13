#' Align assignments
#' @keywords internal
align_assignment <- function(text_block){
  require(stringr)
  # SELECT LINES WITH <- AND THE POSITION OF <- IN THEM
  .lines  <- grepl("^\\s*[[:alnum:]]+.*<-", text_block)
  .pos    <- stringr::str_locate(text_block[.lines], "<-")[,'start']
  
  # COMPUTE PADDING WIDTH, CONSTRUCT PADDED <-, AND REPLACE
  .pad    <- max(.pos) - .pos + 2
  .padded <- vapply(.pad, str_pad, 'character', string = '<-')
   text_block[.lines] <- stringr::str_replace(text_block[.lines], "<-", .padded)
  
   return(text_block)
}

#' Replace assignment with <-
#' @keywords internal
replace_assignment <- function(text_block){
  out <- attr(parser::parser(text = text_block), 'data')
  out$text[out$token.desc == 'EQ_ASSIGN'] = "<-" 
  out <- tapply(out$text, out$line1, paste, collapse=' ')  
  return(out)
}


# TODO 
# 1. align assignments only within a block. a block may be defined as a
#    a group of statements inside a function separated by a blank line
#    An efficient way to do this is to write another function that splits
#    the source file into blocks, apply align_assignment to each block,
#    and assemble the pieces back together.
# 2. strwrap strips all extra white spaces. since align_assignment introduces
#    extra spaces, ideally wrapping should be done post alignment. but this
#    destroys all extra spaces. need to see how it can be applied in 
#    reverse order to achieve the desired goal.