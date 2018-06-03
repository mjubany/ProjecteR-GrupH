install.packages("dplyr")
install.packages("lubridate") #Per treballar amb dates

library(dplyr)
library(lubridate)
library(ggplot)

exploitsData <- read.csv(file="C:/Users/Carles/Documents/exploitDataSet.csv", header=TRUE, sep=",")

dataFiltered <- dplyr::select(exploitsData, date, author)

dataFiltered <- dplyr::mutate(dataFiltered, date = year(date))

dataFiltered %>% dplyr::group_by(dataFiltered$date) %>%
  dplyr::summarise(n = n())


yearsLabel <- min(year(dataFiltered$date)):max(year(dataFiltered$date))

yearsTable <- table(yearsLabel) - 1

for (exploitDate in dataFiltered$date) {
  yearsTable[names(yearsTable)==year(exploitDate)] <- yearsTable[names(yearsTable)==year(exploitDate)] + 1
}


# for (row in 1:nrow(dataFiltered)) {
#   #author <- dataFiltered[row, "author"]
#   date  <- dataFiltered[row, "date"]
#   
#   temp <- dplyr::count(dataFiltered, author, date)
#   
#   numDevelopers <- nrow(dplyr::filter(temp, date == date))
#   
#   yearsTable[names(yearsTable) == date] <- numDevelopers
#   
#   #yearsTable[names(yearsTable)==year] <- yearsTable[names(yearsTable)==year]
# }

for (year in yearsLabel) {
  date  <- dataFiltered[row, "date"]
  
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
