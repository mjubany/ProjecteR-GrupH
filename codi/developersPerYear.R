install.packages("dplyr")
library(dplyr)

install.packages("lubridate") #Per treballar amb dates
library(lubridate)

install.packages("ggplot2")
library(ggplot2)

#Modificar per el directori que calgui
setwd("C:/Users/Carles/source/repos/ProjecteR/ProjecteR-GrupH/")

exploitsData <- read.csv(file="./datasets/exploitDataSet.csv", header=TRUE, sep=",")

dataFiltered <- dplyr::select(exploitsData, date, author)

dataFiltered <- dplyr::mutate(dataFiltered, date = year(date))


yearsLabel <- min(dataFiltered$date):max(dataFiltered$date)

yearsTable <- table(yearsLabel) - 1

for (year in yearsLabel) {
  temp <- dplyr::count(dataFiltered, author, date)

  numDevelopers <- nrow(dplyr::filter(temp, date == year))

  yearsTable[names(yearsTable) == year] <- numDevelopers
}


df <- data.frame(anys=yearsLabel,
                 exploits=as.vector(yearsTable))

ggplot(data=df, aes(x=anys, y=exploits)) +
  geom_bar(stat="identity", fill="steelblue")+
  geom_text(aes(label=exploits), vjust=-0.3, size=3.5)+
  theme_minimal()
