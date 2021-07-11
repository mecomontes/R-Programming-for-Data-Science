# Point 1
df <- read.csv('/home/meco/Desktop/Coursera/datasciencecoursera/course3/getdata_data_ss06hid.csv')
names(df)
dim(df)
str(df)
agricultureLogical <- df$ACR == 3 & df$AGS == 6
which(agricultureLogical) 

# Point 2
URL <- 'http://d396qusza40orc.cloudfront.net/getdata/jeff.jpg'
download.file(URL, destfile = './image.jpeg', method = 'curl')
library(jpeg)
img <- readJPEG('./image.jpeg', native = TRUE)
quantile(img, probs = c(0.3, 0.8))

# Point 3
df1 <- read.csv('/home/meco/Desktop/Coursera/datasciencecoursera/course3/getdata_data_GDP.csv', skip = 4, stringsAsFactors = FALSE)
df2 <- read.csv('/home/meco/Desktop/Coursera/datasciencecoursera/course3/getdata_data_EDSTATS_Country.csv')
head(df1)
head(df2)
names(df2)
dim(df1)
# Coerce to numeric and adds NAs for missing data
df1$X.1 <- as.numeric(df1$X.1)
# Remove NA cases
df1 <- df1[complete.cases(df1$X.1),]
library(dplyr)
new_df <- merge(df1, df2, by.x = 'X', by.y = 'CountryCode', all = FALSE) %>% arrange(desc(X.1))
dim(new_df)
# 13th position
new_df[13, "Long.Name"]

# Point 4
new_df$Gross.domestic.product.2012 <- as.numeric(new_df$Gross.domestic.product.2012)
oecd <- filter(new_df, Income.Group == "High income: OECD", !is.na("Gross.domestic.product.2012")) %>% select("Gross.domestic.product.2012")
mean(oecd$Gross.domestic.product.2012)
no_oecd <- filter(new_df, Income.Group == "High income: nonOECD", !is.na("Gross.domestic.product.2012")) %>% select("Gross.domestic.product.2012")
mean(no_oecd$Gross.domestic.product.2012)
str(no_oecd)
select(no_oecd, no_oecd$Gross.domestic.product.2012 == !is.na(no_oecd$Gross.domestic.product.2012))
