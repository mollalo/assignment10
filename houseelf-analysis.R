#add a comment at the top describing what the analysis is intended to do.
#Commit this file to version control with a good commit message.
#Then check to see if you can see this commit in the history.
#


###Q3
#Add some code to houseelf-analysis.R that imports the data into R.
#Commit these changes to version control
get_data <- function() {
  data <- read.csv("./data/houseelf_earlength_dna_data_1.csv")
  return(data)
}

data <- get_data()

