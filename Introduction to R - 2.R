# ------------------------------------------------------------- #
# Introduction to R (2): Data frames  #
# Author: Guillem Perdigó                                       #
# Ubiqum Code Academy                                           #
# Created - 03.06.2019                                          #
# ------------------------------------------------------------- #

# Read the README.md file before using this script.
# This script follows "Introduction to R.R"

# Part 1. Creating a data frame ----

# What 2 dimensional data structures are there in R?

# Matrix: rows and columns, everything is a number. Light weight :)
# Dataframe: each column can be of a different type. Much more useful!

# Write this in the whiteboard and ask students to create it in R as a 
# dataframe called df: 
#  v1 v2 v3   v4
#  1  5  9  hey
#  2  6 10   ho
#  3  7  -  lets
#  4  8 11   go

# Dataframes are just sequences of vectors of the same length, 
# so we can start by creating the vectors (columns):
v1 <- c(1, 2, 3, 4)
v2 <- c(5, 6, 7, 8)
v3 <- c(9, 10, NA, 11)
v4 <- c("hey", "ho", "lets", "go")

df <- data.frame(
  v1,
  v2,
  v3,
  v4
)
df

# Let's use the basic functions to explore a dataframe
str(df)
summary(df)
names(df)
dim(df)

# Part 2. Selecting from a data frame ----

# How do you select the first column?
df[1]
df[,1]
df$v1

# How do you select the first row?
df[1,]

# How do you select the element on the first row and fourth column?
df[1,4]
df$v4[1]

# How do you delete the fourth column?
df[4] <- NULL
df$v4 <- NULL
df

# Part 3. Basic operations & transformations ----

# Sum all the elements in the first column
sum(df$v1)

# Sum all the elements the first 2 columns
sum(df[1:2]) # we get the sum of all of them
colSums(df[1:3]) # we get the sum for each column

# Try colSums for the first 3 columns
# Why do you get NA? How do you ignore the NA value? Explore arguments of colSums.
colSums(df[1:3], na.rm = TRUE)

# Create a new column, v5, that is the product of columns v1 and v2
df$v5 <- df$v1 * df$v2

# Create a new dataframe called df_2 like this (draw it in the whiteboard):

#col_1  #col_2
# 3       60
# 8       21
# 1       99
# 4       52

df_2 <- data.frame(
  col_1 = c(3, 8, 1, 4),
  col_2 = c(60, 21, 99, 52)
)

# Both our df and df_2 have the same number of rows. That means that we can
# bind them together. In R, we do this with the function cbind(). Create a dataframe
# called df_3 that contains all the columns from df and df_2
df_3 <- cbind(df, df_2)
df_3

# We'll create a dataframe of the same number of columns (6) and 50 rows to see how
# can we bind dataframes vertically. We'll generate random numbers to make it 
# quickly.

df_4 <- data.frame(replicate(6,sample(0:100,50,rep=TRUE)))
df_4

# Let's use rbind() to "append" this dataframe to our df_3
df_5 <- rbind(df_3, df_4)

# Whoops, did you see that error? Names of columns do not match! Let's fix that.
colnames(df_4) <- c("v1", "v2", "v3", "v5", "col_1", "col_2")
colnames(df_4) <- names(df_3) # same but quicker

df_5 <- rbind(df_3, df_4) # now it works :)

# Part 4: Subsetting ----

# Let's subset this dataframe using subset(). Read the help page for this function.


# We're going to "export" this dataframe into a csv file so we can send it or open
# it with other programs. Try to find on the internet how to do this!
write.csv(df_5, "df_5.csv", row.names = FALSE)




