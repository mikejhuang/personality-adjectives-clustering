setwd('e:/personality-adjectives-clustering//')
zz=gzfile('data/tweets2009-06.txt.gz')
#line=readLines(zz,n=1000)
#print(line)
data=read.table(zz, sep="\n", skip= 1)

#time=data[seq(1,6444240)*3+1,]
user<-data[seq(1,6444240)*3+2,]
user<-lapply(user,substring,22)
tweet<-data[seq(1,6444240)*3+3,]
tweet<-lapply(tweet,substring,3)
exists<-tweet!="No Post Title"
tweet<-tweet[exists]
user<-user[exists]
dat<-as.data.frame(cbind(user,tweet))
dat<-dat[grep("http://twitter.com",dat$tweet,invert=TRUE),]

dat$user<-unlist(dat$user, recursive=FALSE)
dat$tweet<-unlist(dat$tweet, recursive=FALSE)

dat$user<-as.factor(dat$user)


#combine all tweets of user into a single row
dfnew<-by(df$Sepal.Length,df$Species,c)
datcu<-by(dat$tweet,dat$user,paste)

datcu2<-unlist(datcu, recursive=FALSE)

#make term document matrix
#PCA
#cluster

df=iris

for i in 1:length(datcu){}