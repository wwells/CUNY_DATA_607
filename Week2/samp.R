#learn how to create db and load in table in MySQL all in R

if (!require("RMySQL")) install.packages('RMySQL')

#establish initial connection
mydb = dbConnect(MySQL(), user='root', host='localhost')

#create DB
dbSendQuery(mydb, "drop schema if exists Rdata")
dbSendQuery(mydb, "CREATE DATABASE Rdata;")
dbSendQuery(mydb, "USE Rdata")

#reconnect
mydb = dbConnect(MySQL(), user='root', host='localhost', dbname="Rdata")

#add table with Iris data
dbSendQuery(mydb, "drop table if exists Iris")
dbWriteTable(conn = mydb, name = 'Iris', value = as.data.frame(iris))
