rm(list=ls())

install.packages('dplyr')
library(dplyr)
df <- read.csv('/home/meco/Desktop/Coursera/datasciencecoursera/course3/getdata_data_ss06hid.csv')
dt <- tbl_df(df)
rm(df)
dim(dt)
worth <- filter(dt, VAL == 24)
dim(worth)

install.packages('openxlsx')
library(openxlsx)
dat <- read.xlsx('/home/meco/Desktop/Coursera/datasciencecoursera/course3/getdata_data_DATA.gov_NGAP.xlsx', rows = 18:23, cols = 7:15)
sum(dat$Zip*dat$Ext,na.rm=T)

install.packages('XML')
library(XML)
URL <- 'http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml'
# Remove s in https, just http
doc <- xmlTreeParse(URL, getDTD=T, addAttributeNamespaces=T)
rootNode = xmlRoot(doc)
names(rootNode)

DT <- read.csv('/home/meco/Desktop/Coursera/datasciencecoursera/course3/getdata_data_ss06pid.csv')
mean(DT$pwgtp15, by = DT$SEX)
