# install.packages('ggplot2')
# library(ggplot2)

exploitsData <- read.csv(file="C:/Users/Carles/Documents/exploitDataSet.csv", header=TRUE, sep=",")

authors <- exploitsData$author

authorsTable <- table(authors)
authorsDistinct <- unique(authors)

topTen <- c()

for (author in authorsDistinct) {
  #print(author)
  topTen <- c(topTen, authorsTable[names(authorsTable)==author])
}

orderedTopTen <- sort(topTen, decreasing = TRUE)

pieVector <- head(orderedTopTen, n = 10)

top10labels <- names(pieVector)

piepercent <- round(100*pieVector/sum(pieVector), 1)

pie(pieVector, labels = piepercent, main = "Top 10 exploit developers",col = rainbow(length(pieVector)))
legend("topright", top10labels, cex = 0.8,
      fill = rainbow(length(pieVector)))
# 
# df <- data.frame(
#   group = top10labels,
#   value = pieVector
# )
# 
# bp<- ggplot(df, aes(x="", y=value, fill=group))+
#   geom_bar(width = 1, stat = "identity")
# 
# pie <- bp + coord_polar("y")

