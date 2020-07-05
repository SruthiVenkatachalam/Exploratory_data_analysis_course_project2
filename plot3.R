NEI <- readRDS("summarySCC_PM25.rds")
library(dplyr)
NEIdp <- tbl_df(NEI)
# Baltimore emissions per year and type
BaltimoraEmissionsTypeYears = summarize(group_by(filter(NEIdp, fips=="24510"),type,year),sum(Emissions))
# renamed columns
colnames(BaltimoraEmissionsTypeYears) <- c("Type","Year", "Emissions")
# year converted to string
BaltimoraEmissionsTypeYears$Year <- as.character(BaltimoraEmissionsTypeYears$Year)

# 2. Plot
library(ggplot2)
png('plot3.png')
qplot(Year,data=BaltimoraEmissionsTypeYears, geom="bar", weight=Emissions, facets=.~Type, fill=Year, main='Baltimore City: Emissions (PM 2.5) per year and type', xlab='', ylab = 'Emissions (PM 2.5)')
dev.off()
