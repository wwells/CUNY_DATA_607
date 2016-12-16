setwd("~/Dropbox/CUNY/DATA-607_DataManagement/ProjectFinal")

load("FP.RData")

if (!require('twitteR')) install.packages ('twitteR')
if (!require('ROAuth')) install.packages ('ROAuth')
if (!require('httr')) install.packages ('httr')

source('FPCredentials.R')

options(httr_oauth_cache=TRUE)
setup_twitter_oauth(api_key, api_secret, access_token, access_token_secret)

#version to just look for date range
d1 <- searchTwitter("#hairspraylive", n=100000, since='2016-12-07', until='2016-12-08', lang="en")

#setdf (meth1)
df1 <- twListToDF(d1)

#write to csv for later use
write.csv(df1, file="df1.csv")

## Check Session Limits
#rate.limit <- getCurRateLimitInfo()
# print out all metrics that have been changed
#rate.limit[rate.limit$limit != rate.limit$remaining,]

rm(access_token, access_token_secret, api_key, api_secret)
save.image("FP.RData")