#!/usr/bin/env Rscript

library(SRAdb)
sra_dbname <- '/data/zhoulab/yuxinghai/R/Rtest/SRAmetadb.sqlite'
if(!file.exists('/data/zhoulab/yuxinghai/R/Rtest/SRAmetadb.sqlite')) sqlfile <<- getSRAdbFile(destdir="/data/zhoulab/yuxinghai/R/Rtest/")
sra_con <- dbConnect(dbDriver("SQLite"), sra_dbname)
## Download fastq files from 
ascpCMD <- 'ascp -QT -l 300m -i /data/zhoulab/yuxinghai/.aspera/connect/etc/asperaweb_id_dsa.openssh'
getSRAfile(c("SRR950079","SRR950081","ERR315477","ERR315455"), sra_con, fileType = 'sra', srcType = 'fasp', ascpCMD = ascpCMD )
getSRAinfo(in_acc = c("SRR950079","SRR950081","ERR315477","ERR315455"), sra_con, srcType = "litesra")
getFASTQinfo(in_acc = c("SRR950079","SRR950081","ERR315477","ERR315455"), sra_con, srcType = 'ftp')

dbDisconnect(sra_con)
