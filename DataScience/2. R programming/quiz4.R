rm(list=ls())

best <- function(state, outcome) {
  ## Read outcome data
  df <- read.csv('/home/meco/Desktop/Coursera/datasciencecoursera/course2/outcome-of-care-measures.csv', colClasses = 'character')
  head(df)
  ncol(df)
  names(df)
  hist(as.numeric(df[,11]))
  ## Check that state and outcome are valid
  any_state <- any(state == df$State)
  any_outcome <- any(outcome == c('heart.attack', 'heart.failure', 'pneumonia'))
  
  if (any_state & any_outcome){
    check <- data.frame('heart attack' = 11, 'heart failure' = 17, 'pneumonia' = 23)
    col <- check[outcome][1, 1]
    df_st <- df[df$State == state & df[, col] != 'Not Available',]
    min_i <- which.min(df_st[,col])
    hospital <- df_st[min_i, 'Hospital.Name']
    sprintf('The hospital in %s with lowest %s rate is %s', state, outcome, hospital)
  } else{
    print('Unsuported values')
  }
  
  ## Return hospital name in that state with lowest 30-day death
  ## rate
  
  
}
best('TX', "heart.attack")
best('TX', 'heart.failure')
best("MD", "heart.attack")
best("MD", "pneumonia")
best("BB", "heart attack")
best("NY", "hert attack")


rankhospital <- function(state, outcome, num = 'best') {
  ## Read outcome data
  df <- read.csv('/home/meco/Desktop/Coursera/datasciencecoursera/course2/outcome-of-care-measures.csv', colClasses = 'character')
  ## Check that state and outcome are valid
  any_state <- any(state == df$State)
  any_outcome <- any(outcome == c('heart.attack', 'heart.failure', 'pneumonia'))
  
  if (any_state & any_outcome){
    check <- data.frame('heart attack' = 11, 'heart failure' = 17, 'pneumonia' = 23)
    col <- check[outcome][1, 1]
    df_st <- df[df$State == state & df[, col] != 'Not Available', c(2, col)]
    sorted <- arrange(df_st, as.numeric(df_st[, 2]), df_st[, 1])
    if (num == 'best'){
      result <- head(sorted, n = 1L)
    } else if (num == 'worst') {
      result <- tail(sorted, n = 1L)
    } else {
      result <- sorted[num, ]
    }
    return(result)
  } else{
    print('Unsuported values')
  }
  ## Return hospital name in that state with the given rank
  ## 30-day death rate
}
rankhospital('TX', 'heart.failure', 'best')
rankhospital('TX', 'heart.failure', 4)
rankhospital('MD', 'heart.attack', 'worst')
rankhospital('MD', 'heart.attack', 5)
rankhospital('MN', 'heart.attack', 5000)
rankhospital('HI', 'heart.attack', 4)
rankhospital('NJ', "pneumonia", "worst")
rankhospital('NV', "heart.failure", 10)

rankall <- function(outcome, num = 'best') {
  ## Read outcome data
  df <- read.csv('/home/meco/Desktop/Coursera/datasciencecoursera/course2/outcome-of-care-measures.csv', colClasses = 'character')
  ## Check that state and outcome are valid
  any_outcome <- any(outcome == c('heart.attack', 'heart.failure', 'pneumonia'))
  
  if (any_outcome){
    outcome <- 'heart.attack'
    num <- 'best'
    check <- data.frame('heart attack' = 11, 'heart failure' = 17, 'pneumonia' = 23)
    col <- check[outcome][1, 1]
    df_st <- df[df[, col] != 'Not Available', c(2, col)]
      result <- tapply(df_st[, 3], df_st[, 2], rankhospital(df_st[, 2], outcome, num))
    return(result)
  } else{
    print('Unsuported values')
  }
  ## Return hospital name in that state with the given rank
  ## 30-day death rate
}
tail(rankall('pneumonia', 'worst'), 3)
