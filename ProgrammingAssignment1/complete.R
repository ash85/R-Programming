complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  filenames <- list.files(path=directory, pattern="*.csv")
  
  
  ids <-vector()
  nobs = vector()


  for (i in id)
  {
    filepath <- paste(directory, filenames[i], sep="/")
    data <- read.csv(filepath)
    
    ids <- c(ids,i)
     
    d <- data[complete.cases(data),]
    nobs <- c(nobs,nrow(d))
    
    
   
  }
  
  data.frame(id=ids, nobs=nobs)
  
}