################################################################################
# lessons//01_basics.R
################################################################################
## ----function_examples---------------------------------------------------
#Print
print("hello world!")
#A sequence
seq(1,10)
#Random normal numbers
rnorm(100,mean=10,sd=2)
#Mean
mean(rnorm(100))
#Sum
sum(rnorm(100))

## ----install_package-----------------------------------------------------
#Install dplyr and ggplot2
install.packages("ggplot2")
install.packages("dplyr")

#You can also put more than one in like
install.packages(c("randomForest","formatR"))

## ----load_package--------------------------------------------------------
#Add libraries to your R Session
library("ggplot2")
library("dplyr")

#You can also access functions without loading by using package::function
randomForest::randomForest


## ----other_packages, eval=FALSE------------------------------------------
## #See what is installed
installed.packages()

## #What packages are available?
available.packages()

## #Update, may take a while if you have many packages installed
update.packages()

## ----operators_consoloe--------------------------------------------------
#A really powerful calculator!
1+1 #Add
10-4 #Subtract
3*2 #Multiply
3^3 #Exponents
100/10 #Divide
5%%2 #Modulus
5>2 #Greater than
4<5 #Less than
5<=5 #Less than or equal
8>=2 #Greater than or equal
2==2 #Equality: notice that it is TWO equal signs!
5!=7 #Not Equals

## ----assignment_operator-------------------------------------------------
#Numeric assignment
x<-5
x
y<-x+1
y
z<-x+y
z
#Character
a<-"Bob"
a
b<-"Sue"
b
a2<-"Larry"
a2

## ----useful_functions_workspace, eval=FALSE------------------------------
## #List all objects in current workspace
ls()
ls(pattern="a")

## #Remove an object
rm(x)

## #Save your workspace
## #Saves the whole thing to a file called lesson2.RData
save.image("lesson2.RData")
## #Saves just the a and y objects to a file called lesson2_ay.RData
save(a,y,file="lesson2_ay.RData")

## ----useful_functions_directory------------------------------------------
#See the current directory
getwd()

#Change the directory
setwd("figures")

#List files and directories
list.files()

## ----help_from_console, eval=FALSE---------------------------------------
## #Using the help command/shortcut
help("print") #Help on the print command
?print #Help on the print command using the `?` shortcut
help(package="dplyr") #Help on the package `dplyr`

## #Don't know the exact name or just part of it
apropos("print") #Returns all available functions with "print" in the name
??print #Shortcut, but also searches demos and vignettes in a formatted page


################################################################################
# lessons//02_data.R
################################################################################
## ----na_examples, eval=FALSE---------------------------------------------
na.omit()#na.omit - removes them
na.exclude()#similar to omit, but has different behavior with some functions.
is.na()#Will tell you if a value is NA

## ----use_c---------------------------------------------------------------
char_vector <- c("Joe","Bob","Sue")
num_vector <- c(1,6,99,-2)
logical_vector <- c(TRUE,FALSE,FALSE,TRUE,T,F)

## ----examine_vector------------------------------------------------------
#Print the vector
print(char_vector)
char_vector

#Examine the vector
typeof(char_vector)
length(logical_vector)
class(num_vector)
str(char_vector)

## ----add_to_vec----------------------------------------------------------
char_vector <- c(char_vector, "Jeff")
char_vector

## ----vector_shortcuts----------------------------------------------------
#Create a series
series <- 1:10
seq(10)
seq(1, 10, by = 0.1)

#Repeat values
fives<-rep(5,10)
fives
laugh<-rep("Ha", 100)
laugh

## ----vectorized_examp----------------------------------------------------
#A numeric example
x<-1:10
y<-10:1
z<-x+y
z

#another one, with different lengths
a<-1
b<-1:10
c<-a+b
c


#A character example with paste()
first<-c("Buggs","Elmer","Pepe", "Foghorn")
last<-c("Bunny", "Fudd","Le Pew", "Leghorn")
first_last<-paste(first, last)
first_last

## ----create_data_frame---------------------------------------------------
numbers <- c(1:26,NA)
letters <- c(NA,letters) #letters is a special object available from base R
logical <- c(rep(TRUE,13),NA,rep(FALSE,13))
examp_df <- data.frame(letters,numbers,logical)

## ----examine_data_frame--------------------------------------------------
#See the first 6 rows
head(examp_df)
#See the last 6 rows
tail(examp_df)
#See column names
names(examp_df)
#see row names
rownames(examp_df)
#Show structure of full data frame
str(examp_df)
#Show number of rows and colums
dim(examp_df)
nrow(examp_df)
ncol(examp_df)
#Get summary info
summary(examp_df)
#remove NA
na.omit(examp_df)

## ----factor_examples-----------------------------------------------------
#An unordered factor
yn <- factor(c("yes", "no", "no", "yes", "yes"))
yn

#An ordered factor
lmh <- factor (c("high","high","low","medium","low","medium","high"),levels=c("low","medium","high"),ordered=TRUE )
lmh

## ----list_examples-------------------------------------------------------
examp_list<-list(letters=c("x","y","z"),animals=c("cat","dog","bird","fish"),numbers=1:100,df=examp_df)
examp_list

## ----readcsv-------------------------------------------------------------
#Grab data from the web
web_df <- read.csv("http://jwhollister.com/public/files/example.csv")
head(web_df)
str(web_df)
dim(web_df)
summary(web_df)

################################################################################
# lessons//03_wrangling.R
################################################################################
## ----indexing_examp------------------------------------------------------
#Create a vector
x<-c(10:19)
x
#Positive indexing returns just the value in the ith place
x[7]
#Negative indexing returns all values except the value in the ith place
x[-3]
#Ranges work too
x[8:10]
#A vector can be used to index
#Can be numeric
x[c(2,6,10)]
#Can be boolean - will repeat the pattern 
x[c(TRUE,FALSE)]
#Can even get fancy
x[x%%2==0]

## ----list_index----------------------------------------------------------
x_list <- list(1:10,letters[1:10])
x_list
#Get the first item of the list
x_list[[1]]
#Or the second item
x_list[[2]]
#And now the letter "g"
x_list[[2]][7]

## ----data_frame_index----------------------------------------------------
#Let's use one of the stock data frames in R, iris
head(iris)
#And grab a specific value
iris[1,1]
#A whole column
petal_len<-iris[,3]
petal_len
#A row
obs15<-iris[15,]
obs15
#Many rows
obs3to7<-iris[3:7,]
obs3to7

## ----more_data_frame_index-----------------------------------------------
#First, there are a couple of ways to use the column names
iris$Petal.Length
head(iris["Petal.Length"])
#Multiple colums
head(iris[c("Petal.Length","Species")])
#Now we can combine what we have seen to do some more complex queries
#Lets get all the data for Species with a petal length greater than 6
big_iris<-iris[iris$Petal.Length>=6,]
head(big_iris)
#Or maybe we want just the sepal widths of the virginica species
virginica_iris<-iris$Sepal.Width[iris$Species=="virginica"]
head(virginica_iris)

## ----setup_dplyr,eval=FALSE----------------------------------------------
install.packages("dplyr")
library("dplyr")

## ----more_data_frame_dplyr-----------------------------------------------
#First, select some columns
dplyr_sel<-select(iris,Sepal.Length,Petal.Length,Species)
#That's it.  Select one or many columns
#Now select some, like before
dplyr_big_iris<-filter(iris, Petal.Length>=6)
head(dplyr_big_iris)
#Or maybe we want just the virginica species
virginica_iris<-filter(iris,Species=="virginica")
head(virginica_iris)

## ----combine_commands----------------------------------------------------
#Intermediate data frames
#Select First: note the order of the output, neat too!
dplyr_big_iris_tmp1<-select(iris,Species,Sepal.Length,Petal.Length)
dplyr_big_iris_tmp<-filter(dplyr_big_iris_tmp1,Petal.Length>=6)
head(dplyr_big_iris_tmp)

#Nested function
dplyr_big_iris_nest<-filter(select(iris,Species,Sepal.Length,Petal.Length),Species=="virginica")
head(dplyr_big_iris_nest)

#Pipes
dplyr_big_iris_pipe<-select(iris,Species,Sepal.Length,Petal.Length) %>%
  filter(Species=="virginica")
head(dplyr_big_iris_pipe)

## ----aggregate_examp-----------------------------------------------------
#Chained with Pipes
group_by(iris,Species)%>%
  summarize(mean(Sepal.Length),
            mean(Sepal.Width),
            mean(Petal.Length),
            mean(Petal.Width))

## ----arrange_example-----------------------------------------------------
#dplyr provides its own object type, tbl that has lots of nice properties
mtcars_tbl <- as.tbl(mtcars)
#ascending order is default
arrange(mtcars_tbl,mpg)
#descending
arrange(mtcars_tbl,desc(mpg))
#multiple columns: most cyl with best mpg at top
arrange(mtcars_tbl,desc(cyl),desc(mpg))

## ----slice_example-------------------------------------------------------
#grab rows 3 through 10
slice(mtcars_tbl,3:10)

## ----mutate_example------------------------------------------------------
mutate(mtcars_tbl,kml=mpg*0.425)

## ----rowwise_examp-------------------------------------------------------
#First a dataset of temperatures, recorded weekly at 100 sites.
temp_df<-data.frame(id=1:100,week1=runif(100,20,25), week2=runif(100,19,24), 
                    week3=runif(100,18,26), week4=runif(100,17,23))
head(temp_df)
#To add row means to the dataset, without the ID
temp_df2<-temp_df %>% 
  rowwise() %>% 
  mutate(site_mean = mean(c(week1,week2,week3,week4)))
head(temp_df2)

################################################################################
# lessons//04_viz.R
################################################################################
## ----plot_examp----------------------------------------------------------
plot(mtcars$hp,mtcars$qsec)

## ----plot_examp_2--------------------------------------------------------
plot(mtcars$hp,mtcars$qsec,main="Changes in Quartermile time as function of horsepower",
     xlab="Total Horsepower",ylab="Quartermile Time (secs)")

## ----pairs_examp---------------------------------------------------------
plot(iris, main="Iris Pairs Plot")

## ----abline_examp--------------------------------------------------------
plot(iris$Petal.Width,iris$Petal.Length, main="Petal Dimensions")
#horizontal line at specified y value
abline(h=4)
#a vertical line
abline(v=1.5)
#Line with a slope and intercept
abline(0,1)

## ----abline_examp_lm-----------------------------------------------------
plot(iris$Petal.Width,iris$Petal.Length, main="Petal Dimensions")
#abline accepts a liner model object as input
#linear model is done with lm, and uses a formula as input
abline(lm(Petal.Length~Petal.Width,data=iris))

## ----boxplot_examp-------------------------------------------------------
boxplot(iris$Petal.Length, main="Boxplot of Petal Length",ylab="Length(cm)")

## ----boxplot_grps_examp--------------------------------------------------
boxplot(iris$Petal.Length~iris$Species, main="Boxplot of Petal Length by Species",ylab="Length(cm)")

## ----base_hist_examp-----------------------------------------------------
hist(iris$Sepal.Length)
hist(airquality$Temp,breaks=10)

## ----cdf_examp-----------------------------------------------------------
aq_temp_ecdf<-ecdf(airquality$Temp)
plot(aq_temp_ecdf)

## ----ggplot_install, eval=FALSE------------------------------------------
install.packages("ggplot2")
library("ggplot2")

## ----ggplot_examp--------------------------------------------------------
# aes() are the "aesthetics" info.  When you simply add the x and y
# that can seem a bit of a confusing term.  You also use aes() to 
# change color, shape, size etc. of some items 
iris_gg<-ggplot(iris,aes(x=Petal.Length,y=Petal.Width))

## ----points_examp--------------------------------------------------------
#Different syntax than you are used to
iris_gg + 
  geom_point()

#This too can be saved to an object
iris_scatter<-iris_gg +
                geom_point()

#Call it to create the plot
iris_scatter

## ----iris_labels---------------------------------------------------------
iris_scatter<-iris_scatter +
                labs(title="Iris Petal Morphology Relationship",
                     x="Petal Length", y="Petal Width")
iris_scatter

## ----iris_colors---------------------------------------------------------
iris_scatter<- iris_scatter +
                geom_point(aes(color=Species, shape=Species),size=5)
iris_scatter

## ----iris_loess----------------------------------------------------------
iris_scatter_loess<-iris_scatter +
                geom_smooth()
iris_scatter_loess

## ----iris_lm-------------------------------------------------------------
iris_scatter_lm<-iris_scatter +
                  geom_smooth(method="lm")
iris_scatter_lm

## ----iris_lm_groups------------------------------------------------------
iris_scatter_lm_group<-iris_scatter+
                        geom_smooth(method="lm", 
                                    aes(group=Species))
iris_scatter_lm_group

## ----iris_lm_color-------------------------------------------------------
iris_scatter_lm_color<-iris_scatter+
                        geom_smooth(method="lm", 
                                    aes(color=Species))
iris_scatter_lm_color

## ----gg_box_examp--------------------------------------------------------
ggplot(iris,aes(x=Species,y=Sepal.Width)) +
  geom_boxplot()

## ----gg_hist_examp-------------------------------------------------------
ggplot(iris,aes(x=Sepal.Width))+
  geom_histogram(binwidth=0.25)

## ----gg_bar_examp2-------------------------------------------------------
iris_species_mean<-group_by(iris,Species) %>%
                    summarize(mean_pl=mean(Petal.Length))
iris_meanpl_bar<-ggplot(iris_species_mean,aes(x=Species,y=mean_pl))+
  geom_bar(stat="identity")
iris_meanpl_bar

## ----themes_examp--------------------------------------------------------
scatter_p<-ggplot(iris,aes(x=Petal.Width,y=Petal.Length)) +
              geom_point(aes(colour=Species, shape=Species))
scatter_p

## ----themes_examp_custom-------------------------------------------------
scatter_p_base<-scatter_p + 
  theme(panel.background = element_blank(), 
        panel.grid = element_blank(),
        panel.border = element_rect(fill = NA),
        text=element_text(family="Times",colour="red",size=24))
scatter_p_base

## ----themes_examp_stock--------------------------------------------------
scatter_p + theme_bw()
scatter_p + theme_classic()

## ----themes_examp_polished-----------------------------------------------
#Now Let's start over, with some new colors and regression lines
scatter_polished <- ggplot(iris,aes(x=Petal.Width,y=Petal.Length)) +
              geom_point(aes(colour=Species, shape=Species)) +
              stat_smooth(method="lm", aes(colour=Species)) +
              scale_colour_manual(breaks = iris$Species,
                                  values= c("steelblue1",
                                            "sienna",
                                            "springgreen3")) + 
              theme_classic(18,"Times") +
              theme(text=element_text(colour="slategray")) +
              labs(title="Iris Petal Morphology Relationship",
                     x="Petal Length", y="Petal Width")
              

scatter_polished 

## ----ggsave_examp, eval=FALSE--------------------------------------------
## #Save as jpg, with 600dpi, and set width and height
## #Many other options in the help
ggsave(plot=scatter_polished,
       file="Fig1.jpg",dpi=600,width=8, heigh=5)
## #Save as PDF
ggsave(plot=scatter_polished,
       file="Fig1.pdf")

## ----facet_grid_example--------------------------------------------------
#From the examples in H. Wickham. ggplot2: elegant graphics for data analysis. 
#Springer New York, 2009. 
#In particular the facet_grid help.
p <- ggplot(mtcars, aes(mpg, wt)) + geom_point()
# With one variable
p + facet_grid(cyl ~ .)
# With two variables
p + facet_grid(vs ~ am)

## ----facet_grid_nla, warning=FALSE, message=FALSE------------------------
tp_chla <- ggplot(nla_wq,aes(x=log10(PTL),y=log10(CHLA))) + geom_point()

tp_chla + facet_grid(RT_NLA ~ .)

tp_chla +
  stat_smooth() +
  facet_grid(RT_NLA ~ LAKE_ORIGIN)

