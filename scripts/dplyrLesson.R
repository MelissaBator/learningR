#DPLYER with Mary Donovan
#dataframe maniplulating with dplyer
#April 12, 2019 END OF DAY so long

#install dplyr package
install.packages('tidyverse')
library(dplyr)

gapminder <- read.csv("data/gapminder_data.csv") #load gapminder data

str(gapminder)

#using select function to pick certain columns
#new dataframe, make a piple (use %)Take the gapminder data and pipe it to the function selecte
year_country_gdp <- gapminder %>% select(year,country,gdpPercap)
str(year_country_gdp)

#Using FILTER functino to pick certain rows
year_country_gdp_euro <- gapminder %>%
  filter(continent== "Europe") %>%
  select(year,country,gdpPercap)
str(year_country_gdp_euro)

#groupby function, Using dplyr to group variables
gdp_by_continent <- gapminder %>%
  group_by(continent) %>%
  summarize(mean_gdp= mean(gdpPercap)) #goal 1 row for each continent and the mean for the gdpPercap
gdp_by_continent #with the new columns called mean_gdp

#Calculate the average life expectancy per country
lifeExp_bycountry <- gapminder %>%
  group_by(country) %>%
  summarize(mean_lifeExp=mean(lifeExp))
#Which has the longest average life expectancy, 
#which has the shortest average life expectancy
lifeExp_bycountry %>%
  filter(mean_lifeExp == min(mean_lifeExp) | mean_lifeExp == max(mean_lifeExp))

#another way to figure this out, in steps
max(lifeExp_bycountry$mean_lifeExp) #(full column), max spits it out

#add another layer to label that max with its country
lifeExp_bycountry %>% filter(mean_lifeExp==max(mean_lifeExp))

#same for minimum, but use min function
lifeExp_bycountry %>% filter(mean_lifeExp == min(mean_lifeExp))

#integrating dplyr with ggplot
#group by country and year, take mean of lifeExp
gapminder %>% 
  group_by(country, year) %>%
  summarize(mean_lifeExp = mean(lifeExp)) %>%
  ggplot(aes(x=country,y=mean_lifeExp,color=country)) +
  geom_point()


