#Question2:
#Create a new file for your analysis named houseelf-analysis.R and add a comment at the top
#describing what the analysis is intended to do.



houseelf_data <- function() {
  data <- read.csv ("./data/houseelf_earlength_dna_data.csv")
  return(data)
}
data <- houseelf_data()


#Question5
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



