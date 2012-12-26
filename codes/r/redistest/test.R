#!/usr/bin/Rscript
library(rredis)
redisConnect()

time_start <- 1354885239
counter_limit <- 9999

a <- rep(NA,counter_limit*2)
m <- matrix(a,ncol=2)
keys <- c(1:counter_limit)

for ( i in (1:counter_limit) ) {
  key <- paste("kevin:",(i+time_start),sep="")
  keys[i] <- key
}

n <- redisMGet(keys)

for ( i in (1:counter_limit) ) {
  m[i,1] <- i
  m[i,2] <- n[[i]]
}

plot_colors <- c("red")
png(filename="figure.png", height=500, width=800, bg="black")
par(mar=c(5.2, 4.8, 0.2, 0.2))
plot(m, type="l", col=plot_colors[1], col.axis="white", 
   col.lab="white", col.main="white", col.sub="white",
   ylim=range(0,10), axes=T, ann=T, xlab="Time",
   ylab="Total", cex.lab=2, lwd=3)
