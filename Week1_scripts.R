polluation <- read.csv("avgpm25.csv", colClasses=c("numeric", "character", "factor", "numeric", "numeric"))

pm25 <- polluation$pm25

summary(pm25)

boxplot(pm25, col="blue")

hist(pm25, col="green") 
rug(pm25)

hist(pm25, col="green", breaks=100)
rug(pm25)

boxplot(pm25, col="blue")
abline(h=12, col="red")

hist(pm25, col="green")
rug(pm25)
abline(v=12, col="red", lwd=3)
abline(v=10, col="black", lwd=3)

table(polluation$region)
barplot(table(polluation$region), col="wheat", main="Number of Counties in each region")

boxplot(pm25 ~ region, data=polluation,  col="red" )

par(mfrow=c(2,1), mar=c(4,4,2,1))
hist(subset(x=polluation, subset=region=="east")$pm25, col="green", main="Eastern Counties", xlab="PM2.5")
hist(subset(x=polluation, subset=region=="west")$pm25, col="green", main="Western Counties", xlab="PM2.5")

par(mfrow=c(1,1), mar=c(6,6,3,3))
with(polluation, plot(latitude, pm25, col=region))
abline(h=12, col="red", lwd=2, lty=2)

par(mfrow=c(1,2), mar=c(5,4,2,1))
with(subset(x=polluation, subset=region=="east"), plot(latitude, pm25, main="Eastern Counties"))
with(subset(x=polluation, subset=region=="west"), plot(latitude, pm25, main="Western Counties"))


##################
library(lattice)
state <- data.frame(state.x77, region=state.region)
xyplot(Life.Exp ~ Income | region, data=state, layout=c(4,1))


#################
par("lty")
par("pch")
par("col")
par("mar")


colors()



library(datasets)
head(airquality)

with(airquality, plot(Wind, Ozone))
title(main="Ozone and Wind in NY City", xlab="Wind", ylab="Ozone")
with(subset(airquality, Month==5), points(Wind, Ozone, col="blue"))

##########
with(airquality, plot(Wind, Ozone, type="n", main="Ozone and Wind in NY City"))
with(subset(airquality, Month==5), points(Wind, Ozone, col="blue"))
with(subset(airquality, Month!=5), points(Wind, Ozone, col="red"))

#########
with(airquality, plot(Wind, Ozone, main="Ozone and Wind in NY City", pch=20))
model <- lm(Ozone ~ Wind, airquality)
abline(model, lwd=2, col="red")

#########
par(mfrow=c(1,2))
with(airquality, {
        plot(Wind, Ozone, main="Ozone and Wind in NY City", pch=20)
        plot(Solar.R, Ozone, main="Ozone and Solar Radiation in NY City", pch=20)
})

#########
par(mfrow=c(1,3), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(airquality, {
        plot(Wind, Ozone, main="Ozone and Wind in NY City", pch=20)
        plot(Solar.R, Ozone, main="Ozone and Solar Radiation in NY City", pch=20)
        plot(Temp, Ozone, main="Ozone and Temperature in NY City", pch=20)
        mtext("Ozone and Weather in NY City", outer=TRUE)
})

#########
par(mfrow=c(1,1))
pdf("myplot.pdf")
with(faithful, plot(eruptions, waiting))
title("Faithful Geyser Data")
dev.off()

#########
par(mfrow=c(1,1))
with(faithful, plot(eruptions, waiting, col="blue", pch=20))
title("Faithful Geyser Data")
dev.copy(device=png, "myplot.png")
dev.off()
