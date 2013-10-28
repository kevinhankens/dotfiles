#!/usr/bin/Rscript
library(ggplot2)
library(rredis)
redisConnect()

time_start <- 1354885239
counter_limit <- 10

keys <- c(1:counter_limit)

png(filename="testTS2.png", height=500, width=800, bg="black")

names = c("kevin:", "benjamin:")
colors = c("green", "yellow", "orange")
output = matrix(NA, ncol=length(names), nrow=counter_limit)

par(mar=c(5.2, 4.8, 0.2, 0.2), col="white", col.axis="white", 
    col.lab="white", col.main="white", col.sub="white")

for ( k in (1:(length(names))) ) {
  for ( i in (1:counter_limit) ) {
    key <- paste(names[k],(i+time_start),sep="")
    keys[i] <- key
  }

  m <- ts(redisMGet(keys), start=time_start, end=time_start+counter_limit)
  #m <- data.frame(matrix(unlist(redisMGet(keys)), nrow=counter_limit))

  for ( i in (1:(counter_limit))) {
    output[i,k] <- as.integer(m[i])
  }
}
print(output)

qplot(1:counter_limit, output[,1], geom="line")
