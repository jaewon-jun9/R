bikeL.aov = aov(use_time_m~ eq*b_weekday, data=bikeL)
summary(bikeL.aov)

bikeLsub=bikeL[(bikeL$use_time_m < 44&bikeL$use_time_m > 0&bikeL$eq == "0"|bikeL$use_time_m < 135&bikeL$use_time_m > 0&bikeL$eq == "1"),]
summary(bikeLsub)

par(mfrow = c(2, 2))
plot(bikeLsub$use_time_m ~ bikeLsub$b_year, main="box plot by year")
plot(bikeLsub$use_time_m ~ bikeLsub$b_weekday, main="box plot by weekday")
plot(bikeLsub$use_time_m ~ bikeLsub$b_month, main="box plot by month")
plot(bikeLsub$use_time_m ~ bikeLsub$b_hour, main="box plot by hour")


#interaction.plot(bikeLsub$use_time_m, bikeLsub$b_weekday, bikeLsub$eq, bty='l', main="interaction effect plot")
#interaction.plot(class.fac, gender.fac, score_stats, bty='l', main="interaction effect plot")




