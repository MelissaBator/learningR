#creating publication quality graphics with ggplot2
#april 12, 2019-- Sharon Solis- Instructor

#open gglot2 library
library(ggplot2)

#inititate new variable called gapminder, to read gapminder file
#in data folder
gapminder <- read.csv("data/gapminder_data.csv")

#visually inspect gapminder

#DATA Subsetting
#looking at row 1, column 1
gapminder[1,1]

#preview top few lines
head(gapminder)
#preview middle
gapminder[900:905,]
#preview end
tail(gapminder)

#call ggplot functionto create a new plot, GLOBAL option, applies
#to all layers
#aes - aesthetic properties, x and y locations; 
#looks for column headings
#geom - this layer tells how we want to visually represent data
#(geom_point - scatterplot)
#plot gdpPercap vs lifeExp [a base plot, then add layers]
ggplot(data = gapminder, aes(x= gdpPercap, y= lifeExp))

#with layers added
ggplot(data = gapminder, aes(x= gdpPercap, y= lifeExp)) +
  geom_point()

#show life expectancy change over time
ggplot(data = gapminder, aes(x= year, y= lifeExp)) +
  geom_point()

#add color: color the points by continent
ggplot(data = gapminder, aes(x= year, y= lifeExp, 
  color=continent)) + geom_point() 

#LAYERS
#scatterplot is hard to visualize change over time
#line plot instead
#add geom_line layer instead of geom_point
#by aesthetic draws line for each country
#added by=country witin aes()
ggplot(data = gapminder, aes(x= year, y= lifeExp, by= country, color=continent))
  geom_line()
  
#line plot for each continent
ggplot(data = gapminder, aes(x= year, y= lifeExp, color=continent)) +#base layer
  geom_line() +  #line plot layer
  geom_point() +  #scatter plot
  theme_bw()     #background

#draw points on top of lines, black color for points
#added aes parameter within geom_line
#not global, notice points are now black
ggplot(data = gapminder, aes(x= year, y= lifeExp, by= country)) +#base layer
  geom_line(aes(col= continent)) +  #line plot layer, with color added to continents
  geom_point()  #scatter plot layer

#TIP: change color of all lines to purple
ggplot(data = gapminder, aes(x= year, y= lifeExp, by= country)) +#base layer
  geom_line(color= "purple") +  #line plot layer, with color added to continents
  geom_point()  #scatter plot layer

#TIP: change color of all lines to blue
ggplot(data = gapminder, aes(x= year, y= lifeExp, by= country)) +#base layer
  geom_line(color= "blue") +  #line plot layer, with color added to continents
  geom_point()  #scatter plot layer

#Switch the order of point and line layers
ggplot(data = gapminder, aes(x= year, y= lifeExp, by= country)) +#base layer
  geom_point() + #scatter plot layer
  geom_line(color= "purple")  #line plot layer, with color added to continents
  
#TRANSFORMATION AND STATS
#overlay statistical models over data
#going back to scatterplot, similar to first plot
#color by continent
ggplot(data = gapminder, aes(x= gdpPercap, y= lifeExp, 
  color= continent)) + geom_point()

#Change scale of units on x axis using scale function
#log 10 function applies transformation to values of gdpPercap column
#each mult. of 10 now corresponds to an increase in 1 transformed unit
#GDP per capital of 1,000 is now 3 on x axis
#value of 10,000 corresponds to 4 on x axis
#value of 100,0000 corresponds to 5 on x axis
##
#using alpha function (Transparency)
#alpha - .5 makes points transparant 50%
ggplot(data = gapminder, aes(x= gdpPercap, y= lifeExp, color =
    continent)) + geom_point(alpha= .5)+ #change transparancy
    scale_x_log10() #changed the scale

#Alpha can also be mapped to a variable
#give different transparancy for each continent with
#geom_point(aes(alpha= continent))
ggplot(data = gapminder, aes(x= gdpPercap, y= lifeExp, color =
  continent)) + geom_point(aes(alpha= continent))+ #change transparancy
  scale_x_log10() #changed the scale

#geom_smooth, adding another layer here
#geom_smooth(method= "lm")
#lm = fit linear models
ggplot(data = gapminder, aes(x= gdpPercap, y= lifeExp)) + 
  geom_point() + #scatter layer
  scale_x_log10() + #changed the scale
  geom_smooth(method= "lm") #geom_smooth layer - linear model

#make line thicker
ggplot(data = gapminder, aes(x= gdpPercap, y= lifeExp)) + 
  geom_point() + #scatter layer
  scale_x_log10() + #changed the scale
  geom_smooth(method= "lm", col= "red", size= 1.5) #geom_smooth layer - linear model

#MOdify color and size of points on the point layer
ggplot(data = gapminder, aes(x= gdpPercap, y= lifeExp)) + 
  geom_point(col= "yellow", size= 1.5) + #scatter layer with color and size
  scale_x_log10() + #changed the scale
  geom_smooth(method= "lm") #geom_smooth layer - linear model

#Modify shape of points and size of points
ggplot(data = gapminder, aes(x= gdpPercap, y= lifeExp)) + 
  geom_point(shape= 2, size= 1) + #scatter layer
  scale_x_log10() + #changed the scale
  geom_smooth(method= "lm") #geom_smooth layer - linear model

#MULTI-PANEL Figures
#look at life expectancy over time across all countries
#split ubti multiple graphs side by side
##
#start by subsetting data
#use substr function to pull out part of character string
#letters that occur in positions start through stop
#(in this case, looking at first letter "A" or "Z")
#create new subset or substring called starts.with
starts.with <- substr(gapminder$country, start= 1, stop=1)

#operator %in% allows us to make multiple comparisons
#create new subset called az.countries, pulls out the As and Zs
az.countries <- gapminder[starts.with %in% c("A","Z"),] #remember comma at end

#initiate ggplot
#adding line plot layer
#facet wrap took the above formula as its argument, denoted by ~
#this tells R to draw panel for each unique value
#in country column of az.countries dataset
ggplot(data = az.countries, aes(x= year, y= lifeExp, color= continent)) + 
  geom_line() +
  facet_wrap(~country)


  