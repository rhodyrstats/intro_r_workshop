

# Basic Data Wrangling with R

Data wrangling (manipulation, jujitsu, cleaning, etc.) is the part of any data
analysis that will take the most time.  While it may not necessarily be fun, it
is foundational to all the work that follows.  For this workshop we are just 
going to cover the bare essentialls of working with data frames in R.  We will 
see how to do this with base R and will practice how to do it with Hadley Wickham's `dplyr` package.

## Lesson Outline:

- [Indexing vectors](#indexing-vectors)
- [Indexing lists](#indexing-lists)
- [Indexing data frames](#indexing-data-frames)
- [`dplyr`](#dplyr)

## Lesson Exercises:
- [Exercise 3.1](#exercise-31)


##Indexing vectors


##Indexing lists


##Indexing data frames


##dplyr

The package `dplyr` is a fairly new (2014) package that tries to provide easy tools for the most common data manipulation tasks.  It is built to work directly with data frames.  The thinking behind it was largely inspired by the package `plyr` which has been in use for some time but suffered from being slow in some cases.  `dplyr` addresses this by porting much of the computation to C++.  An additional feature is the ability to work with data stored directly in an external database.  The benefits of doing this are that the data can be managed natively in a relational database, queries can be conducted on that database, and only the results of the query returned.  

This addresses a common problem with R in that all operations are conducted in memory and thus the amount of data you can work with is limited by available memory.  The database connections essentially remove that limitation in that you can have a database of many 100s GB, conduct queries on it directly and pull back just what you need for analysis in R.  There is a lot of great info on `dplyr`.  If you have an interest, i'd encourage you to look more.  The vignettes are particulary good.

- [`dplyr` GitHub repo](https://github.com/hadley/dplyr)
- [CRAN page: vignettes here](http://cran.rstudio.com/web/packages/dplyr/)

##Exercise 3.1
