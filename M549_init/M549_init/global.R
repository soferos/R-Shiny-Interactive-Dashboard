# Screen 459.3: A Different App Structure
# In the line below, import the shiny library so that it's available
# in both ui.R and server.R
library(shiny)
library(tidyverse)

# Screen 459.5: Data Introduction And Cleaning
# In the lines below, import the hospital_los.csv file and process it according
# to the screen instructions. Categorical variables should be converted into 
# factor

heart <- read_csv('www/heart.csv')
glimpse(heart)
#The following columns seem to be categorical:
# sex, cp, restecg, exang, ca, thal.

heart$sex <- as.factor(heart$sex)
heart$cp <- as.factor(heart$cp)
heart$restecg <- as.factor(heart$restecg)
heart$exang <- as.factor(heart$exang)
heart$ca <- as.factor(heart$ca)
heart$thal <- as.factor(heart$thal)

