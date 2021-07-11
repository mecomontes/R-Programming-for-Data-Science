pollutantmean <- function(directory = '~/Desktop/Coursera/datasciencecoursera/course2/specdata/', pollutant, id = 1:332) {
  total <- 0
  len <- 0
  print <- c('id', 'nobs')
  for (ID in id) {
    if (ID < 10) {
      full_path <- paste(directory, '00', ID, '.csv', sep='')
    } else if (ID < 100) {
      full_path <- paste(directory, '0', ID, '.csv', sep='')
    } else {
      full_path <- paste(directory, ID, '.csv', sep='')
    }
    data <- read.csv(full_path)
    NA_values <- is.na(data[pollutant])
    clean_df <- data[pollutant][!NA_values]
    if (length(clean_df) != 0) {
      total <- total + sum(clean_df)
    }
    len <- len + length(clean_df)
    nitrate <- length(data$nitrate[!is.na(data$nitrate)])
    sulfate <- length(data$sulfate[!is.na(data$sulfate)])
    print(c(ID, nitrate + sulfate))
    }
  total_mean <- total / len
}
sprintf('mean = %f', pollutantmean(pollutant='nitrate') )
