library(tidyverse)
ggplot2::msleep

#mamallian sleep dataset - some investigative visualisations..
# 1. Is there a correlation between brainweight and bodyweight? - YES.. so can use either to correlate with other sleep patterns
qplot(data=msleep , x=brainwt,xlab="Brain weight",ylab="Body weight", y=bodywt, geom="point",main="Brain weight vs body weight correlation",log="xy", colour = I("Red"))  + annotate(geom="text", x=.3, y=20, label = "clear correlation between body and brain weight")

#2. is there a correlation between weight and total sleep? nope? ...
qplot(data=msleep, colour=I("gray"), main="Sleep duration vs wt ", y=bodywt,ylab="Body weight", log="xy")  + annotate(geom="text", x=.3, y=20, label = "No correlation between sleep duration and weight")

#3. is there a correlation between weight and rem? NO...
qplot(data=msleep , x=brainwt,xlab="Wt (kg)",main= "REM vs wt", ylab="REM (hrs)", y=sleep_rem, geom="point",log="xy") + annotate(geom="text", x=.3, y=20, label = "No correlation between REM and weight")

#4. is there a correlation between weight and sleep cycle? ..
qplot(data=msleep, main="Sleep cycle vs Wt", x=brainwt,xlab="Weight (kg)",ylab="Sleep cycle (hrs)", y=sleep_cycle, geom="point",log="yx", colour=I("red")) + geom_smooth() + annotate(geom="text", x=.1, y=20, label = " seems to be a correlation between sleep cycle and weight (note log scale)")

#5. is there a correlation between total sleep, and rem ? Seemingly - lets add a smooth?
qplot(data=msleep , y=sleep_total,ylab="Sleep duration (hrs)",xlab=" REM (hrs)", main="Rem to sleep duration correlation" ,x=sleep_rem, geom="point",log="xy", colour = sleep_cycle) + geom_smooth() + annotate(geom="text", x=.3, y=20, label = "REM seems to correlate with Sleep duration")

#6. Investigate Ratio of Rem to sleep total in primates
qplot(data=msleep ,xlab="Ratio of REM to total Sleep", main= "Rem/sleep ratio distribution across diffrent orders of species", x=sleep_rem/sleep_total, geom="histogram", fill=order)
qplot(data=subset(msleep,order == "Primates"),ylab="Primate", xlab="Rem/Sleep ratio", main= "Rem/sleep ratio in primate", x=sleep_rem/sleep_total,y=name, geom="col", fill=name) + annotate(geom="text", x=.1, y=5, label = "Humans have the highest REM in primates")

#7 investigate overall mean ratios by Vore
msleepmean=aggregate(x = msleep$sleep_rem/msleep$sleep_total,  by = list(msleep$vore),na.rm = TRUE, FUN = mean)
qplot(data=msleepmean,main= "Rem/sleep ratio distribution by Vore",ylab="Vore", x=x, y=Group.1, geom="col", fill=Group.1) + scale_fill_discrete(name="Vore") + annotate(geom="text", x=.1, y=3, label = "Insectivores have the highest REM overall")





