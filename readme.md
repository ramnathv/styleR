This is an attempt to add two additional features to the `formatR` package by Yihui. In that process, I also ended up refactoring the code, breaking it up
into several smaller modules. The two features added are:

1. re-indentation of code to 2 spaces
2. alignment of assignments (ala textmate style)

You can test these functions by sourcing all the files and running



```r
tidy_source("tests/test_file.R")
tidy_source("tests/test_align.R")
tidy-source("tests/test_indent.R")
```

There are still several rough edges. For instance, aligning assignments, aligns all the assignment statements in the source file, while it might be usually preferable to do it block by block. There are several other such changes which need to be made before I can submit a pull request for `formatR`.

## Quick R ##


```r
getwd()             # get current working directory
ls()                # get list of objects in workspace
setwd(mydir)        # change current directory to mydir
q()		    # quit R
```


## 2-Sample t-Tests ##

A `two sample t-test` can be interpreted as comparing the means across two groups, or exploring the relationship between a quantitative response variable and a categorical explanatory variable with two levels. For instance, comparing the mean IQs of students at McGill and Concordia is equivalent to exploring the relationship between the numerical variable IQ and the categorical variable School.

Accordingly, `R` allows you to do a 2-sample t-test in multiple ways, which are summarized below.

```r
t.test(y ~ x)                   # where y is numeric and x is (binary) categorical
t.test(y1, y2)                  # where y1 and y2 are numeric
t.test(y1, y2, var.equal = T)   # pooled t-test
t.test(y1, y2, paired = TRUE)   # matched pair t-test
t.test(y1, y2, alt = 'less')    # left tailed, 2-sample t-test, unpooled
t.test(y1, y2, alt = 'greater') # right tailed, 2-sample t-test, unpooled
```

  
Here is a code chunk in Ruby

```ruby
def foo
  bar
end
```

A HTML chunk

```html	
<body>
  <div id="sidebar"> ... </div>
    <div id="main">
      {{content}}
    </div>
</body>
```
