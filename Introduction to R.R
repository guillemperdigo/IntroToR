# ------------------------------------------------------------- #
# Introduction to R (1): Data types, samples & basic functions  #
# Author: Guillem Perdigó                                       #
# Ubiqum Code Academy                                           #
# Created - 03.06.2019                                          #
# ------------------------------------------------------------- #

# Read the README.md file before using this script.

# Part 1: data types & vectors ----

# Ask students what data types are there in R. 
# Make them create an object from each type and assign it to a variable, using the 
# assignment operator "<-". We can use "=" for that but the convention is to use
# "<-", and conventions make code more readable!

# check the class of the objects you created using "class()"

# character
myCh <-
  "We cannot teach people; we can only help them discover themselves. - Galileo Galilei"
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

# What is a vector in R?
# A succession of elements of the same data type (technically called an "atomic vector")
# Ask students to create a vector of numbers (with decimals) between 0 and 10,
# and check its class. We create vectors using the function c()
a <- c(1.2, 2.4, 3.1, 4, 4, 4.8, 5.9)
a
class(a) # We get the class of its elements 

# Selecting elements from a vector is a very important skill. To do the following,
# students should check the cheat sheet.

# how do you get the third element of the vector?
a[3]
# how do you get the elements between the 2nd and the 4th?
a[2:4]
# how do you get all elements but the 3rd?
a[-3]
# how do you get all elements bigger than 2?
a[a>2]
# how do you get all elements equal to 4?
a[a==4]

# We can use some functions to explore this vector. Ask students to get:
length(a) # the number of elements in vector
sum(a) # the sum of all elements in vector
mean(a) # the mean
median(a) # the median
max(a) # the biggest value
min(a) #the smallest value
sd(a) # the standard deviation
round(a) # all numbers rounded

# You can "nest" all these functions:
round(mean(a))

# We can convert the elements of this vector from numbers into characters:
a_ch <- as.character(a) # we give it another name to avoid overwriting it
a_ch # do you notice the quote marks?

# Ask students: what happens if there's a character mixed with the numbers of my vector?
b <- c("a", 3, 4) 
class(b) # numbers get coerced into characters

# What if we want our vector to store "a" as character and 3 & 4 as numbers?
c <- list("a", 3, 4) # we can create a list!
c
# Lists are heterogenuous: can contain anything inside, like vectors or even other lists!
myList <- list(1, "a", c(1, 2, 3), list("a", "b", 4)) 
myList

# Part 2: samples ----

# Let's learn about samples! We will simulate a die: ask students to create a vector with
# a sequence of numbers from 1 to 6 and assign it to an object called "dice"
dice <- 1:6

# Use the function sample() to "roll" it one time.
# Check ?sample to understand how to use this function.
sample(x = d, size = 1)

# Try to capitalise the S of your argument "Size". Do you get an error?
# This is a typical error message that pops up when we did not write properly the 
# argument of a function. It also shows that R is case sensitive.

# Now roll the die 6 times!
sample(d, size = 6) # wrong
# Isn't it strange that no number got repeated? Discuss replacement with students
sample(d, size = 6, replace = TRUE) # right
replicate(6, sample(d, size = 1)) # right (we can do the same thing in different ways!)

# What if we want to reproduce your throws? Set a seed!
set.seed(1234)

# Roll the die again 6 times and calculate the sum of all your roll. 
sum(sample(d, size = 6, TRUE)) #23 on R 3.5 (3.6 has a different Random Generator Algorithm)

# Now we will simulate coin flips: create a vector with the two sides of a coin
coins <- c("Head", "Tails")

# Flip the coin 200 times and assign the result to a variable called "flips". 
# Remember to use a seed!
set.seed(4321)
flips <- sample(coins, 200, replace = TRUE)

# How many heads and how many tails did you get?
table(flips)

# Part 2.1. System time (optional) ----

# Repeat the experiment of flipint the coin 10000 times
set.seed(888)
flips <- replicate(10000, sample(coins, 500, replace = TRUE))
# Did you notice how your computer took some time to compute that?
# You can know how much time your computer spends doing tasks by doing this:
start_time <- Sys.time()
flips <- replicate(10, sample(coins, 500, replace = TRUE))
end_time <- Sys.time()
end_time - start_time

# A more compact way to do the same
system.time ({replicate(10000, sample(coins, 5, replace = TRUE)) })

