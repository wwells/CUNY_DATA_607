setwd("~/Dropbox/CUNY/DATA-607_DataManagement/ProjectFinal")

if (!require('twitteR')) install.packages ('twitteR')
if (!require('ROAuth')) install.packages ('ROAuth')
if (!require('httr')) install.packages ('httr')

source('FPCredentials.R')

#options(httr_oauth_cache=TRUE)
setup_twitter_oauth(api_key, api_secret, access_token, access_token_secret)

#version to just look for date range
d2 <- searchTwitter("#hairspraylive", n=400000, since='2016-12-08', until='2016-12-09', lang="en")

#setdf (meth1)
df2 <- twListToDF(d2)

#write to csv for later use
write.csv(df2, file="df2.csv")

## Check Session Limits
rate.limit <- getCurRateLimitInfo()
# print out all metrics that have been changed
rate.limit[rate.limit$limit != rate.limit$remaining,]

rm(access_token, access_token_secret, api_key, api_secret)
#save.image("FP2.RData")