library(dplyr)
NEIdp <- tbl_df(NEI)
# table with emissions per year
EmissionsForYear = summarize(group_by(NEIdp, year), sum(Emissions))
# renamed columns
colnames(EmissionsForYear) <- c("Year", "Emissions")
# new column with emissions in million (for the y axis)
EmissionsForYear$EmissionsInMillions = EmissionsForYear$Emissions / 1000000

# 2. Plot (png file)
png('plot1.png')
barplot(EmissionsForYear$EmissionsInMillions, names.arg=EmissionsForYear$Year, col="blue", xlab='Years', ylab='Emissions (PM 2.5) in millions', main =  'Emissions (PM 2.5) per year')
dev.off()