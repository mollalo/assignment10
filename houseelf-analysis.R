
#################################### Question 2 ##########################################
# Create a new file for your analysis named houseelf-analysis.R 
# In this homework, we're gonna work with version control in R.



#################################### Question 3 ##########################################
# Read the data using a function:

houseelf_data <- function() {
  data <- read.csv ("./data/houseelf_earlength_dna_data.csv")
  return(data)
}
data <- houseelf_data()


#################################### Question 5 ##########################################

install.packages("stringr")
library(stringr)
sequence <- "attggc"
get_gc_content <- function(sequence) {
  Gs <- str_count(sequence, "g")
  Cs <- str_count(sequence, "c")
  gc_content <- (Gs + Cs) / str_length(sequence) * 100 
  return(gc_content)
}
get_gc_content (sequence)

sequences <- c("ttgaatgccttacaactgatcattacacaggcggcatgaagcaaaaatatactgtgaaccaatgcaggcg",
               "gauuauuccccacaaagggagugggauuaggagcugcaucauuuacaagagcagaauguuucaaaugcau",
               "gaaagcaagaaaaggcaggcgaggaagggaagaagggggggaaacc",
               "guuuccuacaguauuugaugagaaugagaguuuacuccuggaagauaauauuagaauguuuacaacugcaccugaucagguggauaaggaagaugaagacu",
               "gauaaggaagaugaagacuuucaggaaucuaauaaaaugcacuccaugaauggauucauguaugggaaucagccggguc")

empty <- c ()
for (seq in sequences){
  gc_content <- c(empty, get_gc_content (seq))
  print(gc_content)
}


get_ear_length <- function(seq){
    #Calculate the GC-content for one or more sequences
    ear_lengths <- ifelse(seq > 10, "large", "small")
    return(ear_lengths)
}


############################################## Question  7   ###############################

install.packages("stringr")
library(stringr)
data <- read.csv("./data/houseelf_earlength_dna_data_1.csv")

#function that returns ear_length >10 as "large" and ear_length <= 10 as "small"
ear_length <- function (number){
  if (number >10){
    
    return("large")
  }else if (number <= 10){
    
    return ("small")
  }
}

#function that calculates GC_content for a dna sequence
get_gc_content <- function(dnaseq){
  Gs <- str_count(dnaseq, "G")
  Cs <- str_count(dnaseq, "C")
  gc_content <- (Gs + Cs) / str_length(dnaseq) * 100
  return(gc_content)
}

#Read each column from csv file individually
ID <- data.frame(data$id, stringsAsFactors = FALSE)
dnaseq <- data.frame(data$dnaseq, stringsAsFactors = FALSE)
earlength <- data.frame(data$earlength, stringsAsFactors = FALSE)


#calculate gc_content for all of the dna sequences
gc_contents <- data.frame(gc_content = numeric(nrow(dnaseq)))
for (i in 1:nrow(dnaseq)){
  gc_contents[i,] <- get_gc_content(dnaseq[i,])
}
gc_contents

# Return type of earlength (small or large) for each house-elves
the_ear_length_class <- data.frame(earlength = numeric(nrow(earlength)))
for (i in 1:nrow(earlength)){
  the_ear_length_class[i,] <- ear_length(earlength[i,])
}
the_ear_length_class

# combine dataframes into one df

grangers_analysis.csv <- data.frame(ID, the_ear_length_class, gc_contents, stringsAsFactors = FALSE)

# export this data to csv 
write.csv(grangers_analysis.csv)



