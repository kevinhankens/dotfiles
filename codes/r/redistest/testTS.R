#!/usr/bin/Rscript
library(rredis)
redisConnect()

time_start <- 1354885239
counter_limit <- 9999

a <- rep(NA,counter_limit*2)
keys <- c(1:counter_limit)

png(filename="testTS.png", height=500, width=800, bg="black")

names = c("kevin:", "benjamin:")
colors = c("green", "red")

par(mar=c(5.2, 4.8, 0.2, 0.2), col="white", col.axis="white", 
    col.lab="white", col.main="white", col.sub="white")

for ( k in (1:(length(c)+1)) ) {
  for ( i in (1:counter_limit) ) {
    key <- paste(names[k],(i+time_start),sep="")
    keys[i] <- key
  }

  m <- ts(redisMGet(keys), start=time_start, end=time_start+counter_limit)
  plot(m, col=colors[k], xlab="Time",
    ylab="Total", cex.lab=2, lwd=3,
    ylim=range(0,10), axes=T, ann=T)
  par(new=TRUE)
}


#plot_colors <- c("red")
#par(mar=c(5.2, 4.8, 0.2, 0.2))
#plot(m, type="l", col=plot_colors[1], col.axis="white", 
   #col.lab="white", col.main="white", col.sub="white",
   #ylim=range(0,10), axes=T, ann=T, xlab="Time",
   #ylab="Total", cex.lab=2, lwd=3)
