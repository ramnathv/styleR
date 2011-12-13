This is an attempt to add two additional features to the `formatR` package by Yihui. In that process, I also ended up refactoring the code, breaking it up
into several smaller modules. The two features added are:

1. re-indentation of code to 2 spaces
2. alignment of assignments (ala textmate style)

You can test these functions by sourcing all the files and running



```
tidy_source("tests/test_file.R")
tidy_source("tests/test_align.R")
tidy-source("tests/test_indent.R")
```

There are still several rough edges. For instance, aligning assignments, aligns all the assignment statements in the source file, while it might be usually preferable to do it block by block. There are several other such changes which need to be made before I can submit a pull request for `formatR`.

