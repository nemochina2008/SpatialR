# Introduction to R
Adam M. Wilson  
February 17, 2015  
    




----

This script is available:

  * [SpatialAnalysisTutorials repository](http://github.com/adammwilson/SpatialAnalysisTutorials/blob/master/R_Introduction)
  * Plain text (.R) with commented text 
  [here](https://raw.githubusercontent.com/adammwilson/SpatialAnalysisTutorials/master/R_Introduction/R_Introduction.R)
 

## Variables


```r
x=1
x
```

```
## [1] 1
```

We can also assign a vector to a variable:


```r
x=c(5,8,14,91,3,36,14,30)
x
```

```
## [1]  5  8 14 91  3 36 14 30
```
----

And do simple arithmetic:

```r
x+2
```

```
## [1]  7 10 16 93  5 38 16 32
```

Note that `R` is case sensitive, if you ask for `X` instead of `x`, you will get an error

```r
X
```

`Error: object 'X' not found`

----

### Variable naming conventions
Naming your variables is your business, but there are [5 conventions](http://www.r-bloggers.com/consistent-naming-conventions-in-r/) to be aware of:

* alllowercase: _e.g._ `adjustcolor`
* period.separated: _e.g._ `plot.new`
* underscore_separated: _e.g._ `numeric_version`
* lowerCamelCase: _e.g._ `addTaskCallback`
* UpperCamelCase: _e.g._ `SignatureMethod`

----

### Subsetting
Subset the vector using `x[ ]` notation

```r
x[5]
```

```
## [1] 3
```
You can use a `:` to quickly generate a sequence:

```r
1:5
```

```
## [1] 1 2 3 4 5
```
and use that to subset as well:

```r
x[1:5]
```

```
## [1]  5  8 14 91  3
```

----

### Using Functions

To calculate the mean, you could do it _manually_ like this


```r
(5+8+14+91+3+36+14+30)/8
```

```
## [1] 25.125
```

Or use a function:

```r
mean(x)
```

```
## [1] 25.125
```

----

Type `?functionname` to learn more about a function, e.g. `?mean`.  In RStudio, you can also search in the help panel.  There are other arguments too: `mean(x, trim = 0, na.rm = FALSE, ...)`

In RStudio, if you press `TAB` after a function name (such as `mean( `), it will show function arguments.

![Autocomplete screenshot][pic1]

[pic1]: img/autocomplete.png "Autocomplete Screenshot"


> Try to calculate the mean of `c(3,6,12,89)`.    

---- 

### Solution

```r
y=c(3,6,12,89)
mean(y)
```

```
## [1] 27.5
```

```r
#or
mean(c(3,6,12,89))
```

```
## [1] 27.5
```

----

Writing functions in R is pretty easy.  Let's create one to calculate the mean of a vector by getting the sum and length.  First think about how to break it down into parts:

```r
x1= sum(x)
x2=length(x)
x1/x2
```

```
## [1] 27.5
```

----

Then put it all back together and create a new function called `mymean`:

```r
mymean=function(f){
  sum(f)/length(f)
}

mymean(f=x)
```

```
## [1] 25.125
```

Confirm it works:

```r
mean(x)
```

```
## [1] 25.125
```

> Any potential problems with the `mymean` function?

----

### Missing data:  dealing with `NA` values

```r
x3=c(5,8,NA,91,3,NA,14,30,100)
```

> What do you think `mymean(x3)` will return?

----

Calculate the mean using the new function

```r
mymean(x3)
```

```
## [1] NA
```
Use the built-in function (with and without na.rm=T)

```r
mean(x3)
```

```
## [1] NA
```

```r
mean(x3,na.rm=T)
```

```
## [1] 35.85714
```
Writing simple functions is easy, writing robust, reliable functions can be hard...

----

### Logical values

R also has standard conditional tests to generate `TRUE` or `FALSE` values (which also behave as `0`s and `1`s.  These are often useful for filtering data (e.g. identify all values greater than 5).  The logical operators are `<`, `<=`, `>`, `>=`, `==` for exact equality and `!=` for inequality.


```r
  x3 > 75
```

```
## [1] FALSE FALSE    NA  TRUE FALSE    NA FALSE FALSE  TRUE
```

```r
  x3 == 40
```

```
## [1] FALSE FALSE    NA FALSE FALSE    NA FALSE FALSE FALSE
```

```r
  x3 >   15
```

```
## [1] FALSE FALSE    NA  TRUE FALSE    NA FALSE  TRUE  TRUE
```

----

And you can perform operations on those results:

```r
sum(x3>15,na.rm=T)
```

```
## [1] 3
```

or save the results as variables:

```r
result =  x3 >  3
result
```

```
## [1]  TRUE  TRUE    NA  TRUE FALSE    NA  TRUE  TRUE  TRUE
```

> Try this:  define a function that counts how many values in a vector are less than or equal to 12

----


```r
mycount=function(x){
  sum(x<=12)
}
```
Try it:

```r
x3
```

```
## [1]   5   8  NA  91   3  NA  14  30 100
```

```r
mycount(x3)
```

```
## [1] NA
```
oops!

----


```r
mycount=function(x){
  sum(x<=12,na.rm=T)
}
```
Try it:

```r
x3
```

```
## [1]   5   8  NA  91   3  NA  14  30 100
```

```r
mycount(x3)
```

```
## [1] 3
```

Nice!

----

### Generating Data

There are many ways to generate data in R such as sequences:

```r
seq(from=0, to=1, by=0.25)
```

```
## [1] 0.00 0.25 0.50 0.75 1.00
```
and random numbers that follow a statistical distribution (such as the normal):


```r
a=rnorm(100,mean=0,sd=10)
```

----

Let's visualize those values in a histogram:

```r
hist(a)
```

![](R_Introduction_files/figure-html/unnamed-chunk-27-1.png) 

We'll cover much more sophisticated graphics later...

## Matrices
You can also use matrices (2-dimensional arrays of numbers):

```r
y=matrix(1:30,ncol=5)
y
```

```
##      [,1] [,2] [,3] [,4] [,5]
## [1,]    1    7   13   19   25
## [2,]    2    8   14   20   26
## [3,]    3    9   15   21   27
## [4,]    4   10   16   22   28
## [5,]    5   11   17   23   29
## [6,]    6   12   18   24   30
```

----

Matrices behave much like vectors:

```r
y
```

```
##      [,1] [,2] [,3] [,4] [,5]
## [1,]    1    7   13   19   25
## [2,]    2    8   14   20   26
## [3,]    3    9   15   21   27
## [4,]    4   10   16   22   28
## [5,]    5   11   17   23   29
## [6,]    6   12   18   24   30
```

```r
y+2
```

```
##      [,1] [,2] [,3] [,4] [,5]
## [1,]    3    9   15   21   27
## [2,]    4   10   16   22   28
## [3,]    5   11   17   23   29
## [4,]    6   12   18   24   30
## [5,]    7   13   19   25   31
## [6,]    8   14   20   26   32
```

----

and have 2-dimensional indexing:

```r
y
```

```
##      [,1] [,2] [,3] [,4] [,5]
## [1,]    1    7   13   19   25
## [2,]    2    8   14   20   26
## [3,]    3    9   15   21   27
## [4,]    4   10   16   22   28
## [5,]    5   11   17   23   29
## [6,]    6   12   18   24   30
```

```r
y[2,3]
```

```
## [1] 14
```

## Data Frames
Data frames are similar to matrices, but more flexible.  Matrices must be all the same type (e.g. all numbers), while a data frame can include multiple data types (e.g. text, factors, numbers). Dataframes are commonly used when doing statistical modeling in R.  


```r
data = data.frame( x = c(11,12,14),
                   y = c(19,20,21),
                   z = c(10,9,7))
data
```

```
##    x  y  z
## 1 11 19 10
## 2 12 20  9
## 3 14 21  7
```

----

You can subset in several ways

```r
mean(data$z)
```

```
## [1] 8.666667
```

```r
mean(data[["z"]])
```

```
## [1] 8.666667
```

```r
mean(data[,3])
```

```
## [1] 8.666667
```

## Loading Packages

For installed packages:  `library(packagename)`.

New packages: `install.packages()` or use the package manager. 


```r
library(raster)
```

> R may ask you to choose a CRAN mirror. CRAN is the distributed network of servers that provides access to R's software.  It doesn't really matter which you chose, but closer ones are likely to be faster.  From RStudio, you can select the mirror under Tools→Options or just wait until it asks you.


If you don't have the packages above, install them in the package manager or by running `install.packages("raster")`.
