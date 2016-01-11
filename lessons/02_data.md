

# Working With Data in R

In this lesson we are going to focus on data and how it is dealt with by R.  This will include a discussion of the basic data types and data structures.  Lastly we will cover how to get data that lives in other files into R.  We will work through examples using base R. I will demo other ways of getting data into R with some additional packages

## Lesson Outline:

- [Data types and data structures in R](#data-types-and-data-structures-in-r)
- [Reading external data](#reading-external-data)
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

`NA` is R's value for missing data.  You will see this often and need to figure out how to deal with them in your analysis.  A few built in functions are useful for dealing with `NA`.  


```r
na.omit()#na.omit - removes them
na.exclude()#similar to omit, but has different behavior with some functions.
is.na()#Will tell you if a value is NA
```

`Inf` is infinity. You can have positive or negative infinity and `NaN` means "not a number."  It's an undefined value.

###Data structures
The next set of information relates to the many data structures in R.  

The data structures in base R include:

- vector
- list
- matrix
- data frame
- factors
- tables

Our efforts will focus on vectors, and data frames.  We will discuss just the basics of lists and factors. We  will leave it to your curiousity to explore the matrix and table data structures.

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

Lastly, R can operate directly on vectors.  This means we can use use our arithmetic functions on vectors and also many functions can deal with vectors directly.  The result of this is another vector, equal to the length of the longest one.  You will hear this referred to as "vectorized" operations.


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

For the first exercise of lesson 2, we are going to build a data frame from scratch.  

1.) Create a new script for this exercise and call it "lesson2.R".  All of the code for this exercise will be put into this script.  Don't forget to use comments!

2.) Create three vectors.  One with numeric data, one with character, and a third with boolean data.  Each vector must contain at least 10 values.

3.) Combine these three vectors into a data frame (hint: `data.frame()`) that is stored in an object called `my_df`.

4.) Now from the console, explore `my_df` with some of the functions we talked about earlier.

##Reading external data
Completely creating a data frame from scratch is useful (especially when you start writing your own functions), but more often than not data is stored in an external file that you need to read into R.  These may be delimited text files, spreadsheets, relational databases, SAS files ...  You get the idea.  Instead of treating this subject exhaustively, we will focus just on a single file type, `.csv` that is very commonly encountered and (usually) easy to create from other file types.  For this, we will use `read.csv()`. 

`read.csv()` is a specialized version of `read.table()` that focuses on, big surprise here, .csv files. This command assumes a header row with column names and that the delimiter is a comma. The expected no data value is NA and by default, strings are converted to factors by default (this can trip people up).

Source files for `read.csv()` can either be on a local hard drive or, and this is pretty cool, on the web. We will be using the later for our examples and exercises. If you had a local file it would be accessed like `mydf <- read.csv("C:/path/to/local/file.csv")`. As an aside, paths and use of forward vs back slash is important. R is looking for forward slashes ("/"), or unix-like paths. You can use these in place of the back slash and be fine. You can use a back slash but it needs to be a double back slash ("\"). This is becuase the single backslash in an escape character that is used to indicate things like newlines or tabs. 

For now we are going to be focusing on grabbing data from a website, which just requires using an URL in the read.csv() function.

Let's give it a try.


```r
#Grab data from the web
web_df <- read.csv("http://jwhollister.com/public/files/example.csv")
head(web_df)
```

```
##   X id      data1    data2 groups
## 1 1  1  0.1739595 54.21928      1
## 2 2  2  0.4947904 69.92845      1
## 3 3  3  2.1739104 47.50045      1
## 4 4  4 -2.1275110 30.16031      1
## 5 5  5  0.5302878 84.45975      1
## 6 6  6  0.3000054 56.41225      1
```

```r
str(web_df)
```

```
## 'data.frame':	100 obs. of  5 variables:
##  $ X     : int  1 2 3 4 5 6 7 8 9 10 ...
##  $ id    : int  1 2 3 4 5 6 7 8 9 10 ...
##  $ data1 : num  0.174 0.495 2.174 -2.128 0.53 ...
##  $ data2 : num  54.2 69.9 47.5 30.2 84.5 ...
##  $ groups: int  1 1 1 1 1 1 1 1 1 1 ...
```

```r
dim(web_df)
```

```
## [1] 100   5
```

```r
summary(web_df)
```

```
##        X                id             data1              data2      
##  Min.   :  1.00   Min.   :  1.00   Min.   :-2.12751   Min.   :11.13  
##  1st Qu.: 25.75   1st Qu.: 25.75   1st Qu.:-0.57451   1st Qu.:31.47  
##  Median : 50.50   Median : 50.50   Median :-0.02109   Median :52.09  
##  Mean   : 50.50   Mean   : 50.50   Mean   : 0.07867   Mean   :54.14  
##  3rd Qu.: 75.25   3rd Qu.: 75.25   3rd Qu.: 0.79215   3rd Qu.:78.42  
##  Max.   :100.00   Max.   :100.00   Max.   : 2.20980   Max.   :99.52  
##      groups    
##  Min.   :1.00  
##  1st Qu.:1.00  
##  Median :2.00  
##  Mean   :2.30  
##  3rd Qu.:3.25  
##  Max.   :4.00
```


##Exercise 2.2
From here on out I hope to have these exercises begin to build on each other. We may not do that 100%, but there should at least be a modicum of continuity. For this exercise we are going to grab some data, look at that data, and be able to describe some basic information about that dataset.  The data we are using is the 2007 National Lakes Assessment.

1. Create a new script in RStudio.  Name it "nla_analysis.R"
2. As you write the script comment as you go.
3. Add commands to your script that creates one data frames named `nla_wq` that contains all of the data located at http://bit.ly/nla_water. This link points to a .csv file on the NLA water quality data
4. Add commands to your script that will provides details on the structure (hint: `str`) of the newly created data frame
5. Run the script and make sure it doesn't throw any errors and you do in fact get the two data frames.
6. Explore the data frames using some of the functions we covered (e.g. `head()`,`summary()`, or `str()`).  This part does not need to be included in the script.  If you are feeling adventorous, try some of the following on some columns of this data frame: `IQR()`,`range()`, `mean()`,`max()`,`min()`, `quantile()`.


##Other ways to read data
Although, `read.csv()` and `read.table()` are very flexible, they are not the only options for reading in data.  In this section we will discuss some other packages developed for reading in data.  

###readr and readxl
Two packages developed by Hadley Wickham for reading in data are `readr` and `readxl`.  `readr` was developed to provide a more consistent and friendlier interface for reading in data.  It also address many of the idiosyncracies (annoyances??) in `read.csv()`.  The `readxl` pacakge does just that, it reads in Excel spreadsheets.  Other packages also exist for this but they all have external dependencies (e.g. Java or perl) that can make install a bit more challenging.  Both of these are available from CRAN. Links to the GitHub repositories are below:

- [readr](https://github.com/hadley/readr)
- [readxl](https://github.com/hadley/readxl)

###rio
The `rio` package was developed as a general purpose data import and export tool.  It includes and impressive array of file types that it supports.  Like `readr` a goal of the package was to simplify the process.  As such the primary functions area `import()` and `export()`.  The functions are smart enough to guess the file type.  It is availble from CRAN as well as via the [GitHub repo](https://github.com/leeper/rio).

###A word on working with databases in R.
This is a big topic, so we clearly won't really be addressing it.  That being said I wanted to at least provide some suggestions that can get you going in the right direction if you want to work directly with data stored in an externaldatabase.  A number of packages exist that allow you to work with a variety of databases.  A few that will cover most of what you encounter are:

- `DBI`: This package, short for database interface, supports connections to a number of databases, including SQLite, MySQL, and PostgreSQL.
- `RODBC`: This is an R implementation of the ODBC connectivity.  It allows you to connect with, among other things, Microsoft Access databases.  

Each of these provide a fairly low-level interface and have a bit of a learning curve.  A higher-level way to access your databases is through the use of `dplyr`. `dplyr` uses DBI to connect direcly to databases and allows query of that database through the use of the `dplyr` functions.  To learn more, read the [vignette on databases](https://cran.r-project.org/web/packages/dplyr/vignettes/databases.html).  That provides a lot of good examples.  We will be working some with `dplyr` in the next lesson, but won't have time to get into the database connections.
