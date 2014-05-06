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
pdf("myplot.pdf")
with(faithful, plot(eruptions, waiting))
title("Faithful Geyser Data")
dev.off()

#########
with(faithful, plot(eruptions, waiting, col="blue", pch=20))
title("Faithful Geyser Data")
dev.copy(device=png, "myplot.png")
dev.off()
