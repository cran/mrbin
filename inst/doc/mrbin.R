### R code from vignette source 'mrbin.Rnw'
### Encoding: ISO8859-1

###################################################
### code chunk number 1: mrbin.Rnw:64-65
###################################################
library(mrbin)


###################################################
### code chunk number 2: mrbin.Rnw:155-174
###################################################
mrbinResults<-mrbin(silent=TRUE,
     setDefault=FALSE,
     parameters=list(verbose=TRUE,
             dimension="1D",
             binMethod="Rectangular bins",
             binwidth1D=.01,
             referenceScaling="Yes",
             removeSolvent="Yes",
             removeAreas="No",
             sumBins="No",
             noiseRemoval="Yes",
             PQNScaling="Yes",
             fixNegatives="Yes",
             logTrafo="Yes",
             saveFiles="Yes",
             NMRfolders=c(system.file("extdata/1/10/pdata/10",package="mrbin"),
                          system.file("extdata/2/10/pdata/10",package="mrbin"),
                          system.file("extdata/3/10/pdata/10",package="mrbin"))
     ))


###################################################
### code chunk number 3: mrbin.Rnw:191-205
###################################################
mrbinResults<-mrbin(silent=TRUE,
     setDefault=FALSE,
     parameters=list(verbose=TRUE,
               dimension="2D",
               binwidth2D=0.1,
               binheight=3,
               PQNScaling="No",
               fixNegatives="No",
               logTrafo="No",
               signal_to_noise2D=20,
               NMRfolders=c(system.file("extdata/1/12/pdata/10",package="mrbin"),
                       system.file("extdata/2/12/pdata/10",package="mrbin"),
                       system.file("extdata/3/12/pdata/10",package="mrbin"))
               ))


