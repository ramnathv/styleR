This is an attempt to add two additional features to the `formatR` package by Yihui. In that process, I also ended up refactoring the code, breaking it up
into several smaller modules. The two features added are:

1. re-indentation of code to 4 spaces
2. alignment of assignments (ala textmate style)

You can check it by comparing the output of

```
formatR::tidy.source("test_file.R") vs.
tidy_source("test_file.R")
```

