R Notes
=======

Package Mgmt/Redis
------------------
$ R
> help("INSTALL")
> INSTALL rredis
> library(rredis)
> redisConnect()
> redisIncr("kevin")
> print(redisGet("kevin"))

Matricies
---------
# allocate
names <- c("kevin", "benjamin", "melissa")
limit <- 10
o <- matrix(NA, ncol=length(names), nrow=limit)

# assign one position: ele[row, col]
o[10,1] <- 1

# assign one col
o[,1] <- 2

# assign one row
o[1,] <- 3

Graphing (barplot)
------------------
> a <- c(10000, 40000, 30000, 20000, 50000, 70000, 30000)
> names(a) <- c("day 1","day 2","day 3","day 4","day 5","day 6","day 7")
> barplot(a,col=c("red","orange","yellow","green","blue","purple","black"))
> m <- mean(a)
> dev <- sd(a)
> abline(h=m)
> abline(h=m+dev)
> abline(h=m-dev)

Reading Data (data.frame)
-------------------------
va <- c(1,2,3)
vb <- c(2,3,4)
vc <- c("a","b","c")
# put three vectors into a data frame, headers will be var names
vf <- data.frame(va,vb,vc)
print(vf)
print(vf$va)

# read into a frame from csv and tab-delim files
vf <- read.csv("data.csv")
vf <- read.table("data.txt", sep="\t", header=T)

Plotting Multiplve Vectors
--------------------------
aa <- c(1,2,3,4,5,6) # x values
bb <- c(9,8,7,5,4,3) # y values
cc <- c(6,5,4,3,2,1) # y values
dd <- rowMeans(cbind(bb,cc), na.rm=T) # create mean of y values
print(mm[,1]) # prints aa
print(mm[,2]) # prints bb
plot(aa,bb,col="green",xlim=c(1,6),ylim=c(0,10)) # plots x = aa, y = bb
points(aa,cc,col="yellow") # plots x = aa, y = cc
points(aa,dd,col="orange") # plots x = aa, y = dd (mean value)

Boxplot
-------
aa <- c(9,8,7,5,4,3) # y values
bb <- c(6,5,4,3,2,1) # y values
mm <- cbind(aa,bb)
boxplot(mm,range=0)
