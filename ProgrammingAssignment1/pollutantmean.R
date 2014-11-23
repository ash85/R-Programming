pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  #setwd(directory)
  
  filenames <- list.files(path=directory, pattern="*.csv")
  vals <- vector()
  
  for (i in id)
  {
    filepath <- paste(directory, filenames[i], sep="/")
    data <- read.csv(filepath)
    d <- data[,pollutant]
    d <- d[!is.na(d)]
    vals <- c(vals,d)
  }
  
  #return the mean
  
  round(mean(vals), 3)
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
}