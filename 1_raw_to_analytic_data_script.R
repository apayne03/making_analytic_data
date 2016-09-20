library(tidyverse)

raw_data <- read_csv(file="rawData.csv")

str(raw_data)

#View(raw_data)

raw_data <- read_csv(file = "rawData.csv",na=c("","NA","-999","-888"))

categorical_variables <- select(raw_data, group, gender)

categorical_variables$group <- as.factor(categorical_variables$group)

categorical_variables$gender <- as.factor(categorical_variables$gender)
levels(categorical_variables$gender) <- list("Male"=1,"Female"=2)

affective_commitment_items <- select (raw_data, AC1, AC2, AC3, AC4, AC5)
agreeableness_items <- select (raw_data, A1, A2, A3, A4, A5)
extroversion_items <-select (raw_data, E1, E2, E3, E4, E5)

#install.packages("psych",dep=T)

psych::describe(extroversion_items)

psych::describe(agreeableness_items)

agreeableness_items

is_bad_value <- agreeableness_items<1 | agreeableness_items>5

#View(is_bad_value)

agreeableness_items[is_bad_value] <- NA

#View(agreeableness_items)

affective_commitment_items

is_bad_value <- affective_commitment_items<1 | affective_commitment_items>7

#View(affective_commitment_items)

affective_commitment_items[is_bad_value] <- NA

#View(affective_commitment_items)

#View(agreeableness_items)

agreeableness_items <- mutate(agreeableness_items,A5=6-A5)

#View(affective_commitment_items)

affective_commitment_items <- mutate(affective_commitment_items,AC4=8-AC4)
affective_commitment_items <- mutate(affective_commitment_items,AC5=8-AC5)

#View(affective_commitment_items)

agreeableness <- psych::alpha(as.data.frame(agreeableness_items),check.keys=FALSE)$scores
extroversion <- psych::alpha(as.data.frame(extroversion_items),check.keys = FALSE)$scores
affective_commitment <- psych::alpha(as.data.frame(affective_commitment_items),check.keys = FALSE)$scores

analytic_data <- cbind(categorical_variables,agreeableness,extroversion,affective_commitment)

analytic_data
