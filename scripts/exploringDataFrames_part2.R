#Exploring Data Frames
#Episode 5 - Exploring Data Frames (cont.)
#Sharon Solis Instructor--April 12,2019

#explore gapminder data set
#gapminder was downloaded in ep2: Project Management

#READ in gapminder.csv
gapminder <- read.csv("data/gapminder_data.csv")

#visually inspect the imported dataset
#click on gapminder in environment window

#structure of gapminder 
#remember data classes: integer, number, factor
str(gapminder)

#Summary
#Factor columns are summarized by the number of items in each level
#character columns are summarized by its length, class, and mode
summary(gapminder)

#summary of gapminder by country column
summary(gapminder$country)

#object type
#what is the object type in the year column?
typeof(gapminder$year)

#Dimensions of data set
# LENGTH (number of columns)
length(gapminder)

#type of entire gapminder data set
#list of 8 columnds
typeof(gapminder)

#NUMBER OF ROWS
nrow(gapminder)

#NUMBER OF COLUMNS
ncol

#DIMENSIONS (first rows, then columns)
dim(gapminder)

#COLUMNS Names or Titles
colnames(gapminder)

#previewing our dataset
#HEAD (remember from bash)
#preview first few lines
head(gapminder)
head(gapminder, n=15) #previews first 15 lines

#preview last few lines
tail(gapminder)
tail(gapminder, n=12) #previews last 12 lines

#preview the middle
gapminder[850:870,]  #gapminder[parameters of columns to view,]







