### R code from vignette source 'mrbin.Rnw'

###################################################
### code chunk number 1: mrbin.Rnw:83-84
###################################################
library(mrbin)


###################################################
### code chunk number 2: mrbin.Rnw:86-87 (eval = FALSE)
###################################################
## results<-mrbin()


###################################################
### code chunk number 3: mrbin.Rnw:153-169 (eval = FALSE)
###################################################
## results<-mrbin(parameters=list(dimension="1D",
##              binwidth1D=.02,
##              referenceScaling="Yes",
##              removeSolvent="Yes",
##              solventRegion=c(4.95,4.65),
##              noiseRemoval="Yes",
##              signal_to_noise1D=35,
##              noiseThreshold=0.75,
##              PQNScaling="No",
##              fixNegatives="No",
##              logTrafo="No",
##              useAsNames="Spectrum titles",
##              NMRfolders=c(system.file("extdata/1/10/pdata/10",package="mrbin"),
##                           system.file("extdata/2/10/pdata/10",package="mrbin"),
##                           system.file("extdata/3/10/pdata/10",package="mrbin"))
##      ))


###################################################
### code chunk number 4: mrbin.Rnw:172-191
###################################################
results<-mrbin(silent=TRUE,#this suppresses all interactive prompts
     setDefault=FALSE,
     parameters=list(verbose=TRUE,
             dimension="1D",
             binwidth1D=.02,
             referenceScaling="Yes",
             removeSolvent="Yes",
             solventRegion=c(4.95,4.65),
             noiseRemoval="Yes",
             signal_to_noise1D=35,
             noiseThreshold=0.75,
             PQNScaling="No",
             fixNegatives="No",
             logTrafo="No",
			 useAsNames="Spectrum titles",
             NMRfolders=c(system.file("extdata/1/10/pdata/10",package="mrbin"),
                          system.file("extdata/2/10/pdata/10",package="mrbin"),
                          system.file("extdata/3/10/pdata/10",package="mrbin"))
     ))


###################################################
### code chunk number 5: mrbin.Rnw:199-200
###################################################
setNoiseLevels(results,plotOnly=TRUE)


###################################################
### code chunk number 6: mrbin.Rnw:209-214 (eval = FALSE)
###################################################
## results<-mrbin(parameters=list(
##    NMRfolders=c("C:/Bruker/TopSpin3.6.1/data/guest/nmr/sample_1/10/pdata/10",
##              "C:/Bruker/TopSpin3.6.1/data/guest/nmr/sample_2/10/pdata/10",
##              "C:/Bruker/TopSpin3.6.1/data/guest/nmr/sample_3/10/pdata/10")
##    ))


###################################################
### code chunk number 7: mrbin.Rnw:233-234 (eval = FALSE)
###################################################
## results<-setNoiseLevels(results)


###################################################
### code chunk number 8: mrbin.Rnw:246-247 (eval = FALSE)
###################################################
## results<-removeNoise(results)


###################################################
### code chunk number 9: mrbin.Rnw:252-253 (eval = FALSE)
###################################################
## results<-atnv(results)


###################################################
### code chunk number 10: mrbin.Rnw:260-262 (eval = FALSE)
###################################################
## results<-setDilutionFactors(results)
## results<-dilutionCorrection(results)


###################################################
### code chunk number 11: mrbin.Rnw:268-269 (eval = FALSE)
###################################################
## results<-PQNScaling(results)


###################################################
### code chunk number 12: mrbin.Rnw:276-277 (eval = FALSE)
###################################################
## results<-logTrafo(results)


###################################################
### code chunk number 13: mrbin.Rnw:284-285 (eval = FALSE)
###################################################
## results<-unitVarianceScaling(results)


###################################################
### code chunk number 14: mrbin.Rnw:290-291 (eval = FALSE)
###################################################
## plotResults(results)


###################################################
### code chunk number 15: mrbin.Rnw:299-300 (eval = FALSE)
###################################################
## results<-removeSpectrum(results)


###################################################
### code chunk number 16: mrbin.Rnw:308-309 (eval = FALSE)
###################################################
## results<-metadatamrbin(results)


###################################################
### code chunk number 17: mrbin.Rnw:318-321
###################################################
results<-metadatamrbin(results,metadata=list(
  projectTitle="Test project",
  factors=factor(c("Control","Control","Treatment"))))


###################################################
### code chunk number 18: mrbin.Rnw:327-328
###################################################
plotPCA(results)


###################################################
### code chunk number 19: mrbin.Rnw:338-348
###################################################
#Annotate the dataset with signal identities
metaboliteIdentities<-matrix(c(1.346,1.324,21,23,
                              4.12,4.1,70.8578,71.653,
                              3.052,3.043,30.5,33.5,
                              4.066,4.059,57,59.5,
                              5.7,6.0,0,150),
                   ncol=4,byrow=TRUE)
rownames(metaboliteIdentities)<-c("Lactate","Lactate","Creatinine",
	"Creatinine","Urea")
results<-annotatemrbin(results,metaboliteIdentities=metaboliteIdentities)


###################################################
### code chunk number 20: mrbin.Rnw:353-354
###################################################
plotPCA(results,loadings=TRUE,annotate=TRUE)


###################################################
### code chunk number 21: mrbin.Rnw:365-373 (eval = FALSE)
###################################################
## results<-editmrbin(
##   results,
##   bins=results$bins,#omit this line if no changes are made to bins
##   parameters=list(noiseThreshold=0.75),
##   metadata=list(projectTitle="Test project"),
##   comment="Changed title and noise parameters",
##   transformations="Scaling"#If you change bins, provide a short explanation
##   )


###################################################
### code chunk number 22: mrbin.Rnw:378-379 (eval = FALSE)
###################################################
## results$changeLog


###################################################
### code chunk number 23: mrbin.Rnw:385-386
###################################################
checkmrbin(results)


###################################################
### code chunk number 24: mrbin.Rnw:394-410 (eval = FALSE)
###################################################
## results2D<-mrbin(setDefault=TRUE,parameters=list(dimension="2D",
##                binwidth2D=0.3,
##                binheight=4,
##                removeSolvent="Yes",
##                solventRegion=c(4.95,4.65),
##                noiseRemoval="Yes",
##                signal_to_noise2D=5,
##                noiseThreshold=0.75,
##                PQNScaling="No",
##                fixNegatives="No",
##                logTrafo="No",
## 			   useAsNames="Spectrum titles",
##                NMRfolders=c(system.file("extdata/1/12/pdata/10",package="mrbin"),
##                        system.file("extdata/2/12/pdata/10",package="mrbin"),
##                        system.file("extdata/3/12/pdata/10",package="mrbin"))
##                ))


###################################################
### code chunk number 25: mrbin.Rnw:412-431
###################################################
results2D<-mrbin(silent=TRUE,#this suppresses all interactive prompts
     setDefault=TRUE,
     parameters=list(verbose=TRUE,
               dimension="2D",
               binwidth2D=0.3,
               binheight=4,
               removeSolvent="Yes",
               solventRegion=c(4.95,4.65),
               noiseRemoval="Yes",
               signal_to_noise2D=5,
               noiseThreshold=0.75,
               PQNScaling="No",
               fixNegatives="No",
               logTrafo="No",
			   useAsNames="Spectrum titles",
               NMRfolders=c(system.file("extdata/1/12/pdata/10",package="mrbin"),
                       system.file("extdata/2/12/pdata/10",package="mrbin"),
                       system.file("extdata/3/12/pdata/10",package="mrbin"))
               ))


###################################################
### code chunk number 26: mrbin.Rnw:438-439
###################################################
setNoiseLevels(results2D,plotOnly=TRUE)


###################################################
### code chunk number 27: mrbin.Rnw:451-452 (eval = FALSE)
###################################################
## load("C:/Users/User/Documents/mrbin.Rdata")


###################################################
### code chunk number 28: mrbin.Rnw:460-463
###################################################
results2D<-metadatamrbin(results2D,metadata=list(
  projectTitle="Test project",
  factors=factor(c("Control","Control","Treatment"))))


###################################################
### code chunk number 29: mrbin.Rnw:469-470
###################################################
plotPCA(results2D)


###################################################
### code chunk number 30: mrbin.Rnw:476-486
###################################################
#Annotate the dataset with signal identities
metaboliteIdentities<-matrix(c(1.346,1.324,21,23,
                              4.12,4.1,70.8578,71.653,
                              3.052,3.043,30.5,33.5,
                              4.066,4.059,57,59.5,
                              5.7,6.0,0,150),
                   ncol=4,byrow=TRUE)
rownames(metaboliteIdentities)<-c("Lactate","Lactate","Creatinine",
	"Creatinine","Urea")
results2D<-annotatemrbin(results2D,metaboliteIdentities=metaboliteIdentities)


###################################################
### code chunk number 31: mrbin.Rnw:491-492
###################################################
plotPCA(results2D,loadings=TRUE,annotate=TRUE)


###################################################
### code chunk number 32: mrbin.Rnw:501-524 (eval = FALSE)
###################################################
## results <- mrbin(parameters=list(dimension="1D",binMethod="Custom bin list",
##  specialBinList=matrix(c(5.45,5.2,0,160,
##                          2.9,2.74,0,160,
##                          2.14,1.93,0,160,
##                          1.41,1.2,0,160,
##                          0.94,0.8,0,160,
##                          2.44,2.2,0,160,
##                          4.325,4.26,0,160
##                          ),ncol=4,byrow=TRUE,dimnames=list(c(
##                          "-CH=CH- Methene",
##                          "=CH-CH2-CH= Diallylic",
##                          "-CH2-CH=CH- Allylic",
##                          "-CH2- Methylene",
##                          "-CH3 Methyl",
##                          "COO-CH2-CH2- Methylene_to_carboxyl",
##                          "Glycerol"
##                          ),NULL)),
##  referenceScaling="Yes",reference1D=c(0.03,-0.03),removeSolvent="No",
##  noiseRemoval="No",PQNScaling="No",fixNegatives="Yes",logTrafo="No",
##  NMRfolders=c(system.file("extdata/1/10/pdata/10",package="mrbin"),
##               system.file("extdata/2/10/pdata/10",package="mrbin"),
##               system.file("extdata/3/10/pdata/10",package="mrbin"))
##  ))


###################################################
### code chunk number 33: mrbin.Rnw:544-545 (eval = FALSE)
###################################################
## results<-mrbin()


###################################################
### code chunk number 34: mrbin.Rnw:604-605 (eval = FALSE)
###################################################
## atnv(NMRdataMatrix,noiseLevelVector)


###################################################
### code chunk number 35: mrbin.Rnw:620-621 (eval = FALSE)
###################################################
## mrplot()


###################################################
### code chunk number 36: mrbin.Rnw:659-678
###################################################
metaboliteIdentities<-matrix(c(1.346,1.324,21,23,
                              4.12,4.1,70.8578,71.653,
                              3.052,3.043,30.5,33.5,
                              4.066,4.059,57,59.5,
                              2.582,2.479,46,49,
                              2.737,2.634,46,49),
                   ncol=4,byrow=TRUE)
rownames(metaboliteIdentities)<-c("Lactate","Lactate","Creatinine","Creatinine",
        "Citrate","Citrate")
mrplot(folders=c(system.file("extdata/1/12/pdata/10",package="mrbin"),
                 system.file("extdata/1/10/pdata/10",package="mrbin"),
                 system.file("extdata/2/10/pdata/10",package="mrbin"),
                 system.file("extdata/3/10/pdata/10",package="mrbin")),
       dimensions=c("2D","1D","1D","1D"),
	   zoom=c(2.8,2.4,20,60),
       highlight=c(2.564,2.537),
       binlist=c("2.725,2.675","2.575,2.525"),
       annotate=TRUE,metaboliteIdentities=metaboliteIdentities,
       plotTitle="Significant Bins",intensity1D=24,hideMenu=TRUE)


###################################################
### code chunk number 37: mrbin.Rnw:685-719
###################################################
# First create NMR bin data, then plot some differential bins.
results<-mrbin(silent=TRUE,setDefault=TRUE,parameters=list(verbose=FALSE,
                dimension="1D",binwidth1D=0.01,PCA="No",
				showSpectrumPreview="No",
                signal_to_noise1D=25,noiseThreshold=0.75,
				useAsNames="Spectrum titles",
                NMRfolders=c(
                system.file("extdata/1/10/pdata/10",package="mrbin"),
                system.file("extdata/2/10/pdata/10",package="mrbin"),
                system.file("extdata/3/10/pdata/10",package="mrbin"))
                ))
metadata<-c(0,0,1)
#Find significant signals
pvalues<-rep(NA,ncol(results$bins))
names(pvalues)<-colnames(results$bins)
for(i in 1:ncol(results$bins)){
	model<-stats::lm(intensity~treatment, 
     data=data.frame(intensity=results$bins[,i],treatment=metadata))
	pvalues[i]<-stats::anova(model)$"Pr(>F)"[1]
}
significantBins<-names(sort(pvalues)[1:30]) 
#Annotate the dataset with signal identities
metaboliteIdentities<-matrix(c(1.346,1.324,21,23,
                              4.12,4.1,70.8578,71.653,
                              3.052,3.043,30.5,33.5,
                              4.066,4.059,57,59.5,
                              5.7,6.0,0,150),
                   ncol=4,byrow=TRUE)
rownames(metaboliteIdentities)<-c("Lactate","Lactate","Creatinine",
	"Creatinine","Urea")
results<-annotatemrbin(results,metaboliteIdentities=metaboliteIdentities)
mrheatmap(results=results,
    binlist=significantBins,annotate=TRUE,
    main="Significant signals",closeDevice=FALSE)


###################################################
### code chunk number 38: mrbin.Rnw:731-734 (eval = FALSE)
###################################################
## readBruker(dimension="1D",
##   folder=system.file("extdata/1/10/pdata/10",package="mrbin"))
## plotNMR()


###################################################
### code chunk number 39: mrbin.Rnw:740-743 (eval = FALSE)
###################################################
## addToPlot(dimension="1D",
##   folder="C:/Bruker/TopSpin3.6.1/data/guest/nmr/sample_1/12/pdata/10")
## plotNMR()


###################################################
### code chunk number 40: mrbin.Rnw:749-752 (eval = FALSE)
###################################################
## addToPlot(dimension="2D",
##   folder=system.file("extdata/1/12/pdata/10",package="mrbin"))
## plotNMR()


###################################################
### code chunk number 41: mrbin.Rnw:757-764 (eval = FALSE)
###################################################
## zoom(left=4.6, right=2, top=10, bottom=150) #Exact zoom
## zoomIn() #Zoom in
## zoomOut() #Zoom out
## intPlus() #Increase intensity
## intMin() #Decrease intensity
## left() #Move spectrum to the left
## right() #Move spectrum to the right


###################################################
### code chunk number 42: mrbin.Rnw:769-773 (eval = FALSE)
###################################################
## contMin() #Decrease minimum contour level (show more small peaks)
## contPlus() #Increase minimum contour level (remove small peaks)
## up() #Move spectrum up
## down() #Move spectrum down


###################################################
### code chunk number 43: mrbin.Rnw:793-811 (eval = FALSE)
###################################################
## #First, define group membership and create the example feature data
## group<-factor(c(rep("Group1",4),rep("Group2",5)))
## names(group)<-paste("Sample",1:9,sep="")
## dataset<-data.frame(
##     Feature1=c(5.1,5.0,6.0,2.9,4.8,4.6,4.9,3.8,5.1),
##     Feature2=c(2.6,4.0,3.2,1.2,3.1,2.1,4.5,6.1,1.3),
##     Feature3=c(3.1,6.1,5.8,5.1,3.8,6.1,3.4,4.0,4.4),
##     Feature4=c(5.3,5.2,3.1,2.7,3.2,2.8,5.9,5.8,3.1),
##     Feature5=c(3.2,4.4,4.8,4.9,6.0,3.6,6.1,3.9,3.5),
##     Feature6=c(6.8,6.7,7.2,7.0,7.3,7.1,7.2,6.9,6.8)
## )
## rownames(dataset)<-names(group)
## #train the logit model
## mod<-glm(group~Feature1+Feature2+Feature3+Feature4+Feature5+Feature6,
##    data=data.frame(group=group,dataset),family="binomial")
## fiaresults<-fia(model=mod,dataSet=dataset,factors=group,
##   parameterNameData="newdata",firstLevel=0,type="response")
## fiaresults$scores


