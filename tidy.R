#' Tidy source code
#' @export
tidy_source = function(source = "clipboard", output = TRUE, text = NULL,
  keep.comment    = getOption('keep.comment'   , TRUE), 
  keep.blank.line = getOption('keep.blank.line', TRUE), 
  keep.space      = getOption('keep.space'     , FALSE), 
  replace.assign  = getOption('replace.assign' , TRUE),
  align.assign    = getOption('align.assign'   , TRUE),
  reindent.lines  = getOption('reindent.lines' , TRUE),
  width.cutoff    = 0.75 * getOption("width"), ...) {
  
  # READ, PROCESS AND TIDY SOURCE FILE ----------------------------------
  text_block <- readLines(source, warn = FALSE)
  text_block <- escape_backslash(text_block)

  if (keep.comment) {
    text_block <- mask_comments(text_block, keep.space)
    text_block <- mask_inline(text_block)
  }
  
  if (keep.blank.line) {
    text_block <- mask_blank_lines(text_block)
  }
  
  if (replace.assign){
    text_block <- replace_assignment(text_block)
  }
    
  text_block <- tidy_block(text_block)
  text_block <- unmask_tildes(text_block)
  
  if (align.assign){
    text_block <- align_assignment(text_block)
  }
  
  if (reindent.lines) {
    text_block <- reindent_block(text_block)
  }
  
  return(writeLines(text_block))
}

#' Tidy a block of source code by parsing
tidy_block <- function(text_block){
  exprs <- base::parse(text = text_block) 
  lines <- lapply(exprs, base::deparse)
  return(unlist(lines))
}

