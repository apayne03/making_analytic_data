library(tidyverse)

raw_data <- read_csv(file="rawData.csv")

str(raw_data)

View(raw_data)

raw_data <- read_csv(file = "rawData.csv",na=c("","NA","-999","-888"))


#Handling categorical variables to factors

categorical_variables <- select(raw_data, group, gender)

categorical_variables$group <- as.factor(categorical_variables$group)

categorical_variables$gender <- as.factor(categorical_variables$gender)
levels(categorical_variables$gender) <- list("Male"=1,"Female"=2)


#Handling item data

affective_commitment_items <- select (raw_data, AC1, AC2, AC3, AC4, AC5)
agreeableness_items <- select (raw_data, A1, A2, A3, A4, A5)
extroversion_items <-select (raw_data, E1, E2, E3, E4, E5)

install.packages("psych",dep=T)

psych::describe(extroversion_items)

psych::describe(agreeableness_items)
