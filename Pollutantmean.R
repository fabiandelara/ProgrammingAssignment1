pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## directory is a character vector of length 1 indicating
  ## the location of the csv

  ## pollutant is a character vector of length 1 indicating
  ## the name of the pollutant for wich we will calculate the 
  ## mean; either sulfate or nitrate

  ## id is an integer vector indicating the monitor ID numbers
  ## to be used

  ## Return the mean of the pollutant across all monitors list 
  ## in the id vector (ignoring NA values)
  ## NOTE: Do not round the result!
  
  mean_vec  <- c() 
  file_Name  <- as.character(list.files(directory))
  file_Path <- paste(directory, "/", file_Name, sep="")

  for(i in id) {
      xfile <- read.csv(file_Path[i], header=T, sep=",")
      head(xfile)
      pollutant
      na_xfile <- xfile[!is.na(xfile[, pollutant]), pollutant]
      mean_vec <- c(mean_vec, na_xfile)
  }

  result_tot <- mean(mean_vec)
  return(result_tot)
  ## return(round(result_tot, 3) )
}
