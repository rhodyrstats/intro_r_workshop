# Working With Data in R

In this lesson we are going to focus on data and how it is dealt with by R.  
This will include a discussion of the basic data types as well as data 
structures.  Lastly we will cover ways to get data that lives in other files into
R.  We will work through examples using base R. I will demo other ways of 
getting data into R with some additional packages

## Lesson Outline:

- [Data types and data structures in R](#data-types-and-data-structures-in-r)
- [Reading external data](#reading-external-data)
- [Look at your data](#look-at-your-data)
- [Other ways to read data](#other-ways-to-read-data)

## Lesson Exercises:

- [Exercise 2.1](#exercise-21)
- [Exercise 2.2](#exercise-22)

##Data types and data structures in R
*Borrowed liberally from Jenny Bryan's [course materials on r](http://www.stat.ubc.ca/~jenny/STAT545A/quick-index.html) and Karthik Ram's [material from the Canberra Software Carpentry R Bootcamp](https://github.com/swcarpentry/2013-10-09-canberra).  Anything good is because of Jenny and Karthik.  Mistakes are all mine.*

Remember that everything in R is an object.  With regards to data, those objects have some specific characteristics that help R (and us) know what kind of data we are dealing with and what kind of operations can be done on that data.  This stuff may be a bit dry, but a basic understanding will help as so much of what we do with analysis has to do with the organization and type of data we have. First, lets discuss the atomic data types.

###Data types

There are 6 basic atomic classes: character, numeric (real or decimal), integer, logical, complex, and raw.

| Example 				 | Type 		 |
| :--------------- | --------: |
| "a", "swc" 			 | character |
| 2, 15.5 				 | numeric 	 | 
| 2L 							 | integer 	 |
| `TRUE`, `FALSE`  | logical 	 |
| 1+4i 						 | complex 	 |
| 62 6f 62         | raw			 |

In this workshop we will deal almost exclusively with three (and these are, in my experience, by far the most common): character, numeric, and logical.  

### NA, Inf, and NaN
There are values that you will run across on ocassion that aren't really data types but are important to know about.  

`NA` is R's value for missing data.  You will see this often and need to figure out how to deal with them in your analysis.  A few built in functions are useful for dealing with `NA`.  We will show their usage a bit later.


```r
na.omit()#na.omit - removes them
na.exclude()#similar to omit, but has different behavior with some functions.
is.na()#Will tell you if a value is NA
```

`Inf` is infinity. You can have positive or negative infinity.


```r
1/0
```

```
## [1] Inf
```

```r
# [1] Inf
1/Inf
```

```
## [1] 0
```

```r
# [1] 0
```

`NaN` means Not a number. it's an undefined value.


```r
0/0
```

```
## [1] NaN
```

```r
NaN.
```

```
## Error in eval(expr, envir, enclos): object 'NaN.' not found
```

###Data structures
The next set of information relates to the many data structures in R.  

The data structures in base R include:

- vector
- list
- matrix
- data frame
- factors
- tables

Our efforts will focus on vectors and data frames.  We will discuss just the basics of lists and factors.  I will leave it to your curiousity to explore the matrix and table data structures.

### Vectors
A vector is the most common and basic data structure in `R` and is pretty much the workhorse of R. 

A vector can be a vector of characters, logical, integers or numeric and all values in the vector must be of the same data type.  Specifically, these are known as atomic vectors.

There are many ways to create vectors, but we will focus on one, `c()`, which is a very common way to create a vector from a set of values.  `c()` combines a set of arguments into a single vector.  For instance,


```r
char_vector <- c("Joe","Bob","Sue")
num_vector <- c(1,6,99,-2)
logical_vector <- c(TRUE,FALSE,FALSE,TRUE,T,F)
```

Now that we have these we can use some functions to examine the vectors. 


```r
#Print the vector
print(char_vector)
```

```
## [1] "Joe" "Bob" "Sue"
```

```r
char_vector
```

```
## [1] "Joe" "Bob" "Sue"
```

```r
#Examine the vector
typeof(char_vector)
```

```
## [1] "character"
```

```r
length(logical_vector)
```

```
## [1] 6
```

```r
class(num_vector)
```

```
## [1] "numeric"
```

```r
str(char_vector)
```

```
##  chr [1:3] "Joe" "Bob" "Sue"
```

We can also add to existing vectors using `c()`.


```r
char_vector <- c(char_vector, "Jeff")
char_vector
```

```
## [1] "Joe"  "Bob"  "Sue"  "Jeff"
```

There are some ways to speed up entry of values.


```r
#Create a series
series <- 1:10
seq(10)
```

```
##  [1]  1  2  3  4  5  6  7  8  9 10
```

```r
seq(1, 10, by = 0.1)
```

```
##  [1]  1.0  1.1  1.2  1.3  1.4  1.5  1.6  1.7  1.8  1.9  2.0  2.1  2.2  2.3
## [15]  2.4  2.5  2.6  2.7  2.8  2.9  3.0  3.1  3.2  3.3  3.4  3.5  3.6  3.7
## [29]  3.8  3.9  4.0  4.1  4.2  4.3  4.4  4.5  4.6  4.7  4.8  4.9  5.0  5.1
## [43]  5.2  5.3  5.4  5.5  5.6  5.7  5.8  5.9  6.0  6.1  6.2  6.3  6.4  6.5
## [57]  6.6  6.7  6.8  6.9  7.0  7.1  7.2  7.3  7.4  7.5  7.6  7.7  7.8  7.9
## [71]  8.0  8.1  8.2  8.3  8.4  8.5  8.6  8.7  8.8  8.9  9.0  9.1  9.2  9.3
## [85]  9.4  9.5  9.6  9.7  9.8  9.9 10.0
```

```r
#Repeat values
fives<-rep(5,10)
fives
```

```
##  [1] 5 5 5 5 5 5 5 5 5 5
```

```r
laugh<-rep("Ha", 100)
laugh
```

```
##   [1] "Ha" "Ha" "Ha" "Ha" "Ha" "Ha" "Ha" "Ha" "Ha" "Ha" "Ha" "Ha" "Ha" "Ha"
##  [15] "Ha" "Ha" "Ha" "Ha" "Ha" "Ha" "Ha" "Ha" "Ha" "Ha" "Ha" "Ha" "Ha" "Ha"
##  [29] "Ha" "Ha" "Ha" "Ha" "Ha" "Ha" "Ha" "Ha" "Ha" "Ha" "Ha" "Ha" "Ha" "Ha"
##  [43] "Ha" "Ha" "Ha" "Ha" "Ha" "Ha" "Ha" "Ha" "Ha" "Ha" "Ha" "Ha" "Ha" "Ha"
##  [57] "Ha" "Ha" "Ha" "Ha" "Ha" "Ha" "Ha" "Ha" "Ha" "Ha" "Ha" "Ha" "Ha" "Ha"
##  [71] "Ha" "Ha" "Ha" "Ha" "Ha" "Ha" "Ha" "Ha" "Ha" "Ha" "Ha" "Ha" "Ha" "Ha"
##  [85] "Ha" "Ha" "Ha" "Ha" "Ha" "Ha" "Ha" "Ha" "Ha" "Ha" "Ha" "Ha" "Ha" "Ha"
##  [99] "Ha" "Ha"
```

Lastly, R can operate directly on vectors.  This means we can use use our arithmetic functions on vectors and also many functions can deal with vectors directly.  The result of this is another vector, equal to the length of the longest one.


```r
#A numeric example
x<-1:10
y<-10:1
z<-x+y
z
```

```
##  [1] 11 11 11 11 11 11 11 11 11 11
```

```r
#another one, with different lengths
a<-1
b<-1:10
c<-a+b
c
```

```
##  [1]  2  3  4  5  6  7  8  9 10 11
```

```r
#A character example with paste()
first<-c("Buggs","Elmer","Pepe", "Foghorn")
last<-c("Bunny", "Fudd","Le Pew", "Leghorn")
first_last<-paste(first, last)
first_last
```

```
## [1] "Buggs Bunny"     "Elmer Fudd"      "Pepe Le Pew"     "Foghorn Leghorn"
```

### Data frames

Data frames are the data structure you will most often use when doing data analysis.  They are the most spreadsheet like data structure in R, but unlike spreadsheets there are some rules that must be followed. This is a good thing!

Data frames are made up of rows and columns.  Each column is a vector and those vectors must be of the same length.  Essentially, anything that can be saved in a `.csv` file can be read in as a data frame.  Data frames have several attributes.  The ones you will interact with the most are column names, row names, dimension.  

So one way to create a data frame is from some vectors and the `data.frame()` command:


```r
numbers <- c(1:26,NA)
letters <- c(NA,letters) #letters is a special object available from base R
logical <- c(rep(TRUE,13),NA,rep(FALSE,13))
examp_df <- data.frame(letters,numbers,logical)
```

Now that we have this data frame we probably want to do something with it.  We can examine it in many ways.


```r
#See the first 6 rows
head(examp_df)
```

```
##   letters numbers logical
## 1    <NA>       1    TRUE
## 2       a       2    TRUE
## 3       b       3    TRUE
## 4       c       4    TRUE
## 5       d       5    TRUE
## 6       e       6    TRUE
```

```r
#See the last 6 rows
tail(examp_df)
```

```
##    letters numbers logical
## 22       u      22   FALSE
## 23       v      23   FALSE
## 24       w      24   FALSE
## 25       x      25   FALSE
## 26       y      26   FALSE
## 27       z      NA   FALSE
```

```r
#See column names
names(examp_df)
```

```
## [1] "letters" "numbers" "logical"
```

```r
#see row names
rownames(examp_df)
```

```
##  [1] "1"  "2"  "3"  "4"  "5"  "6"  "7"  "8"  "9"  "10" "11" "12" "13" "14"
## [15] "15" "16" "17" "18" "19" "20" "21" "22" "23" "24" "25" "26" "27"
```

```r
#Show structure of full data frame
str(examp_df)
```

```
## 'data.frame':	27 obs. of  3 variables:
##  $ letters: Factor w/ 26 levels "a","b","c","d",..: NA 1 2 3 4 5 6 7 8 9 ...
##  $ numbers: int  1 2 3 4 5 6 7 8 9 10 ...
##  $ logical: logi  TRUE TRUE TRUE TRUE TRUE TRUE ...
```

```r
#Show number of rows and colums
dim(examp_df)
```

```
## [1] 27  3
```

```r
nrow(examp_df)
```

```
## [1] 27
```

```r
ncol(examp_df)
```

```
## [1] 3
```

```r
#Get summary info
summary(examp_df)
```

```
##     letters      numbers       logical       
##  a      : 1   Min.   : 1.00   Mode :logical  
##  b      : 1   1st Qu.: 7.25   FALSE:13       
##  c      : 1   Median :13.50   TRUE :13       
##  d      : 1   Mean   :13.50   NA's :1        
##  e      : 1   3rd Qu.:19.75                  
##  (Other):21   Max.   :26.00                  
##  NA's   : 1   NA's   :1
```

```r
#remove NA
na.omit(examp_df)
```

```
##    letters numbers logical
## 2        a       2    TRUE
## 3        b       3    TRUE
## 4        c       4    TRUE
## 5        d       5    TRUE
## 6        e       6    TRUE
## 7        f       7    TRUE
## 8        g       8    TRUE
## 9        h       9    TRUE
## 10       i      10    TRUE
## 11       j      11    TRUE
## 12       k      12    TRUE
## 13       l      13    TRUE
## 15       n      15   FALSE
## 16       o      16   FALSE
## 17       p      17   FALSE
## 18       q      18   FALSE
## 19       r      19   FALSE
## 20       s      20   FALSE
## 21       t      21   FALSE
## 22       u      22   FALSE
## 23       v      23   FALSE
## 24       w      24   FALSE
## 25       x      25   FALSE
## 26       y      26   FALSE
```

### Factors and Lists

Factors are special vectors that represent categorical data. Factors can be ordered or unordered and are often important with modelling functions such as `lm()` and `glm()` (think dummy variables) and also in plot methods.

Factors are pretty much integers that have labels on them.  While factors look (and often behave) like character vectors, they are actually integers under the hood, and you need to be careful when treating them like strings. Some string methods will coerce factors to strings, while others will throw an error.

Factors may be ordered (e.g., low, medium, high) or unordered (e.g. male, female).

Factors can be created with `factor()`. Input is a character vector.


```r
#An unordered factor
yn <- factor(c("yes", "no", "no", "yes", "yes"))
yn
```

```
## [1] yes no  no  yes yes
## Levels: no yes
```

```r
#An ordered factor
lmh <- factor (c("high","high","low","medium","low","medium","high"),levels=c("low","medium","high"),ordered=TRUE )
lmh
```

```
## [1] high   high   low    medium low    medium high  
## Levels: low < medium < high
```

### List

Lists are actually a special type of vector, but it is probably best to think of them as their own thing.  Lists can contain multiple items, of multiple types, and of multiple structures.  They are very versatile and often used inside functions or as an output of functions.  

Also, lists don't print out like a vector. They print a new line for each element.

Lists are made simply with the `list()` function.


```r
examp_list<-list(letters=c("x","y","z"),animals=c("cat","dog","bird","fish"),numbers=1:100,df=examp_df)
examp_list
```

```
## $letters
## [1] "x" "y" "z"
## 
## $animals
## [1] "cat"  "dog"  "bird" "fish"
## 
## $numbers
##   [1]   1   2   3   4   5   6   7   8   9  10  11  12  13  14  15  16  17
##  [18]  18  19  20  21  22  23  24  25  26  27  28  29  30  31  32  33  34
##  [35]  35  36  37  38  39  40  41  42  43  44  45  46  47  48  49  50  51
##  [52]  52  53  54  55  56  57  58  59  60  61  62  63  64  65  66  67  68
##  [69]  69  70  71  72  73  74  75  76  77  78  79  80  81  82  83  84  85
##  [86]  86  87  88  89  90  91  92  93  94  95  96  97  98  99 100
## 
## $df
##    letters numbers logical
## 1     <NA>       1    TRUE
## 2        a       2    TRUE
## 3        b       3    TRUE
## 4        c       4    TRUE
## 5        d       5    TRUE
## 6        e       6    TRUE
## 7        f       7    TRUE
## 8        g       8    TRUE
## 9        h       9    TRUE
## 10       i      10    TRUE
## 11       j      11    TRUE
## 12       k      12    TRUE
## 13       l      13    TRUE
## 14       m      14      NA
## 15       n      15   FALSE
## 16       o      16   FALSE
## 17       p      17   FALSE
## 18       q      18   FALSE
## 19       r      19   FALSE
## 20       s      20   FALSE
## 21       t      21   FALSE
## 22       u      22   FALSE
## 23       v      23   FALSE
## 24       w      24   FALSE
## 25       x      25   FALSE
## 26       y      26   FALSE
## 27       z      NA   FALSE
```

If you want to learn more about lists or any other data structure, [Hadley Wickham's Advanced R section on data structures](http://adv-r.had.co.nz/Data-structures.html) is good.


##Exercise 2.1

For the first exercise of lesson 2, we are going to build a data frame from 
scratch.  

1.) Create a new script for this exercise and call it "exercise2_1.R".  All of 
the code for this exercise will be put into this script.  Don't forget to use
comments!

2.) Create three vectors.  One with numeric data, one with character, and a 
third with boolean data.  Each vector must contain at least 10 values.

3.) Combine these three vectors into a data frame (hint: `data.frame()`) that is
stored in an object called `my_df`.

4.) Now from the console, explore `my_df` with some of the functions we talked
about earlier.

##Reading external data
- read.csv()


##Exercise 2.2
- read in df and make sure looks good
- explore data
http://usepa.github.io/introR/2015/01/14/02-Get/#exercise-2
http://usepa.github.io/introR/2015/01/14/04-Explore/#exercise-1

##Other ways to read data
- readr readxls
- rio
- readr::read_csv()
- word on databases (DBI and dplyr)
- readxl
