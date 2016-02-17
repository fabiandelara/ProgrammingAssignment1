
complete <- function(directory, id=1:332) {
  ## directory is a character vector of length 1 indicating 
  ## the location of the csv files
  
  ## threshold is a numeric vector of length 1 indicating the 
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return the numeric vector of correlations 
  ## NOTE: Do not round the result!
  
  # Get the length of id vector 
  id_length <- length(id)
  comp_data <- rep(0, id_length)
  
  # find the files on specified path 
  file_Name <- as.character(list.files(directory))
  file_Path <- paste(directory, file_Name, sep="/")
  n <- 1 
  for (i in id) {
    nfile <- read.csv(file_Path[i], header=T, sep=",")
    comp_data[n] <- sum(complete.cases(nfile))
    n <- n + 1
  }
  result <- (data.frame(id=id, nobs=comp_data))
  return(result)
}
