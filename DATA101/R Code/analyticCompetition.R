# Load data set, in my case ('df.Rda')
load("/Users/Casey/Downloads/df.Rda")
df$FullText = as.character(df$FullText)

# Grab just the texts, so you can load them in the Corpus
df.texts = as.data.frame(df[,ncol(df)])
colnames(df.texts) = 'FullText'

# Remove non-ascii characters
df.texts.clean = as.data.frame(iconv(df.texts$FullText, "latin1", 
                                     "ASCII", sub=""))
colnames(df.texts.clean) = 'FullText'

df$FullText = df.texts.clean$FullText

# To test on 10000 samples using df.10000
idx.10000 = sample(1:nrow(df),10000)
df.10000 = df[idx.10000,]

df.entire = df
df = df.10000

# Load in corpus form using the tm library
library(tm) 
docs <- Corpus(DataframeSource(as.data.frame(df[,6])))   

# Perform pre-processing
docs <- tm_map(docs, PlainTextDocument)
docs <- tm_map(docs, removePunctuation)
docs <- tm_map(docs, stripWhitespace)
docs <- tm_map(docs, removeWords,c("Name","and","for")) 
docs <- tm_map(docs, removeWords, stopwords("english"))
docs <- tm_map(docs, removeWords, stopwords(kind="SMART"))

save.image('docs.preprocessed.Rda')
load('docs.preprocessed.Rda')

# Documents containing each bank
bankA.idx = which(sapply(df$FullText,function(x) grepl("BankA",x)))
bankB.idx = which(sapply(df$FullText,function(x) grepl("BankB",x)))
bankC.idx = which(sapply(df$FullText,function(x) grepl("BankC",x)))
bankD.idx = which(sapply(df$FullText,function(x) grepl("BankD",x)))

df$BankID = vector(mode="numeric", length = nrow(df))
df$BankID[bankA.idx] = "BankA"
df$BankID[bankB.idx] = "BankB"
df$BankID[bankC.idx] = "BankC"
df$BankID[bankD.idx] = "BankD"

bankA.docs = docs[bankA.idx]
bankB.docs = docs[bankB.idx]
bankC.docs = docs[bankC.idx]
bankD.docs = docs[bankD.idx]

summary(docs)

## Repeat these processes for every bank
## Create document term matrix
dtm <- DocumentTermMatrix(docs[bankA.idx])

## Transpose this matrix
tdm <- TermDocumentMatrix(docs[bankA.idx])

## Remove sparse terms
dtm = removeSparseTerms(dtm, 0.98)

## Organize terms by frequency
findFreqTerms(dtm,50)
freq <- colSums(as.matrix(dtm))  
ord <- order(freq)   
freq[head(ord)]  
freq[tail(ord)]

wf <- data.frame(word=names(freq), freq=freq)   
head(wf)

## Plot word frequencies
library(ggplot2)   
p <- ggplot(subset(wf, freq>100), aes(word, freq))    
p <- p + geom_bar(stat="identity")   
p <- p + theme(axis.text.x=element_text(angle=45, hjust=1))   
p

## To get a word cloud of the 100 most frequent words 
library(wordcloud)
set.seed(142)   
dark2 <- brewer.pal(6, "Dark2")   
wordcloud(names(freq), freq, max.words=25, rot.per=0.2, colors=dark2)

# Sentiment analysis
pos <- scan('/Users/Casey/Downloads/positive-words.txt',what='character',comment.char=';')
neg <- scan('/Users/Casey/Downloads/negative-words.txt',what='character',comment.char=';')

score.sentiment = function(sentences, pos.words, neg.words, .progress='none')
{
  require(plyr)
  require(stringr)
  
  scores = laply(sentences, function(sentence, pos.words, neg.words) {
    
    # Clean up sentences with R's regex-driven global substitute, gsub():
    sentence = gsub('[[:punct:]]', '', sentence)
    sentence = gsub('[[:cntrl:]]', '', sentence)
    sentence = gsub('\\d+', '', sentence)
    sentence = tolower(sentence)
    
    # Split into words. You need the stringr package
    word.list = str_split(sentence, '\\s+')
    # Sometimes a list() is one level of hierarchy too much
    words = unlist(word.list)
    
    # Compare words to positive & negative terms
    pos.matches = match(words, pos.words)
    neg.matches = match(words, neg.words)
    
    # match() returns the position of the matched term or NA
    pos.matches = !is.na(pos.matches)
    neg.matches = !is.na(neg.matches)
    
    # TRUE/FALSE will be treated as 1/0 by sum():
    score = sum(pos.matches) - sum(neg.matches)
    
    return(score)
  }, pos.words, neg.words, .progress=.progress )
  
  scores.df = data.frame(score=scores, text=sentences)
  return(scores.df)
}

# Very positive and negative
df.sentiment = df[bankA.idx,]

scores = score.sentiment(df.sentiment$FullText, pos, neg, .progress='text')
scores$very.pos = as.numeric(scores$score >= 2)
scores$very.neg = as.numeric(scores$score <= -2)

pos.tweets = which(scores$very.pos == 1)
neg.tweets = which(scores$very.neg == 1)
write.csv(df.sentiment[pos.tweets,],file='pos.texts.csv')##creates positive
write.csv(df.sentiment[neg.tweets,],file='neg.texts.csv')##creates negative

# Creating a classifier for pos.texts
load('df.Rda')
df$FullText = as.character(df$FullText)
pos.texts = read.csv('pos.texts.csv',header=T)
pos.texts$FullText = as.character(pos.texts$FullText)
colnames(pos.texts)
docs <- Corpus(DataframeSource(as.data.frame(pos.texts[,9])))   
docs <- tm_map(docs, PlainTextDocument)

dtm <- DocumentTermMatrix(docs)

tdm <- TermDocumentMatrix(docs)

m = as.matrix(dtm)

df.classification = as.data.frame(m) #dataframe
df.classification$Relevant = pos.texts$Relevant
df.classification$Relevant

# Grow a tree
library(rpart)
fit<-rpart(Relevant ~ FullText + BankID, data = pos.texts, method = "class")
printcp(fit) # display the results 
plotcp(fit) # visualize cross-validation results 
summary(fit) # detailed summary of splits

# Creating a classifier for neg.texts
load('df.Rda')
df$FullText = as.character(df$FullText)
neg.texts = read.csv('neg.texts.csv',header=T)
neg.texts$FullText = as.character(neg.texts.texts$FullText)
colnames(neg.texts)
docs <- Corpus(DataframeSource(as.data.frame(neg.texts[,9])))   
docs <- tm_map(docs, PlainTextDocument)

dtm <- DocumentTermMatrix(docs)

tdm <- TermDocumentMatrix(docs)

m = as.matrix(dtm)

df.classification = as.data.frame(m) #dataframe
df.classification$Relevant = neg.texts$Relevant
df.classification$Relevant
colnames(neg.texts)

# Grow a tree
library(rpart)
fit<-rpart(Relevant ~ FullText + BankID, data = neg.texts, method = "class")
printcp(fit) # display the results 
plotcp(fit) # visualize cross-validation results 
summary(fit) # detailed summary of splits

## Cluster Dendrogram
# Useless words
docs <- tm_map(docs, removeWords,c("Name", "and","for", "name", "this", "are","from", "just", "get", "ret_twit", "name_resp", "twit_hndl", "twit_handl:", "twit_hndl_banka","ly/")) 
docs <- tm_map(docs, removeWords, stopwords("english"))
docs <- tm_map(docs, removeWords, stopwords(kind="SMART"))

dtm <- DocumentTermMatrix(docs)
tdm <- TermDocumentMatrix(docs)

# remove sparse terms
tdm2 <- removeSparseTerms(tdm, sparse = 0.97)
m2 <- as.matrix(tdm2)
# cluster terms
distMatrix <- dist(scale(m2))
fit <- hclust(distMatrix, method = "ward.D")

plot(fit)
rect.hclust(fit, k = 6)

##############

#K-Means Clustering
library(fpc)
library(cluster)
d <- dist(t(dtm), method="euclidian")
kfit <- kmeans(d, 2)   
clusplot(as.matrix(d), kfit$cluster, color=T, shade=T, labels=2, lines=0) 

#FindAssocs
findAssocs(dtm,"banka", 0.1)
findAssocs(dtm,"bankb", 0.1)
findAssocs(dtm,"bankc", 0.1)
findAssocs(dtm,"bankd", 0.1)

#Topic Modeling
dtm <- as.DocumentTermMatrix(tdm)

library(topicmodels)

lda <- LDA(dtm, k = 8) # find 8 topics

(term <- terms(lda, 6)) # first 6 terms of every topic

term <- apply(term, MARGIN = 2, paste, collapse = ", ")

topic <- topics(lda, 1)

topics <- data.frame(date=as.IDate(tweets.df$created), topic)

qplot(date, ..count.., data=topics, geom="density", fill=term[topic], position="stack")
