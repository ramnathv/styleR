#' Mask comments
#' @keywords internal
mask_comments <- function(text_block, keep.space){
  COMMENT_MARKER <- "`"
  pat  <- ifelse(keep.space, "^([[:space:]]*#.*)", "^[[:space:]]*(#.*)")
  repl <- paste(COMMENT_MARKER, "\\1", COMMENT_MARKER, sep = "")
  gsub(pat, repl, text_block)
}

#' Mask inline comments 
#' @keywords internal
mask_inline <- function(text_block){
  INLINE_MARKER <- "%INLINE%"
  repl <- paste("\\1", INLINE_MARKER, "`\\2`")
  gsub("^(.*[[:alpha:]]+.*)(#.*)$", repl, text_block)
}

#' Mask blank lines
#' @keywords internal
mask_blank_lines <- function(text_block){
  BLANK_LINE_MARKER <- "`"
  repl <- paste(BLANK_LINE_MARKER, BLANK_LINE_MARKER)
  gsub("^\\s*$", repl, text_block)
}

#' UNMASK TILDES IN SOURCE
unmask_tildes <- function(text_block){
  INLINE_MARKER <- "%INLINE%"
  text_block <- gsub(INLINE_MARKER, "", text_block, fixed = TRUE)
  text_block <- gsub("`(#|\\s*)(.*)`$", "\\1\\2", text_block)
}

# #' UNMASK REMAINING TILDES 
# unmask_tildes <- function(text_block){
#   pat  <- "^(\\s*)`[#|\\s](.*)$"
#   repl <- "\\1\\2"
#   gsub(pat, repl, text_block)
# }

#' UNMASK BLANK LINES
# unmask_blank_line <- function(text_block){
#   blank_pat <- paste(BLANKLINE_MARKER, BLANKLINE_MARKER)
#   blank_lines <- grep(blank_pat, text_block)
#   text_block[blank_lines] <- ""
#   return(text_block)
# }

