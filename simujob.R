
# careful for number of nodes required! -n 1
semjobg<-function(wd="C:/Users/Administrator/Desktop/sem/job20190404",
                 nrep=50,maxit=2000,mode=0,bigmem=FALSE){
  # setwd("/Users/user/Downloads/down/script/r1temp/")
  setwd(wd)

  NOISESEQ=c(1)###########THE TRUE NOISE VALUE HAS BEEN MULTIPLIED BY 10,BECAUSE THE PARAMETER
  #must be an integer
  n_data=3
  #mod_vec=c(3,7) in job1
  mod_vec=c(3,7,4,8,10,9)#in file D:/Documents/Downloads/semjob/job2
  n_noise=1
  for(ndata in 1:n_data){
    for(mod in mod_vec){
      ndatavec=c(200,600,2000)
      for(NOISE in 1:n_noise){
        for(i in 1:nrep){
          sink(paste0("sem_",ndata,"_",i,"_",NOISE,"_",mod,"_",mode,".job",sep=''))
          cat("#!/bin/bash")
          cat("\n")
          cat(paste0("#BSUB -J t",ndata,"_",i,"_",NOISE,"_",mod,"_",mode,"job"))
          cat("\n")
          cat("#BSUB -e %J.err")
          cat("\n")
          cat("#BSUB -o %J.out")
          cat("\n")
          cat("#BSUB -n 1")
          cat("\n")
          cat("#BSUB -N")
          cat("\n")
          if(bigmem==TRUE){
            cat("#BSUB -q bigmem")#queue bigmem
            cat("\n")
            cat("#BSUB -R \"rusage[mem=1000] span[hosts=1]\"")#
            cat("\n")
          }
          cat("#BSUB -W 60:00")
          cat("\n")
          cat("#BSUB -u yxz346@miami.edu")
          cat("\n")
          cat(paste0("cd /scratch/tmp/pudge/sem/src"))
          cat("\n")
          cat("module rm gcc/4.4.7")
          cat("\n")
          cat("module load R/3.3.1")
          cat("\n")
          cat("module load intel")
          cat("\n")
          cat("module load gcc/4.9.4")
          cat("\n")
          cat("cat ~/.R/Makevars")
          cat("\n")
          cat(paste0("/share/opt/R/3.3.1/bin/Rscript modsimu_lslx.R "))
          cat(paste0( c(i,ndatavec[ndata],maxit,mod,NOISESEQ[NOISE],mode),sep=" "))
        #OUT_PAR_SEED=args[1]  0
        #START_Nf1=args[2] 5 10 15
        #START_Nf2=args[3] 5 10 15
        #START_Nm=args[4]  4 2  2
        #START_Ndata=args[5]  1:500,1000,2000;2:1000,2000,5000;3:5000,10000,20000
        sink()
      }
      }
    }
  }
    sink(paste0("subsem",mode,".sh"))
    for(ndata in 1:n_data){
    for(mod in mod_vec){
      for(NOISE in 1:n_noise){
        for(i in 1:nrep){
          cat(paste0("bsub < sem_",ndata,"_",i,"_",NOISE,"_",mod,"_",mode,".job",sep=''))
          cat("\n")
        }
      }
    }
    }
    sink()
}
semjobg(mode=0)
semjobg(mode=1)


semjobgEXT<-function(wd="C:/Users/Administrator/Desktop/sem/job20190421",
                  nrep=50,maxit=2000,mode=0,bigmem=FALSE){
  # setwd("/Users/user/Downloads/down/script/r1temp/")
  setwd(wd)

  NOISESEQ=c(.2)###########THE TRUE NOISE VALUE HAS BEEN MULTIPLIED BY 10,BECAUSE THE PARAMETER
  #must be an integer
  n_data=3
  #mod_vec=c(3,7) in job1
  mod_vec=c(3)#in file D:/Documents/Downloads/semjob/job2
  n_noise=1
  for(ndata in 1:n_data){
    for(mod in mod_vec){
      ndatavec=c(200,600,2000)
      for(NOISE in 1:n_noise){
        for(i in 1:nrep){
          sink(paste0("sem_",ndata,"_",i,"_",NOISE,"_",mod,"_",mode,".job",sep=''))
          cat("#!/bin/bash")
          cat("\n")
          cat(paste0("#BSUB -J t",ndata,"_",i,"_",NOISE,"_",mod,"_",mode,"job"))
          cat("\n")
          cat("#BSUB -e %J.err")
          cat("\n")
          cat("#BSUB -o %J.out")
          cat("\n")
          cat("#BSUB -n 1")
          cat("\n")
          cat("#BSUB -N")
          cat("\n")
          if(bigmem==TRUE){
            cat("#BSUB -q bigmem")#queue bigmem
            cat("\n")
            cat("#BSUB -R \"rusage[mem=1000] span[hosts=1]\"")#
            cat("\n")
          }
          cat("#BSUB -W 60:00")
          cat("\n")
          cat("#BSUB -u yxz346@miami.edu")
          cat("\n")
          cat(paste0("cd /scratch/tmp/pudge/sem/src"))
          cat("\n")
          cat("module rm gcc/4.4.7")
          cat("\n")
          cat("module load R/3.5.1")
          cat("\n")
          cat("module load intel")
          cat("\n")
          cat("module load gcc/4.9.4")
          cat("\n")
          cat("cat ~/.R/Makevars")
          cat("\n")
          cat(paste0("/share/opt/R/3.5.1/bin/Rscript modsimu_lslx.R "))
          cat(paste0( c(i,ndatavec[ndata],maxit,mod,NOISESEQ[NOISE],mode),sep=" "))
          #OUT_PAR_SEED=args[1]  0
          #START_Nf1=args[2] 5 10 15
          #START_Nf2=args[3] 5 10 15
          #START_Nm=args[4]  4 2  2
          #START_Ndata=args[5]  1:500,1000,2000;2:1000,2000,5000;3:5000,10000,20000
          sink()
        }
      }
    }
  }
  sink(paste0("subsem",mode,".sh"))
  for(ndata in 1:n_data){
    for(mod in mod_vec){
      for(NOISE in 1:n_noise){
        for(i in 1:nrep){
          cat(paste0("bsub < sem_",ndata,"_",i,"_",NOISE,"_",mod,"_",mode,".job",sep=''))
          cat("\n")
        }
      }
    }
  }
  sink()
}
semjobgEXT(mode=0)
semjobgEXT(mode=1)

semjobg35<-function(wd="C:/Users/Administrator/Desktop/sem/job20191003",
                  nrep=50,maxit=2000,mode=0,bigmem=FALSE){
  # setwd("/Users/user/Downloads/down/script/r1temp/")
  setwd(wd)

  NOISESEQ=c(1)###########THE TRUE NOISE VALUE HAS BEEN MULTIPLIED BY 10,BECAUSE THE PARAMETER
  #must be an integer
  ndatavec=c(200,500,2000)
  n_data=length(ndatavec)
  #mod_vec=c(3,7) in job1
  mod_vec=c(3)#in file D:/Documents/Downloads/semjob/job2
  n_noise=1
  for(ndata in 1:n_data){
    for(mod in mod_vec){

      for(NOISE in 1:n_noise){
        for(i in 1:nrep){
          sink(paste0("sem_",ndata,"_",i,"_",NOISE,"_",mod,"_",mode,".job",sep=''))
          cat("#!/bin/bash")
          cat("\n")
          cat(paste0("#BSUB -J t",ndata,"_",i,"_",NOISE,"_",mod,"_",mode,"job"))
          cat("\n")
          cat("#BSUB -e %J.err")
          cat("\n")
          cat("#BSUB -o %J.out")
          cat("\n")
          cat("#BSUB -n 1")
          cat("\n")
          cat("#BSUB -N")
          cat("\n")
          if(bigmem==TRUE){
            cat("#BSUB -q bigmem")#queue bigmem
            cat("\n")
            cat("#BSUB -R \"rusage[mem=1000] span[hosts=1]\"")#
            cat("\n")
          }
          cat("#BSUB -W 60:00")
          cat("\n")
          cat("#BSUB -u yxz346@miami.edu")
          cat("\n")
          cat(paste0("cd /scratch/tmp/pudge/sem/src"))
          cat("\n")
          cat("module rm gcc/4.4.7")
          cat("\n")
          cat("module load R/3.5.1")
          cat("\n")
          cat("module load intel")
          cat("\n")
          cat("module load gcc/4.9.4")
          cat("\n")
          cat("cat ~/.R/Makevars")
          cat("\n")
          cat(paste0("/share/opt/R/3.5.1/bin/Rscript modsimu_all.R "))
          cat(paste0( c(i,ndatavec[ndata],maxit,mod,NOISESEQ[NOISE],mode),sep=" "))
          #OUT_PAR_SEED=args[1]  0
          #START_Nf1=args[2] 5 10 15
          #START_Nf2=args[3] 5 10 15
          #START_Nm=args[4]  4 2  2
          #START_Ndata=args[5]  1:500,1000,2000;2:1000,2000,5000;3:5000,10000,20000
          sink()
        }
      }
    }
  }
  sink(paste0("subsem",mode,".sh"))
  for(ndata in 1:n_data){
    for(mod in mod_vec){
      for(NOISE in 1:n_noise){
        for(i in 1:nrep){
          cat(paste0("bsub < sem_",ndata,"_",i,"_",NOISE,"_",mod,"_",mode,".job",sep=''))
          cat("\n")
        }
      }
    }
  }
  sink()
}

semjobg35(mode=0)
semjobg35(mode=1)
semjobg35(mode=2)

semjobgspe<-function(wd="C:/Users/Administrator/Desktop/sem/job20190423spe",
                    nrep=50,maxit=2000,mode=0,bigmem=TRUE){
  # setwd("/Users/user/Downloads/down/script/r1temp/")
  setwd(wd)

  NOISESEQ=c(1,0.2)###########THE TRUE NOISE VALUE HAS BEEN MULTIPLIED BY 10,BECAUSE THE PARAMETER
  #must be an integer
  ndatavec=c(200,600,2000)
  n_data=length(ndatavec)
  #mod_vec=c(3,7) in job1
  mod_vec=c(3)#in file D:/Documents/Downloads/semjob/job2
  n_noise=2
  for(ndata in 1:n_data){
    for(mod in mod_vec){

      for(NOISE in 1:n_noise){
        for(i in 1:nrep){
          sink(paste0("sem_",ndata,"_",i,"_",NOISE,"_",mod,"_",mode,".job",sep=''))
          cat("#!/bin/bash")
          cat("\n")
          cat(paste0("#BSUB -J t",ndata,"_",i,"_",NOISE,"_",mod,"_",mode,"job"))
          cat("\n")
          cat("#BSUB -e %J.err")
          cat("\n")
          cat("#BSUB -o %J.out")
          cat("\n")
          cat("#BSUB -n 1")
          cat("\n")
          cat("#BSUB -N")
          cat("\n")
          if(bigmem==TRUE){
            cat("#BSUB -q debug")#queue bigmem
            cat("\n")
            #cat("#BSUB -R \"rusage[mem=1000] span[hosts=1]\"")#
            #cat("\n")
          }
          cat("#BSUB -W 00:29")
          cat("\n")
          cat("#BSUB -u yxz346@miami.edu")
          cat("\n")
          cat(paste0("cd /scratch/tmp/pudge/sem/src"))
          cat("\n")
          cat("module rm gcc/4.4.7")
          cat("\n")
          cat("module load R/3.5.1")
          cat("\n")
          cat("module load intel")
          cat("\n")
          cat("module load gcc/4.9.4")
          cat("\n")
          cat("cat ~/.R/Makevars")
          cat("\n")
          cat(paste0("/share/opt/R/3.5.1/bin/Rscript modsimu_lslx_lslspe.R "))
          cat(paste0( c(i,ndatavec[ndata],maxit,mod,NOISESEQ[NOISE],mode),sep=" "))
          #OUT_PAR_SEED=args[1]  0
          #START_Nf1=args[2] 5 10 15
          #START_Nf2=args[3] 5 10 15
          #START_Nm=args[4]  4 2  2
          #START_Ndata=args[5]  1:500,1000,2000;2:1000,2000,5000;3:5000,10000,20000
          sink()
        }
      }
    }
  }
  sink(paste0("subsem",mode,".sh"))
  for(ndata in 1:n_data){
    for(mod in mod_vec){
      for(NOISE in 1:n_noise){
        for(i in 1:nrep){
          cat(paste0("bsub < sem_",ndata,"_",i,"_",NOISE,"_",mod,"_",mode,".job",sep=''))
          cat("\n")
        }
      }
    }
  }
  sink()
}

semjobgspe(mode=0)
semjobgspe(mode=1)

library(fanc)
#gcc /4.9.4
semgenejobg<-function(wd="D:/Documents/Downloads/semjob/semgene/job",
                  nl=30,maxit=10000,mode=0,bigmem=TRUE){
  # setwd("/Users/user/Downloads/down/script/r1temp/")
  setwd(wd)
  for(meanStruct in 0:0){
  for(pathid in c(2,3,5,6)){
    for(tissuenum in 1:53){
          sink(paste0("sem_",nl,"_",maxit,"_",meanStruct,"_",pathid,"_",tissuenum,"_",mode,".job",sep=''))
          cat("#!/bin/bash")
          cat("\n")
          cat(paste0("#BSUB -J t",nl,"_",maxit,"_",meanStruct,"_",pathid,"_",tissuenum,"_",mode,"job"))
          cat("\n")
          cat("#BSUB -e %J.err")
          cat("\n")
          cat("#BSUB -o %J.out")
          cat("\n")
          cat("#BSUB -n 1")
          cat("\n")
          cat("#BSUB -N")
          cat("\n")
          if(bigmem==TRUE){
            cat("#BSUB -q bigmem")#queue bigmem
            cat("\n")
            cat("#BSUB -R \"rusage[mem=2000] span[hosts=1]\"")#
            cat("\n")
          }
          cat("#BSUB -W 40:00")
          cat("\n")
          cat("#BSUB -u yxz346@miami.edu")
          cat("\n")
          cat(paste0("cd /scratch/tmp/pudge/sem/semgene/src"))
          cat("\n")
          cat("module rm gcc/4.4.7")
          cat("\n")
          cat("module load R/3.3.1")
          cat("\n")
          cat("module load intel")
          cat("\n")
          cat("module load gcc/4.9.4")
          cat("\n")
          cat("cat ~/.R/Makevars")
          cat("\n")
          cat(paste0("/share/opt/R/3.3.1/bin/Rscript realdatagene.R "))
          cat(paste0( c(1,nl,maxit,15,meanStruct,mode,pathid,tissuenum),sep=" "))
          #OUT_PAR_SEED=args[1]  0
          #START_Nf1=args[2] 5 10 15
          #START_Nf2=args[3] 5 10 15
          #START_Nm=args[4]  4 2  2
          #START_Ndata=args[5]  1:500,1000,2000;2:1000,2000,5000;3:5000,10000,20000
          sink()
        }
      }
    }

  sink(paste0("subsem",mode,".sh"))
  for(meanStruct in 0:0){
    for(pathid in c(2,3,5,6)){
      for(tissuenum in 1:53){
        cat(paste0("bsub < sem_",nl,"_",maxit,"_",meanStruct,"_",pathid,"_",tissuenum,"_",mode,".job"))
        cat("\n")
      }
    }
  }
  sink()
  #testscript
  nl=2
  maxit=2
  pathid=6
  tissuesnum=53
  for(meanStruct in 0:1){
    sink(paste0("sem_",nl,"_",maxit,"_",meanStruct,"_",pathid,"_",tissuenum,"_",mode,".job",sep=''))
    cat("#!/bin/bash")
    cat("\n")
    cat(paste0("#BSUB -J t",nl,"_",maxit,"_",meanStruct,"_",pathid,"_",tissuenum,"_",mode,"job"))
    cat("\n")
    cat("#BSUB -e %J.err")
    cat("\n")
    cat("#BSUB -o %J.out")
    cat("\n")
    cat("#BSUB -n 1")
    cat("\n")
    cat("#BSUB -N")
    cat("\n")
    if(bigmem==TRUE){
      cat("#BSUB -q bigmem")#queue bigmem
      cat("\n")
      cat("#BSUB -R \"rusage[mem=1000] span[hosts=1]\"")#
      cat("\n")
    }
    cat("#BSUB -W 40:00")
    cat("\n")
    cat("#BSUB -u yxz346@miami.edu")
    cat("\n")
    cat(paste0("cd /scratch/tmp/pudge/sem/semgene/src"))
    cat("\n")
    cat("module rm gcc/4.4.7")
    cat("\n")
    cat("module load R/3.3.1")
    cat("\n")
    cat("module load intel")
    cat("\n")
    cat("module load gcc/4.9.3")
    cat("\n")
    cat("cat ~/.R/Makevars")
    cat("\n")
    cat(paste0("/share/opt/R/3.3.1/bin/Rscript realdatagene.R "))
    cat(paste0( c(1,nl,maxit,15,meanStruct,mode,pathid,tissuenum),sep=" "))
    #OUT_PAR_SEED=args[1]  0
    #START_Nf1=args[2] 5 10 15
    #START_Nf2=args[3] 5 10 15
    #START_Nm=args[4]  4 2  2
    #START_Ndata=args[5]  1:500,1000,2000;2:1000,2000,5000;3:5000,10000,20000
    sink()
  }
}
semgenejobg(mode=0)
semgenejobg(mode=1)

semgenejobtes<-function(wd="D:/Documents/Downloads/semjob/jobtestis/",
                      nl=100,maxit=2000,bigmem=TRUE){
  # setwd("/Users/user/Downloads/down/script/r1temp/")
  setwd(wd)
  w1s=c(0.0001,0.1)
  for(w1 in 1:length(w1s)){
    for(mode in 0:1){
    for(dataset in 3:3){

        sink(paste0("b_",w1,"_",mode,"_",dataset,"_",nl,".job",sep=''))
        cat("#!/bin/bash")
        cat("\n")
        cat(paste0("#BSUB -J t",w1,"_",mode,"_",dataset,"_",nl,"job"))
        cat("\n")
        cat("#BSUB -e %J.err")
        cat("\n")
        cat("#BSUB -o %J.out")
        cat("\n")
        cat("#BSUB -n 1")
        cat("\n")
        cat("#BSUB -N")
        cat("\n")
        if(bigmem==TRUE){
          cat("#BSUB -q bigmem")#queue bigmem
          cat("\n")
          cat("#BSUB -R \"rusage[mem=3000] span[hosts=1]\"")#
          cat("\n")
        }
        cat("#BSUB -W 72:00")
        cat("\n")
        cat("#BSUB -u yxz346@miami.edu")
        cat("\n")
        cat(paste0("cd /scratch/tmp/pudge/sem/semgene/testis"))
        cat("\n")
        cat("module rm gcc/4.4.7")
        cat("\n")
        cat("module load R/3.3.1")
        cat("\n")
        cat("module load intel")
        cat("\n")
        cat("module load gcc/4.9.4")
        cat("\n")
        cat("cat ~/.R/Makevars")
        cat("\n")
        cat(paste0("/share/opt/R/3.3.1/bin/Rscript realdatagene2.R "))
        cat(paste0( c(1,nl,maxit,15,0,mode,w1s[w1],dataset),sep=" "))
        #OUT_PAR_SEED=args[1]  0
        #START_Nf1=args[2] 5 10 15
        #START_Nf2=args[3] 5 10 15
        #START_Nm=args[4]  4 2  2
        #START_Ndata=args[5]  1:500,1000,2000;2:1000,2000,5000;3:5000,10000,20000
        sink()
    }
    }
    }
  sink("subsemgene.sh")
  for(w1 in 1:length(w1s)){
    for(mode in 0:1){
    for(dataset in 3:3){
        cat(paste0("bsub < b_",w1,"_",mode,"_",dataset,"_",nl,".job"))
        cat("\n")
    }
    }
  }

  sink()
  #testscript nl=2 mode= dataset-1
  w1=1
  for(dataset in 3:3){

    sink(paste0("bt_",w1,"_",dataset-1,"_",dataset,"_",2,".job",sep=''))
    cat("#!/bin/bash")
    cat("\n")
    cat(paste0("#BSUB -J t",w1,"_",dataset-1,"_",dataset,"_",2,"job"))
    cat("\n")
    cat("#BSUB -e %J.err")
    cat("\n")
    cat("#BSUB -o %J.out")
    cat("\n")
    cat("#BSUB -n 1")
    cat("\n")
    cat("#BSUB -N")
    cat("\n")
    if(bigmem==TRUE){
      cat("#BSUB -q bigmem")#queue bigmem
      cat("\n")
      cat("#BSUB -R \"rusage[mem=3000] span[hosts=1]\"")#
      cat("\n")
    }
    cat("#BSUB -W 40:00")
    cat("\n")
    cat("#BSUB -u yxz346@miami.edu")
    cat("\n")
    cat(paste0("cd /scratch/tmp/pudge/sem/semgene/testis"))
    cat("\n")
    cat("module rm gcc/4.4.7")
    cat("\n")
    cat("module load R/3.3.1")
    cat("\n")
    cat("module load intel")
    cat("\n")
    cat("module load gcc/4.9.4")
    cat("\n")
    cat("cat ~/.R/Makevars")
    cat("\n")
    cat(paste0("/share/opt/R/3.3.1/bin/Rscript realdatagene2.R "))
    cat(paste0( c(1,2,2,15,0,dataset-1,w1s[w1],dataset),sep=" "))
    #OUT_PAR_SEED=args[1]  0
    #START_Nf1=args[2] 5 10 15
    #START_Nf2=args[3] 5 10 15
    #START_Nm=args[4]  4 2  2
    #START_Ndata=args[5]  1:500,1000,2000;2:1000,2000,5000;3:5000,10000,20000
    sink()
  }
  sink("subsemgenetest.sh")
  for(dataset in 3:3){
        cat(paste0("bsub < bt_",w1,"_",dataset-1,"_",dataset,"_",2,".job"))
        cat("\n")
      }
  sink()


}
semgenejobtes()

######required to generate paper
#run geplot

regu_mae<-function(x,truex){
  if(length(x)==0){
    print("00 ")
    #stop("zero length input!")
    return(NA)
  }
  x=as.double(x)
  r=mean(abs((x[pars_pen]-truex[pars_pen])))
  if(is.na(r)){
    print(x[pars_pen])
    print(truex[pars_pen])
  }
  r
}
r_mae<-function(x,truex){
  if(length(x)==0){
    print("00 ")
    #stop("zero length input!")
    return(NA)
  }
  if(is.na(x[1])){
    print("00000")
    #stop("zero length input!")
    return(NA)}
  x=as.double(x)
  if(length(x)==0){return(NA)}
  #print(x)
  #mean(abs(x-truex))
  #round(mean(((x[pars_pen]-truex[pars_pen]))^2),3)
  zeroind=which(abs(truex[pars_pen])<5e-4)
  nonzero=which(abs(truex[pars_pen])>=5e-4)
  FP=length(which(abs(x[zeroind])>=5e-4)) 
  TN=length(which(abs(x[zeroind])<5e-4))
  FN=length(which(abs(x[nonzero])<5e-4)) 
  TP=length(which(abs(x[nonzero])>=5e-4)) 
  round( FP/(FP+TP) , 3)
}
total_mae<-function(x,truex){
  if(length(x)==0){
    print("00 ")
    #stop("zero length input!")
    return(NA)
  }
  if(is.na(x[1])){
    print("00000")
    #stop("zero length input!")
    return(NA)}
  x=as.double(x)
  if(length(x)==0){return(NA)}
  #print(x)
  #mean(abs(x-truex))
 # round(mean(((x[-pars_pen]-truex[-pars_pen]))^2),3)
  zeroind=which(abs(truex[pars_pen])<5e-4)
  nonzero=which(abs(truex[pars_pen])>=5e-4)
  FP=length(which(abs(x[zeroind])>=5e-4)) 
  TN=length(which(abs(x[zeroind])<5e-4))
  FN=length(which(abs(x[nonzero])<5e-4)) 
  TP=length(which(abs(x[nonzero])>=5e-4)) 
  round( (TP*TN-FP*FN)/(sqrt((TP+FP)*(TP+FN)*(TN+FP)*(TN+FN))), 3)
}

fd<-function(x,truex){
  if(length(x)==0){
    print("00 ")
    #stop("zero length input!")
    return(NA)
  }
  if(is.na(x[1])){
    print("00000")
    #stop("zero length input!")
    return(NA)}
  x=as.double(x[pars_pen])
  #print("in fd")
  #print(x)
  #print(length(x))
  
  zeroind=which(abs(truex[pars_pen])<5e-4)
  round(length(which(abs(x[zeroind])>=5e-4))/length(zeroind),3)

  #round(length(which(abs(x[pars_pen][zeroind])>=5e-4))/length(which(abs(x[pars_pen])>=5e-4)),3)
}

pow<-function(x,truex){
  if(length(x)==0){
    print("00 ")
    #stop("zero length input!")
    return(NA)
  }
  if(is.na(x[1])){
    print("00000")
    #stop("zero length input!")
    return(NA)}
  x=as.double(x[pars_pen])
  if(length(x)==0){return(NA)}
  zeroind=which(abs(truex[pars_pen])>=5e-4)
  p=length(which(abs(x[zeroind])>=5e-4))/length(zeroind)
  if(is.na(p)){
    print(x[zeroind])
    print(truex[pars_pen])
    return(NA)
  }else{
    return(round(p,3))
  }
}
posmin<-function(v){
  if(min(v,na.rm=TRUE)==Inf){
    print("improper!")
    return(NA)
  }
  which(v==min(v[v!=Inf&v>0],na.rm=TRUE))[1]
}
cbic<-function(a,n,special=FALSE){
  seq0=exp(  seq(log(0.5),log(0.01),length=30 ) )
  precision=5e-4
  x=a$coef
  if(length(x)==0){
    return (Inf)
  }
  x[a$pen][abs(x[a$pen])<precision]=0
  nvar=a$nx-sum( abs(x[a$pen])==0)
  npenvar=length(a$pen)-sum( abs(x[a$pen])==0)
  if(special==FALSE){
    return( 2*n*a$fit+log(n)*nvar )
  }else{
    return( 2*n*(a$fit-seq0[special]*sum(abs(x[a$pen])) ) +log(n)*nvar )
  }
}









makev<-function(v,numrow,nlam){
  m=matrix(v,nrow=numrow)
  vm=apply(m,1,mean,na.rm=TRUE)
  matrix(vm,nrow=nlam)
}
makepl<-function(mat,titl,n,lv,sequ,loc){
  plot(x=1:n,y=mat[,6],col=1,main=titl,ylim=c(0,1),xaxt='n',xlab="-log(lambda)",cex=0,pch=1)
  axis(1, at=1:n, labels=round(-log(sequ[lv]),2))
  lines(x=1:n,y=mat[,6],col=1,lwd=2)
  lines(x=1:n,y=mat[,1],col=2,lwd=4)
  lines(x=1:n,y=mat[,2],col=3,lwd=2)
  lines(x=1:n,y=mat[,3],col=4,lwd=2)
  lines(x=1:n,y=mat[,4],col=5,lwd=2)
  lines(x=1:n,y=mat[,5],col=6,lwd=2)
  lines(x=1:n,y=mat[,7],col="orange",lwd=2)
  legend(loc,legend=c("gs","cd","cdl","pg","pgn","cdm","lbfgs"),
         lty=1,ncol=2,col=c(1:6,"orange"),title="methods",cex=0.75,pt.cex=0.2)
}
drplot<-function(nd=200,noise=1,mod=1,nit=10000,pen_type=0,lv=12:17,sequ){
  setwd("D:/Documents/Downloads/semjob/d")
  lf=list.files()

    vfd=c()
    vpo=c()
    vms=c()
    for(i in 1:length(lf)){
      #for(i in 1:9){
      if(as.numeric( gsub("[^0-9]","",strsplit(lf[i],"_")[[1]][6]) )== mod
         &as.numeric( gsub("[^0-9]","",strsplit(lf[i],"_")[[1]][2]) )==nd
         &as.numeric( gsub("[^0-9]","",strsplit(lf[i],"_")[[1]][3]) )==nit
         &as.numeric( gsub("[^0-9]","",strsplit(lf[i],"_")[[1]][4]) )==noise
         &as.numeric( gsub("[^0-9]","",strsplit(lf[i],"_")[[1]][5]) )==pen_type

      ){
        load(lf[i])
        v1=c()
        v2=c()
        v3=c()
        for(i1 in 1:7){
          for(i2 in lv){
            v1=c(v1,fd(result1[[i1]][[i2]]$coef,truex))
            v2=c(v2,pow(result1[[i1]][[i2]]$coef,truex))
            v3=c(v3,total_mae(result1[[i1]][[i2]]$coef,truex))
          }
        }
        vfd=c(vfd,v1)
        vpo=c(vpo,v2)
        vms=c(vms,v3)
      }

    }

  mfd=makev(vfd,7*length(lv),length(lv))
  mpo=makev(vpo,7*length(lv),length(lv))
  mms=makev(vms,7*length(lv),length(lv))
  tt=c(" lasso"," scad")
  mf<-function(a){
    if(a==7){
      return (3)
    }else{
      if(a==3){
        return (1)
      }else{
        if(a==6){
          return (2)
        }
      }
    }
    11
  }
  makepl(mfd,paste0("FDR N=",nd," mod",mf(mod),tt[pen_type+1]),length(lv),lv,sequ,"topleft")
  makepl(mpo,paste0("POW N=",nd," mod",mf(mod),tt[pen_type+1]),length(lv),lv,sequ,"bottomright")
  #makepl(mms,"MSE",sequ)

}
sequ=exp(  seq(log(10),log(0.001),length=30 ) )

v=c(-1,2,Inf,NA,2,-1)
v=rep(Inf,4)

posmin(v)

cnt<-function(v){
  n=length(v)
  n1=length(which(v==-1))
  n2=length(which(v==-2))
  n3=length(which(v==-3))
  n0=length(which(v==0))
  return(c(n1/n,n2/n,n3/n,n0/n))
}


load("46_600_1000_100_0_7.RData")
length(result1)
result1[[1]]






library(semPlot)

########## in paper noise

geplot<-function(k1=200,k3=1,nm=1,pen_type=0,len=20,debug=FALSE,pr=FALSE,compute=TRUE ){
  
  setwd("C:/Users/Administrator/Desktop/sem/paper_simu_final")
  #setwd("C:/Users/Administrator/Desktop/sem/paper_result_exta2")
  lf=list.files()
  nm=nm
  
  bicv=list(numeric(0),numeric(0),numeric(0),numeric(0),numeric(0),numeric(0),numeric(0),numeric(0),numeric(0))
  proper_rate=rmsev=msev=powv=fdv=tv=bicv
  for(k2 in nm:nm){
    
    for(i in 1:length(lf)){
      #for(i in 1:9){
      if(as.numeric( gsub("[^0-9]","",strsplit(lf[i],"_")[[1]][6]) )== k2 #modnum
         &as.numeric( gsub("[^0-9]","",strsplit(lf[i],"_")[[1]][2]) )==k1#ndata
         &as.numeric( gsub("[^0-9]","",strsplit(lf[i],"_")[[1]][3]) )==2000#maxit
         &as.numeric( gsub("[^0-9]","",strsplit(lf[i],"_")[[1]][4]) )==k3#noise*100
         &as.numeric( gsub("[^0-9]","",strsplit(lf[i],"_")[[1]][5]) )==pen_type#0lasso 1 scad
         
      ){
        #print(lf[i])
        load(lf[i])
        result0=result1
        print(length(result0))
        #if(length(result0[[1]])==30){
        #    next
        #}
        pars_pen<<-pars_pen_mod
        biclist=c()
        states=c()
        #load(paste0("C:/Users/Administrator/Desktop/sem/resultdbug/",lf[i]))
        
        
      
       
       
        
        method_text=c()
        
        if(pen_type==0){
          nmethods=9
          method_text[1]="regsem1"
          method_text[2]="regsem2"
          method_text[3]="regsem3"
          method_text[4]="regsem4"
          method_text[5]="regsem5"
          method_text[6]="gradsamp"
          method_text[7]="lbfgs"
          method_text[8]='lslx'
          method_text[9]='lsl'
        }
        if(pen_type==1){
          nmethods=7
          method_text[1]="regsem1"
          method_text[2]="regsem2"
          method_text[3]="regsem3"
          method_text[4]="regsem4"
          method_text[5]="regsem5"
          method_text[6]="gradsamp"
          method_text[7]='lsl'
        }
        if(pen_type==2){
          nmethods=8
          method_text[1]="regsem1"
          method_text[2]="regsem2"
          method_text[3]="regsem3"
          method_text[4]="regsem4"
          method_text[5]="regsem5"
          method_text[6]="gradsamp"
          method_text[7]='lslx'
          method_text[8]='lsl'
        }
        for(j in c(1:nmethods)){
          for(k in 1:len){
            biclist=c(biclist,result0[[j]][[k]]$bic)
            states=c(states,result0[[j]][[k]]$status)  
          }  
          
        }
        
        #print(nmethods)
        
        m=matrix(biclist,nrow=len)
        statem= matrix(states,nrow=len)
        
        #print(m)
        #print(statem)
        mink=apply(m,2,posmin)
        lslxmod3 =  c(35 , 36 , 37,  38,  39,  40,  41,  42,  47,  48,  43,  44,  45,  49,  50,  51,  59,
                      60,  52,  53  ,54 , 55  ,56 , 57,  62,
                      63 , 64  ,65 , 66  ,67 , 68  ,69 , 74,  75,  70,  71,  72,  76,  77,  78,  86,  87,  79,
                      80  ,81 , 82  ,83 , 84  ,19 , 22,
                      25 , 30  ,32 , 20,  23 , 26  ,28 , 33,  21,  24,  27,  29  ,31 , 97  ,98 , 99 ,
                      100, 101, 102, 103, 104, 105, 106, 107, 108,
                      109 ,110, 111, 112, 113, 114,  88  ,91 , 93  ,94 , 95  ,96 , 89  ,92 , 90,   1,   2
                      ,3  , 4 ,  5  , 6 ,  7  , 8   ,9  ,10,
                      11  ,12 , 13  ,14 , 15  ,16 , 17,  18)
        b1=c(1:8,12:13,9:11,14:16,23:24,17:22)
        b2=b1+24
        b3=18+c(49,52,55,60,62)#f4
        b4=18+c(50,53,56,58,63)#f5
        b5=18+c(51,54,57,59,61)#f6
        b6=18+c(64,67,69,70,71,72,65,68,66)
        b7=c(49:66)
        b8=c(91:108)
        lslmod3 = c(b1,b2,b3,b4,b5,b6,b7,b8)
        for(j in c(1:nmethods)){
          if((pen_type==0 & j<8)|(pen_type==1 & j<7)|(pen_type==2 & j<7)){
            fdv[[j]]=c(fdv[[j]],fd(result0[[j]][[mink[j]]]$coef,result0[[j]][[mink[j]]]$tx))
            powv[[j]]=c(powv[[j]],pow(result0[[j]][[mink[j]]]$coef,result0[[j]][[mink[j]]]$tx))
            msev[[j]]=c(msev[[j]],total_mae(result0[[j]][[mink[j]]]$coef,result0[[j]][[mink[j]]]$tx))#MCC
            rmsev[[j]]=c(rmsev[[j]],r_mae(result0[[j]][[mink[j]]]$coef,result0[[j]][[mink[j]]]$tx))#FDR
            proper_rate[[j]]=1-sum(statem[,j]<0)/length(statem[,j])
          }
          if((pen_type==0 & j==9)|(pen_type==1 & j==7)|(pen_type==2 & j==8)){#lsl
            fdv[[j]]=c(fdv[[j]],fd(result1[[1]][[mink[j]]]$coef[lslmod3],result1[[1]][[mink[j]]]$tx))
            powv[[j]]=c(powv[[j]],pow(result1[[1]][[mink[j]]]$coef[lslmod3],result1[[1]][[mink[j]]]$tx))
            msev[[j]]=c(msev[[j]],total_mae(result1[[1]][[mink[j]]]$coef[lslmod3],result1[[1]][[mink[j]]]$tx))
            rmsev[[j]]=c(rmsev[[j]],r_mae(result1[[1]][[mink[j]]]$coef[lslmod3],result1[[1]][[mink[j]]]$tx))
            proper_rate[[j]]=1-sum(statem[,j]<0)/length(statem[,j])
          }
          if((pen_type==0 & j==8)|(pen_type==2 & j==7)){#lslx
            #j==9
            fdv[[j]]=c(fdv[[j]],fd(result0[[j]][[mink[j]]]$coef[lslxmod3],result0[[j]][[mink[j]]]$tx))
            powv[[j]]=c(powv[[j]],pow(result0[[j]][[mink[j]]]$coef[lslxmod3],result0[[j]][[mink[j]]]$tx))
            msev[[j]]=c(msev[[j]],total_mae(result0[[j]][[mink[j]]]$coef[lslxmod3],result0[[j]][[mink[j]]]$tx))
            rmsev[[j]]=c(rmsev[[j]],r_mae(result0[[j]][[mink[j]]]$coef[lslxmod3],result0[[j]][[mink[j]]]$tx))
            proper_rate[[j]]=1-sum(statem[,j]<0)/length(statem[,j])
          }
          
          
          bicv[[j]]=c(bicv[[j]],result0[[j]][[mink[j]]]$bic)
          tv[[j]]=c(tv[[j]],result0[[j]][[mink[j]]]$t0[1])
          if(debug){
            print(paste0(result0[[j]][[mink[j]]]$method," fd: ",fdv[[j]][length(fdv[[j]])],
                         " pow: ",powv[[j]][length(powv[[j]])],
                         "mse",msev[[j]][-1]," t: ",result0[[j]][[mink[j]]]$t0[1]," l: ",result0[[j]][[mink[j]]]$l))
          }
          
        }
      }
      
      
    }#k2
  }
    print(fdv)
    print(powv)
    print(msev)
    l1=list()
    l1[[1]]=lapply(fdv,mean,na.rm=TRUE)
    l1[[1]]=lapply(l1[[1]],round,digits=3)
    print("fd")
    print( lapply(fdv,mean,na.rm=TRUE) )
    l1[[2]]=lapply(powv,mean,na.rm=TRUE)
    l1[[2]]=lapply(l1[[2]],round,digits=3)
    print("pow")
    print( lapply(powv,mean,na.rm=TRUE) )
    
    l1[[3]]=lapply(msev,mean,na.rm=TRUE)
    l1[[3]]=lapply(l1[[3]],round,digits=4)
    print("MCC")
    print( lapply(msev,mean,na.rm=TRUE) )
    
    l1[[4]]=lapply(bicv,mean)
    l1[[4]]=lapply(l1[[4]],round,digits=1)
    print("opt ebic")
    print( l1[[4]] )
    l1[[5]]=lapply(tv,mean)
    l1[[5]]=lapply(l1[[5]],round,digits=1)
    print("timing")
    print( lapply(tv,mean) )
    
    l1[[6]]=lapply(rmsev,mean,na.rm=TRUE)
    l1[[6]]=lapply(l1[[6]],round,digits=4)
    print("FDR")
    print( lapply(rmsev,mean,na.rm=TRUE) )
    l1[[7]]=lapply(proper_rate,mean,na.rm=TRUE)
    l1[[7]]=lapply(l1[[7]],round,digits=6)
    print("proper")
    print( lapply(proper_rate,mean,na.rm=TRUE) )
    textii=c("FPR","TPR","MCC","BIC","timings","FDR","imp")
    if(pen_type==0){
      prange=c(6,1:5,7,8,9)}
    if(pen_type==1){
      prange=c(6,1:5,7)
    }
    if(pen_type==2){
      prange=c(6,1:5,7,8)
    }
    if(pr==TRUE){
      sink(paste0("../table/tab",k1,"_",k3,'_',nm,"_",pen_type,".txt"))
      for( ii in c(6,2,7)){
        cat('\\hline')
        cat('\n')
        cat(textii[ii])
        cat(" & ")
        for(p in prange){
          #print('debug1')
          #print(paste0(ii,p))
          if(ii==3){
            #print(paste0(ii,p))
            if(l1[[ii]][[p]]>10000){
              cat("$>10^4$")
            }else{
              cat(l1[[ii]][[p]])
            }
          }else{
            cat(l1[[ii]][[p]])
          }
          if(p < tail(prange,1)){
            cat( " & ")
          }
          
        }
        cat("\\\\")
        cat("\n")
      }
      sink()
    }
  
  list(fpr=unlist(l1[[1]]),fdr=unlist(l1[[6]]),pow=unlist(l1[[2]]),imp=unlist(l1[[7]]),
       time=unlist(l1[[5]]),methods=method_text)
  
}


paperplot<-function(k1_list=c(150,200,500,2000),k3=40,pen_type=0,len=20,compute=TRUE){
  re=list()
  for(idx in 1:length(k1_list)){
    
    a=geplot(k1=k1_list[idx],k3=k3,nm=3,pen_type=pen_type,debug=FALSE,pr=TRUE)
    re[[idx]]=a$fpr
  }
  mr=matrix(unlist(re),nrow=4,byrow = T)
  plot(x=c(1:4),y=mr[1,],ylim=c(0,1),main='fpr',xlab=N,axis())
}
r1=paperplot(pen_type=0)
plot(x=c(1:9),y=a$fpr,main='fpr')

a=geplot(k1=150,k3=40,nm=3,pen_type=0,debug=FALSE,pr=TRUE)
geplot(k1=200,k3=40,nm=3,pen_type=0,debug=FALSE,pr=TRUE)
geplot(k1=500,k3=40,nm=3,pen_type=0,debug=FALSE,pr=TRUE)
geplot(k1=2000,k3=40,nm=3,pen_type=0,debug=FALSE,pr=TRUE)


geplot(k1=150,k3=40,nm=3,pen_type=1,debug=FALSE,pr=TRUE)
geplot(k1=200,k3=40,nm=3,pen_type=1,debug=FALSE,pr=TRUE)
geplot(k1=500,k3=40,nm=3,pen_type=1,debug=FALSE,pr=TRUE)
geplot(k1=2000,k3=40,nm=3,pen_type=1,debug=FALSE,pr=TRUE)


geplot(k1=150,k3=40,nm=3,pen_type=2,debug=FALSE,pr=TRUE)
geplot(k1=200,k3=40,nm=3,pen_type=2,debug=FALSE,pr=TRUE)
geplot(k1=500,k3=40,nm=3,pen_type=2,debug=FALSE,pr=TRUE)
geplot(k1=2000,k3=40,nm=3,pen_type=2,debug=FALSE,pr=TRUE)

geplot(k1=150,k3=100,nm=3,pen_type=2,debug=FALSE,pr=TRUE)
geplot(k1=200,k3=100,nm=3,pen_type=2,debug=FALSE,pr=TRUE)
geplot(k1=500,k3=100,nm=3,pen_type=2,debug=FALSE,pr=TRUE)
geplot(k1=2000,k3=100,nm=3,pen_type=2,debug=FALSE,pr=TRUE)

geplot(k1=150,k3=40,nm=3,pen_type=2,debug=FALSE,pr=TRUE)
geplot(k1=200,k3=40,nm=3,pen_type=2,debug=FALSE,pr=TRUE)
geplot(k1=500,k3=40,nm=3,pen_type=2,debug=FALSE,pr=TRUE)
geplot(k1=2000,k3=40,nm=3,pen_type=2,debug=FALSE,pr=TRUE)


geplot(k1=150,k3=1,nm=3,pen_type=0,debug=FALSE,pr=TRUE)
geplot(k1=150,k3=1,nm=3,pen_type=0,debug=FALSE,pr=TRUE)
geplot(k1=200,k3=1,nm=3,pen_type=0,debug=FALSE,pr=TRUE)
geplot(k1=500,k3=1,nm=3,pen_type=0,debug=FALSE,pr=TRUE)
geplot(k1=2000,k3=1,nm=3,pen_type=0,debug=FALSE,pr=TRUE)
geplot(k1=150,k3=10,nm=3,pen_type=0,debug=FALSE,pr=TRUE)
geplot(k1=150,k3=10,nm=3,pen_type=0,debug=FALSE,pr=TRUE)
geplot(k1=200,k3=10,nm=3,pen_type=0,debug=FALSE,pr=TRUE)
geplot(k1=500,k3=10,nm=3,pen_type=0,debug=FALSE,pr=TRUE)
geplot(k1=2000,k3=10,nm=3,pen_type=0,debug=FALSE,pr=TRUE)
geplot(k1=150,k3=100,nm=3,pen_type=0,debug=FALSE,pr=TRUE)
geplot(k1=200,k3=100,nm=3,pen_type=0,debug=FALSE,pr=TRUE)
geplot(k1=500,k3=100,nm=3,pen_type=0,debug=FALSE,pr=TRUE)
geplot(k1=2000,k3=100,nm=3,pen_type=0,debug=FALSE,pr=TRUE)
####################end in paper

#k1 sample size k3 noise cv 1bic 2 cv nm model mode likelihood_cv for rmsea_cv pen_type 0 lasso 1 scad 2mcp



geplotdb<-function(k1=200,k3=1,nm=1,pen_type=0,len=30,debug=FALSE,pr=FALSE,compute=TRUE){
  #setwd("D:/Documents/Downloads/semjob/j20190107")
  setwd("C:/Users/Administrator/Desktop/sem/resultdbug")
  lf=list.files()
  nm=nm
  
  bicv=list(numeric(0),numeric(0),numeric(0),numeric(0),numeric(0),numeric(0),numeric(0),numeric(0),numeric(0))
  proper_rate=rmsev=msev=powv=fdv=tv=bicv
  for(k2 in nm:nm){
    
    for(i in 1:length(lf)){
      #for(i in 1:9){
      if(as.numeric( gsub("[^0-9]","",strsplit(lf[i],"_")[[1]][6]) )== k2 #modnum
         &as.numeric( gsub("[^0-9]","",strsplit(lf[i],"_")[[1]][2]) )==k1#ndata
         &as.numeric( gsub("[^0-9]","",strsplit(lf[i],"_")[[1]][3]) )==2000#maxit
         &as.numeric( gsub("[^0-9]","",strsplit(lf[i],"_")[[1]][4]) )==k3#noise*100
         &as.numeric( gsub("[^0-9]","",strsplit(lf[i],"_")[[1]][5]) )==pen_type#0lasso 1 scad
         
      ){
        print(lf[i])
        load(lf[i])
        load()
        result0=result1
        
        pars_pen<<-pars_pen_mod
        biclist=c()
        states=c()
        for(j in c(1:length(result1))){
          for(k in 1:len){
            if(compute==TRUE){
              biclist=c(biclist,cbic(result0[[j]][[k]],k1) )
            }else{
              biclist=c(biclist,result0[[j]][[k]]$bic)
            }
            states=c(states,result0[[j]][[k]]$r)
          }
        }
        m= matrix(biclist,nrow=len)
        statem= matrix(states,nrow=len)
        print(m)
        mink=apply(m,2,posmin)
        lslxmod3 =  c(35 , 36 , 37,  38,  39,  40,  41,  42,  47,  48,  43,  44,  45,  49,  50,  51,  59,
                      60,  52,  53  ,54 , 55  ,56 , 57,  62,
                      63 , 64  ,65 , 66  ,67 , 68  ,69 , 74,  75,  70,  71,  72,  76,  77,  78,  86,  87,  79,
                      80  ,81 , 82  ,83 , 84  ,19 , 22,
                      25 , 30  ,32 , 20,  23 , 26  ,28 , 33,  21,  24,  27,  29  ,31 , 97  ,98 , 99 ,
                      100, 101, 102, 103, 104, 105, 106, 107, 108,
                      109 ,110, 111, 112, 113, 114,  88  ,91 , 93  ,94 , 95  ,96 , 89  ,92 , 90,   1,   2
                      ,3  , 4 ,  5  , 6 ,  7  , 8   ,9  ,10,
                      11  ,12 , 13  ,14 , 15  ,16 , 17,  18)
        b1=c(1:8,12:13,9:11,14:16,23:24,17:22)
        b2=b1+24
        b3=18+c(49,52,55,60,62)#f4
        b4=18+c(50,53,56,58,63)#f5
        b5=18+c(51,54,57,59,61)#f6
        b6=18+c(64,67,69,70,71,72,65,68,66)
        b7=c(49:66)
        b8=c(91:108)
        lslmod3 = c(b1,b2,b3,b4,b5,b6,b7,b8)
        for(j in c(1:length(result1))){
          if(j<8){
            fdv[[j]]=c(fdv[[j]],fd(result0[[j]][[mink[j]]]$coef,result0[[j]][[mink[j]]]$tx))
            powv[[j]]=c(powv[[j]],pow(result0[[j]][[mink[j]]]$coef,result0[[j]][[mink[j]]]$tx))
            msev[[j]]=c(msev[[j]],total_mae(result0[[j]][[mink[j]]]$coef,result0[[j]][[mink[j]]]$tx))
            rmsev[[j]]=c(rmsev[[j]],r_mae(result0[[j]][[mink[j]]]$coef,result0[[j]][[mink[j]]]$tx))
            proper_rate[[j]]=sum(statem[,j]<0)/length(statem[,j])
          }else{
            if(j==8){
              fdv[[j]]=c(fdv[[j]],fd(result0[[j]][[mink[j]]]$coef[lslmod3],result0[[j]][[mink[j]]]$tx))
              powv[[j]]=c(powv[[j]],pow(result0[[j]][[mink[j]]]$coef[lslmod3],result0[[j]][[mink[j]]]$tx))
              msev[[j]]=c(msev[[j]],total_mae(result0[[j]][[mink[j]]]$coef[lslmod3],result0[[j]][[mink[j]]]$tx))
              rmsev[[j]]=c(rmsev[[j]],r_mae(result0[[j]][[mink[j]]]$coef[lslmod3],result0[[j]][[mink[j]]]$tx))
              proper_rate[[j]]=sum(statem[,j]<0)/length(statem[,j])
            }else{
              fdv[[j]]=c(fdv[[j]],fd(result0[[j]][[mink[j]]]$coef[lslxmod3],result0[[j]][[mink[j]]]$tx))
              powv[[j]]=c(powv[[j]],pow(result0[[j]][[mink[j]]]$coef[lslxmod3],result0[[j]][[mink[j]]]$tx))
              msev[[j]]=c(msev[[j]],total_mae(result0[[j]][[mink[j]]]$coef[lslxmod3],result0[[j]][[mink[j]]]$tx))
              rmsev[[j]]=c(rmsev[[j]],r_mae(result0[[j]][[mink[j]]]$coef[lslxmod3],result0[[j]][[mink[j]]]$tx))
              proper_rate[[j]]=sum(statem[,j]<0)/length(statem[,j])
            }
          }
          
          bicv[[j]]=c(bicv[[j]],result0[[j]][[mink[j]]]$bic)
          tv[[j]]=c(tv[[j]],result0[[j]][[mink[j]]]$t0[1])
          if(debug){
            print(paste0(result0[[j]][[mink[j]]]$method," fd: ",fdv[[j]][length(fdv[[j]])],
                         " pow: ",powv[[j]][length(powv[[j]])],
                         "mse",msev[[j]][-1]," t: ",result0[[j]][[mink[j]]]$t0[1]," l: ",result0[[j]][[mink[j]]]$l))
          }
        }
      }
    }
    
    
  }#k2
  print(fdv)
  print(powv)
  print(msev)
  l1=list()
  l1[[1]]=lapply(fdv,mean,na.rm=TRUE)
  l1[[1]]=lapply(l1[[1]],round,digits=3)
  print("fd")
  print( lapply(fdv,mean,na.rm=TRUE) )
  l1[[2]]=lapply(powv,mean,na.rm=TRUE)
  l1[[2]]=lapply(l1[[2]],round,digits=3)
  print("pow")
  print( lapply(powv,mean,na.rm=TRUE) )
  
  l1[[3]]=lapply(msev,mean,na.rm=TRUE)
  l1[[3]]=lapply(l1[[3]],round,digits=4)
  print("vmse")
  print( lapply(msev,mean,na.rm=TRUE) )
  
  l1[[4]]=lapply(bicv,mean)
  l1[[4]]=lapply(l1[[4]],round,digits=1)
  print("opt ebic")
  print( l1[[4]] )
  l1[[5]]=lapply(tv,mean)
  l1[[5]]=lapply(l1[[5]],round,digits=1)
  print("timing")
  print( lapply(tv,mean) )
  
  l1[[6]]=lapply(rmsev,mean,na.rm=TRUE)
  l1[[6]]=lapply(l1[[6]],round,digits=4)
  print("cmse")
  print( lapply(rmsev,mean,na.rm=TRUE) )
  l1[[7]]=lapply(proper_rate,mean,na.rm=TRUE)
  l1[[7]]=lapply(l1[[7]],round,digits=4)
  print("proper")
  print( lapply(proper_rate,mean,na.rm=TRUE) )
  textii=c("FPR","TPR","MSE","BIC","timings","cMSE","imp")
  if(pen_type==0){
    prange=c(6,1:3,5,7,8,9)}else{
      prange=c(6,1:3,5,8,9)
    }
  if(pr==TRUE){
    sink(paste0("../tabdb",k1,"_",nm,"_",pen_type,".txt"))
    for( ii in c(1)){
      cat(textii[ii])
      cat(" & ")
      for(p in prange){
        if(ii==3){
          if(l1[[ii]][[p]]>10000){
            cat("$>10^4$")
          }else{
            cat(l1[[ii]][[p]])
          }
        }else{
          cat(l1[[ii]][[p]])
        }
        if(p < 9){
          cat( " & ")
        }
        
      }
      cat("\\\\")
      cat("\n")
    }
    sink()
  }
}

getwd()
######################################

geplot(k1=200,k3=40,nm=3,pen_type=0,debug=FALSE,pr=TRUE)
geplot(k1=500,k3=100,nm=3,pen_type=0,debug=FALSE,pr=TRUE)
geplot(k1=2000,k3=100,nm=3,pen_type=0,debug=FALSE,pr=TRUE)

geplot(k1=200,k3=100,nm=3,pen_type=1,debug=FALSE,pr=TRUE)
geplot(k1=500,k3=100,nm=3,pen_type=1,debug=FALSE,pr=TRUE)
geplot(k1=2000,k3=100,nm=3,pen_type=1,debug=FALSE,pr=TRUE)
 

 #########################################################
drplot(nd=200,noise=100,mod=7,nit=2000,pen_type=0,lv=c(8:27),sequ=sequ)
drplot(nd=600,noise=100,mod=7,nit=2000,pen_type=0,lv=c(8:27),sequ=sequ)

drplot(nd=200,noise=100,mod=7,nit=2000,pen_type=1,lv=c(8:27),sequ=sequ)
drplot(nd=600,noise=100,mod=7,nit=2000,pen_type=1,lv=c(8:27),sequ=sequ)

drplot(nd=200,noise=100,mod=3,nit=2000,pen_type=0,lv=c(8:27),sequ=sequ)
drplot(nd=600,noise=100,mod=3,nit=2000,pen_type=0,lv=c(8:27),sequ=sequ)

drplot(nd=200,noise=100,mod=3,nit=2000,pen_type=0,lv=c(1:30),sequ=sequ)
drplot(nd=600,noise=100,mod=3,nit=2000,pen_type=0,lv=c(1:30),sequ=sequ)


sequ=exp(  seq(log(0.5),log(0.01),length=30 ) )
drplot(nd=200,noise=100,mod=7,nit=2000,pen_type=1,lv=c(8:27),sequ=sequ)
drplot(nd=600,noise=100,mod=7,nit=2000,pen_type=1,lv=c(8:27),sequ=sequ)

drplot(nd=200,noise=100,mod=3,nit=2000,pen_type=1,lv=c(8:30),sequ=sequ)
drplot(nd=600,noise=100,mod=3,nit=2000,pen_type=1,lv=c(8:30),sequ=sequ)


geplot(k1=200,k3=100,nm=7,pen_type=0,debug=TRUE,pr=FALSE)
geplot(k1=500,k3=100,nm=7,pen_type=0,debug=TRUE,pr=FALSE)
geplot(k1=1000,k3=100,nm=7,pen_type=0,debug=TRUE,pr=FALSE)
geplot(k1=200,k3=100,nm=3,pen_type=1,debug=TRUE,pr=FALSE)
geplot(k1=500,k3=100,nm=3,pen_type=1,debug=TRUE,pr=FALSE)
geplot(k1=1000,k3=100,nm=3,pen_type=1,debug=TRUE,pr=FALSE)

geplot(k1=200,k3=100,nm=6,pen_type=0,debug=TRUE,pr=FALSE)
geplot(k1=500,k3=100,nm=6,pen_type=0,debug=TRUE,pr=FALSE)
geplot(k1=1000,k3=100,nm=6,pen_type=0,debug=TRUE,pr=FALSE)
geplot(k1=500,k3=300,nm=3,mode=1,pen_type=0,debug=FALSE,pr=TRUE)
geplot(k1=1000,k3=300,nm=3,mode=1,pen_type=0,debug=FALSE,pr=TRUE)


geplot(k1=200,k3=100,nm=3,mode=1,pen_type=0,debug=FALSE,pr=FALSE)
geplot(k1=500,k3=100,nm=3,mode=1,pen_type=0,debug=FALSE,pr=TRUE)
geplot(k1=1000,k3=100,nm=3,mode=1,pen_type=0,debug=FALSE,pr=TRUE)
geplot(k1=200,k3=70,nm=3,mode=1,pen_type=1,debug=FALSE,pr=FALSE)
geplot(k1=500,k3=70,nm=3,mode=1,pen_type=1,debug=FALSE,pr=TRUE)
geplot(k1=1000,k3=70,nm=3,mode=1,pen_type=1,debug=FALSE,pr=TRUE)
geplot(k1=5000,k3=70,nm=3,mode=1,pen_type=1,debug=FALSE,pr=TRUE)



geplot(k1=200,k3=70,nm=7,mode=1,pen_type=0,debug=FALSE,pr=TRUE)
geplot(k1=500,k3=70,nm=7,mode=1,pen_type=0,debug=FALSE,pr=TRUE)
geplot(k1=1000,k3=70,nm=7,mode=1,pen_type=0,debug=FALSE,pr=TRUE)


procreal<-function(){
  setwd("D:/Documents/Downloads/semjob/realdata")
  load("6_2436_10000_100_0_11_1.RData")
  result1[[6]]
}

geplot(k1=400,k3=100,nm=7,mode=1,pen_type=0,debug=TRUE)
geplot(k1=2000,k3=100,nm=7,mode=1,pen_type=0,debug=TRUE)
geplot(k1=10000,k3=100,nm=7,mode=1,pen_type=0,debug=TRUE)
pars_pen

geplot(k1=500,k3=100,nm=3,mode=1,pen_type=0,debug=TRUE,pr=FALSE)

################real data processing gene data
setwd("D:/Documents/Downloads/semjob/realdatagene")
load("gcta.RData")

x1=c(1,2,3,4,5)
x2=runif(5)
plot(x1,x2,ylim=c(0,1))
lines(x1,x2,lwd=2)
x2=runif(5)
lines(x1,x2,lwd=2,col='red')
x2=runif(5)
lines(x1,x2,lwd=2,col='green')
x2=runif(5)
lines(x1,x2,lwd=2,col='blue')
x2=runif(5)
lines(x1,x2,lwd=2,col='orange')



###############################cfamodel
setwd("D:/Documents/Downloads/semjob/cfad")
 load("1_2436_2000_100_1_11.RData")
 result1
 biclist=c()
 for(j in c(1:7)){
   for(k in 1:30){
     biclist=c(biclist,result1[[j]][[k]]$bic)

   }
 }
 m= matrix(biclist,nrow=30)
 print(m)
 mink=apply(m,2,posmin)
 i=6
 mink
 bic1=2*97757.504+result1[[1]][[28]]$bic
   bic2=2*97757.504+result1[[6]][[16]]$bic
c1=result1[[1]][[28]]$fit
c2=result1[[6]][[16]]$fit
 ndata=2436
 2*ndata*c1
 2*ndata*c2
 length(result1[[1]][[28]]$coef)
 cf1=result1[[1]][[28]]$coef
 cf2=result1[[6]][[16]]$coef
 length(which(cf1==0))
 length(which(cf2==0))
 df1=25*13-(165-1)
 df2=25*13-(165-32)
 ncp1=(2*ndata*c1-df1)/(ndata-1)
 ncp2=(2*ndata*c2-df2)/(ndata-1)
 sqrt(ncp1/df1)
 sqrt(ncp2/df2)
 baseline.chisq=18222.116
 baseline.df=300.000
 ncp.null=(baseline.chisq-baseline.df)/(ndata-1)
 cfi1=(ncp.null - ncp1) / ncp.null
 cfi2=(ncp.null - ncp2) / ncp.null
 as.numeric(lav.fits["unrestricted.logl"]
 )



 ##########semPath
 library(semPlot)
? semPaths
install.packages('BSgenome.Hsapiens.UCSC.hg19_1.4.0.tar.gz', repos = NULL, type="source")
