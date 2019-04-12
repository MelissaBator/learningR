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



  