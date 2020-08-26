library(tm)
library(stringr)
library(shiny)

# Load Quadgram,Trigram & Bigram Data frame files

quadgram = readRDS("data/Quadgrams.RData");
trigram  = readRDS("data/Trigrams.RData");
bigram   = readRDS("data/Bigrams.RData");
msg      = ""

predict <- function(phrase) {
  cleanedPhrase <- removeNumbers(removePunctuation(tolower(phrase)))
  word <- strsplit(cleanedPhrase, " ")[[1]]
  

  if (length(word)>= 3) {
    word <- tail(word,3)
    if (identical(character(0),head(quadgram[quadgram$unigram == word[1] & quadgram$bigram == word[2] & quadgram$trigram == word[3], 4],1))){
      predict(paste(word[2],word[3],sep=" "))
    }
    else {msg <<- "Next word is predicted using Quadgram."; head(quadgram[quadgram$unigram == word[1] & quadgram$bigram == word[2] & quadgram$trigram == word[3], 4],1)}
  }
  else if (length(word) == 2){
    word <- tail(word,2)
    if (identical(character(0),head(trigram[trigram$unigram == word[1] & trigram$bigram == word[2], 3],1))) {
      predict(word[2])
    }
    else {msg<<- "Next word is predicted using Trigram."; head(trigram[trigram$unigram == word[1] & trigram$bigram == word[2], 3],1)}
  }
  else if (length(word) == 1){
    word <- tail(word,1)
    if (identical(character(0),head(bigram[bigram$unigram == word[1], 2],1))) {
      msg<<-"No match found."; head("the",1)}
    else {msg <<- "Next word is predicted using Bigram."; head(bigram[bigram$unigram == word[1],2],1)}
  }
}


shinyServer(function(input, output) {
  output$prediction <- renderPrint({
    result <- predict(input$inputString)
    output$text2 <- renderText({msg})
    result
  });
  
  output$text1 <- renderText({
    input$inputString});
}
)
