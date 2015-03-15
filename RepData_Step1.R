##STEP 1 - Reproducible Research Peer Review 1
##This script will download the activity file required for Peer Review 1

##Set File URL
fileURL <- "https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2Factivity.zip"

##Make Temporary Folder
tempFolder = tempdir()

##Prototype File
protoFile = tempfile(tmpdir=tempFolder, fileext=".zip")

##Download File OSX
download.file(fileURL, protoFile, method="curl")
#download.file(fileURL, protoFile) #Windows

##Pull Filename
pulledName = unzip(protoFile, list=TRUE)$Name[1]

#Unzip File To Temporary Folder -Overwrite To Prevent Errors 
unzip(protoFile, files=pulledName, exdir=tempFolder, overwrite=TRUE)

##Set Path To Activity File
filePath = file.path(tempFolder, pulledName)

##Load Text File To Dataframe
df <- read.csv(filePath, as.is=TRUE)