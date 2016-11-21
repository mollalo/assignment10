#Question2:
#Create a new file for your analysis named houseelf-analysis.R and add a comment at the top
#describing what the analysis is intended to do.



houseelf_data <- function() {
  data <- read.csv ("./data/houseelf_earlength_dna_data.csv")
  return(data)
}
data <- houseelf_data()

data <- read.csv ("./data/houseelf_earlength_dna_data_1.csv")
