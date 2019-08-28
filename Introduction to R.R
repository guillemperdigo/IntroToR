# --------------------------------------------------------- #
# Introduction to R: Data types, samples & basic functions  #
# Author: Guillem Perdigó                                   #
# Version 1 - 03.06.2019                                    #
# --------------------------------------------------------- #

# This script should be used by the mentor as a guide to ask students type code,
# and comment this code in a whiteboard

# Some of this exercises have been inspired by this book:
# https://rstudio-education.github.io/hopr/

# Part 1: data types & vectors ####

# Ask students what data types are there in R. 
# Make them create an object from each type.

# character
myCh <-
  "We cannot teach people anything; we can only help them discover it within themselves. - Galileo Galilei"
class(myCh)
# numeric
myNum <- 3.14159
class(myNum)
# integer
myInt <- 1:10
myInt
class(myInt)
# logical
myLogical <- TRUE
class(myLogical)
# complex
myCmplx <- 1 + 4i
class(myCmplx)
# raw - we don't need it for now!


# Ask to students: What is a vector in R?
# A succession of elements of the same data type (technically this is an atomic vector)
# Ask students to create a vector and check its class.
# We create vectors using the function c()
a <- c(1, 2, 3, 4)
a
class(a) # We get the class of its elements 

# Ask students: how do you get the third element of the vector?
a[3]
# Ask students: how do you get the elements between the 2nd and the 4th?
a[2:4]
# Ask students: how do you get all elements but the 3rd?
a[-3]
# Ask students: how do you get all elements bigger than 2?
a[a>2]

# We can use some functions to explore this vector. Ask students to get:
length(a) # the number of elements in vector
sum(a) # the sum of all elements in vector
mean(a) # the mean
median(a) # the median
sd(a) # the standard deviation

# We can convert the elements of this vector from numbers into characters:
a_ch <- as.character(a)

# Ask students: what happens if there's a character mixed up with the numbers of my vector?
b <- c("a", 3, 4) # numbers get coerced into characters
class(b)

# What if we want our vector to store "a" as character and 3 & 4 as numbers?
c <- list("a", 3, 4) # we create a list!
c
# Lists are heterogenuous: can contain anything inside, like vectors... or even other lists!
myList <- list(1, "a", c(1, 2, 3), list("a", "b", 4)) 
myList

# Part 2: samples ####

# Let's learn about samples! We will simulate a die: ask students to create a vector with a 
# sequence of numbers from 1 to 6, and use sample() with size 1 to "roll" it!
d <- c(1:6)
sample(d, size = 1)

# Now roll the die 6 times!
sample(d, size = 6) # wrong: isn't it strange that no number got repeated? Talk with students about replacement
sample(d, size = 6, replace = TRUE) # right
replicate(6, sample(d, size = 1)) # right

# What if we want to reproduce your throws? Set a seed!
set.seed(1234)

# Roll the die again 6 times and calculate the sum of all your roll. 
sum(sample(d, size = 6, TRUE)) # 23 on R 3.5 (3.6 has a different Random Generator Algorithm)

# Now we will simulate coin flips: create a vector with the two sides of a coin
coins <- c("Head", "Tails")

# Flip the coin 200 times. Remember to use a seed!
set.seed(4321)
flips <- sample(coins, 200, replace = TRUE)

# How many heads and how many tails did you get?
table(flips)

# Part 2.1. System time (optional) ####

# Repeat the experiment of flipint the coin 10000 times
set.seed(888)
flips <- replicate(10000, sample(coins, 500, replace = TRUE))
# Did you notice how your computer took some time to compute that?
# You can know how much time your computer spends doing tasks by doing this:
start_time <- Sys.time()
flips <- replicate(10, sample(coins, 500, replace = TRUE))
end_time <- Sys.time()
end_time - start_time

system.time ({replicate(10000, sample(coins, 5, replace = TRUE)) })

# Part 3. Data frames ####

# What about 2 dimensional data structures? 

# Matrix: rows and columns, everything is a number. Light weight :)
# Dataframe: each column can be of a different type. Much more useful!

# Let's create this dataframe (write it in the whiteboard): 
#  v1 v2 v3   v4
#  1  5  9  hey
#  2  6 10   ho
#  3  7  -  lets
#  4  8 11   go

# Dataframes are just sequences of vectors of the same length, 
# so we can start by creating the vectors:
v1 <- c(1, 2, 3, 4, 1, 1, 4)
v2 <- c(5, 6, 7, 8, 5, 7, 1)
v3 <- c(9, 10, NA, 11, 6, 8, 1)
v4 <- c("hey", "ho", "lets", "go", "one", "two", "three")

df <- data.frame(
  v1,
  v2,
  v3,
  v4
)
df

# How do you select the first column?
df[1]
df$v1

# How do you select the first row?
df[1,]

# How do you select the element on the first row and fourth column?
df[1,4]

# How do you delete a column?
df[2] <- NULL
df

# Sum all the elements the first 2 columns
colSums(df[1:2], na.rm = T)

hist(df$v1)


# Part 4. functions ####

a <- 3

hate_function <- function(name){
  a <- "very much"
  return(paste(name, "I hate you", a))
}

hate_function("Trump")
