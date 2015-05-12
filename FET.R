# Input:
# [filename1: list of all genes]
# [filename2: marker list]
# [filename3: list of identified genes]
# [output file name]
options=commandArgs(trailingOnly = TRUE)
print(options)
FileAll=options[1] # list of all genes
GeneList=options[2] # marker list 
IdenList=options[3] # identified list
Out=options[4] # output file name



FAll=read.table(FileAll,header=F,stringsAsFactors=F)[[1]]
FMkIn=read.table(GeneList,header=F,stringsAsFactors=F)[[1]]
FIdenIn=read.table(IdenList,header=F,stringsAsFactors=F)[[1]]

FMk=intersect(FAll,FMkIn)
FIden=intersect(FAll, FIdenIn)

Both=length(intersect(FMk, FIden))
MkNoIden=length(setdiff(FMk, FIden))
IdenNoMk=length(setdiff(FIden, FMk))
Neither=length(FAll)-Both-MkNoIden-IdenNoMk


ToTest=cbind(c(Both, MkNoIden), c(IdenNoMk, Neither))
cat("\n ==================================== \n")
print(cbind(c("In_Both", "InMarkerList_Not_Identified"), 
						c("Identified_Not_InMarkerList", "In_Neither")))

cat("\n ==================================== \n")
print(ToTest)

cat("\n ==================================== \n")
Fet=fisher.test(ToTest)

print(Fet)
Res=c(Fet$p.value, log(Fet$p.value))
names(Res)=c("pvalue","log_pvalue")
write.table(Res,file=Out, col.names=F)
