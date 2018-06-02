exploitsData <- read.csv(file="C:/Users/Carles/Documents/exploitDataSet.csv", header=TRUE, sep=",")

authors <- exploitsData$author


authorsTable <- table(authors)
authorsDistinct <- unique(authors)

topTen <- c()

for (author in authorsDistinct) {
  #print(author)
  topTen <- c(topTen, authorsTable[names(authorsTable)==author])
}



