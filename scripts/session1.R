#LearningR
#Friday, April 12, 2019

#initialize cats data.frame
cats <- data.frame(coat = c("calico", "black", "tabby"), 
                   weight = c(2.1, 5.0,3.2), 
                   likes_string = c(1, 0, 1))

write.csv(x= cats, file="data/feline.csv")

#an intentional error
cats$weight + cats$coat

#what is the data type?
typeof(cats$weight)

#what class is cats?
class(cats)

#vectors: declaring the vector, currently empty
#logicals
my_vector <- vector(length = 3)
my_vector

#another vector: character
another_vector <- vector(mode = "character", length = 3)
another_vector

#another exploratory command
str(another_vector)
str(cats$coat)
str(cats$weight)
str(cats$likes_string)

#make a new vector (coercion of variables, forces all to be character)
quiz_vector <- c(2,6,"3")
quiz_vector

#forcing example
character_vector_example <- c('0', '2', '4')
character_vector_example
typeof(character_vector_example)

character_coerced_to_numeric <- as.numeric(character_vector_example)
character_coerced_to_numeric

#useful coercion
cats$likes_string
cats$likes_string <- as.logical(cats$likes_string)
cats$likes_string

#appending
ab_vector <- c('a', 'b')
combine_example <- c(ab_vector, 'SWC')
combine_example

#populate quickly: my series is filled with numbers 1-10
mySeries <- 1:10
mySeries

#adding age of cats to the dataframe as a column
age <- c(2,3,5)
cats
cbind(cats, age)

#adding a row
nrow(cats) #tells you number of rows
newRow <- list("tortoiseshell", 3.3, TRUE, 9)  #make a variable for it to live in
cats <- rbind(cats, newRow)  #but tortoiseshell is not a known level in the coats factor
cats
levels(cats$coat) 
levels(cats$coat) <- c(levels(cats$coat), 'tortoiseshell')
levels(cats$coat)
na.omit(cats) #removes a row
cats <- na.omit(cats)
cats


#gapfinder demo





  