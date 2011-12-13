    # a single line of comments is preserved
1+1
  
if(TRUE){
x=1  # inline comments
}else{
x=2;print('Oh no... ask the right bracket to go away!')}
1*3 # one space before this comment will become two!
2+2+2    # 'short comments'
   
lm(y~x1+x2, data=data.frame(y=rnorm(100),x1=rnorm(100),x2=rnorm(100)))  ### only 'single quotes' are allowed in comments
1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1  ## comments after a long line
		## tabs/spaces before comments: use keep.space=TRUE to keep them
'a character string with 	 in it'
# note tabs will be converted to spaces when keep.space = TRUE
## here is a long long long long long long long long long long long long long long long long long long long long comment
