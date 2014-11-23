corr <- function(directory, threshold = 0) {

  # use the complete function
  c_data <- complete(directory, 1:332)
  c_data <- subset(completes, nobs > threshold )
  
  filenames <- list.files(path=directory, pattern="*.csv")
  
  corr <- vector()
  
  for(i in c_data$id ) {
    
    filepath <- paste(directory, filenames[i], sep="/")
    data <- read.csv(filepath)
    
    ## Calculate and store the count of complete cases
    completeCases <- data[complete.cases(data),]
    count <- nrow(completeCases)
    
    if( count >= threshold ) {
      corr <- c(corr, cor(completeCases$nitrate, completeCases$sulfate) )
    }
    
  }
  
  #return numeric vector
  corr
  
}