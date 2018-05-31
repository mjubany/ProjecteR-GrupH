install.packages("lubridate") #Per treballar amb dates

exploitsData <- read.csv(file="C:/Users/Carles/Documents/exploitDataSet.csv", header=TRUE, sep=",")
cveData <- read.csv(file="C:/Users/Carles/Documents/allitems.csv", header=TRUE, sep=",")
vector <- c(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1)

for (row in 1:nrow(exploitsData)) {
  exploitDate <- format.Date(exploitsData[row, "date"])
  
  #if (exploitDate > format.Date("2010-01-01") && exploitDate < format.Date("2010-05-01"))
  #{
  #}
  if(year(exploitDate) == 2003){
    vector[1] <- vector[1] + 1
  }else if(year(exploitDate) == 2004){
    vector[1] <- vector[1] + 1
  }else if(year(exploitDate) == 2005){
    vector[1] <- vector[1] + 1
  }else if(year(exploitDate) == 2006){
    vector[1] <- vector[1] + 1
  }else if(year(exploitDate) == 2007){
    vector[1] <- vector[1] + 1
  }else if(year(exploitDate) == 2008){
    vector[1] <- vector[1] + 1
  }else if(year(exploitDate) == 2009){
    vector[1] <- vector[1] + 1
  }else if(year(exploitDate) == 2010){
    vector[1] <- vector[1] + 1
  }else if(year(exploitDate) == 2011){
    vector[1] <- vector[1] + 1
  }else if(year(exploitDate) == 2012){
    vector[1] <- vector[1] + 1
  }else if(year(exploitDate) == 2013){
    vector[1] <- vector[1] + 1
  }else if(year(exploitDate) == 2014){
    vector[1] <- vector[1] + 1
  }else if(year(exploitDate) == 2015){
    vector[1] <- vector[1] + 1
  }else if(year(exploitDate) == 2016){
    vector[1] <- vector[1] + 1
  }else if(year(exploitDate) == 2017){
    vector[1] <- vector[1] + 1
  }else if(year(exploitDate) == 2018){
    vector[1] <- vector[1] + 1
  }
  vector
    #print(exploitDate)
}


#MyData2[MyData2[, "id"]>40000, ]

