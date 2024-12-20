library("CMplot")
setwd("manhadun")
#Figure S20A
TajimasD <- read.table("TajimasD.111.snp.txt", 
                       header = TRUE)
TajimasD_plot <- CMplot(TajimasD,type="h",plot.type="m",file="pdf",LOG10=FALSE,
                   file.name="TajimasD.111.pdf",ylab="Tajima's D",threshold=3.85,amplify=FALSE,
         file.output=TRUE,verbose=TRUE,width=14,height=4)
#Figure S20B
nsl <- read.table("abs_nsl.111.2kb.txt", 
                 header = TRUE)
nsl_plot <- CMplot(nsl,type="h",plot.type="m",file="pdf",LOG10=FALSE,
                  file.name="nsl.111.pdf",ylab="|nSL|",threshold=2.11,amplify=FALSE,
                  file.output=TRUE,verbose=TRUE,width=14,height=4)
#Figure S18
XJXZ_xpnsl <- read.table("xpnsl.XJXZ.2kb.txt", 
                  header = TRUE)
XJXZ_xpnsl_plot <- CMplot(XJXZ_xpnsl,type="h",plot.type="m",file="pdf",LOG10=FALSE,
                   file.name="xpnsl.XJXZ.pdf",ylab="XP-nSL", threshold=c(2.325,-2.461),amplify=FALSE,
                   file.output=TRUE,verbose=TRUE,width=14,height=3)

XJQG_xpnsl <- read.table("cmplot.2kb.normxpnsl_XJ_QG.txt", 
                         header = TRUE)
XJQG_xpnsl_plot <- CMplot(XJQG_xpnsl,type="h",plot.type="m",file="pdf",LOG10=FALSE,
                          file.name="xpnsl.XJQG.pdf",ylab="XP-nSL", threshold=c(2.22,-2.52),amplify=FALSE,
                          file.output=TRUE,verbose=TRUE,width=14,height=3)
#Figure S10A
XJXZ_fst <- read.table("fst.XJXZ.2kb.txt", 
                         header = TRUE)
XJXZ_fst_plot <- CMplot(XJXZ_fst,type="h",plot.type="m",file="pdf",LOG10=FALSE,
                          file.name="fst.XJXZ.",ylab="XJ VS XZ Fst",threshold=0.0555,amplify=FALSE,
                          file.output=TRUE,verbose=TRUE,width=14,height=3,ylim=c(0, 0.6))

XJQG_fst <- read.table("XJQG.2kb.fst", 
                       header = TRUE)
XJQG_fst_plot <- CMplot(XJQG_fst,type="h",plot.type="m",file="pdf",LOG10=FALSE,
                        file.name="fst.XJQG",ylab="XJ VS QG Fst",threshold=0.0415865,amplify=FALSE,
                        file.output=TRUE,verbose=TRUE,width=14,height=3, ylim=c(0, 0.6))

QGXZ_fst <- read.table("sort_QGXZ_fst.txt", 
                       header = TRUE)
QGXZ_fst_plot <- CMplot(QGXZ_fst,type="h",plot.type="m",file="pdf",LOG10=FALSE,
                        file.name="fst.QGXZ",ylab="QG VS XZ Fst",threshold=0.02514,amplify=FALSE,
                        file.output=TRUE,verbose=TRUE,width=14,height=3,ylim=c(0, 0.6))

#Figure S18
XJXZ_dxy <- read.table("XJXZ_dxy_2kb.txt", 
                       header = TRUE)
XJXZ_dxy_plot <- CMplot(XJXZ_dxy,type="h",plot.type="m",file="pdf",LOG10=FALSE,
                        file.name="dxy.XJXZ.pdf",ylab="Dxy",
                        file.output=TRUE,verbose=TRUE,width=14,height=3,cex.axis = 1.2)

XJQG_dxy <- read.table("XJ_QG.2kb.pixy.txt", 
                       header = TRUE)
XJQG_dxy_plot <- CMplot(XJQG_dxy,type="h",plot.type="m",file="pdf",LOG10=FALSE,
                        file.name="dxy.XJQG.pdf",ylab="Dxy",
                        file.output=TRUE,verbose=TRUE,width=14,height=3,cex.axis = 1.2)

#Figure S1
TE_den <- read.table("111_TE_count.txt", 
                  header = TRUE)
TE_den_plot <- CMplot(TE_den,type="h",plot.type="m",file="pdf",LOG10=FALSE,
                   file.name="TE_den.111",ylab="TE Density",
                   file.output=TRUE,verbose=TRUE,width=14,height=3)

Gene_den <- read.table("111_gene_count.txt", 
                     header = TRUE)
Gene_den_plot <- CMplot(Gene_den,type="h",plot.type="m",file="pdf",LOG10=FALSE,
                      file.name="Gene_den.111",ylab="Gene Density",
                      file.output=TRUE,verbose=TRUE,width=14,height=3)

snp_den <- read.table("111.snp.density.txt", 
                       header = TRUE)
snp_den_plot <- CMplot(snp_den,type="h",plot.type="m",file="pdf",LOG10=FALSE,
                        file.name="snp_den.111",ylab="SNP Density",
                        file.output=TRUE,verbose=TRUE,width=14,height=3)

#Figure S19A
XZ_TajimaD <- read.table("cmplot.XZ_TajimaD.txt", 
                      header = TRUE)
XZ_TajimaD_plot <- CMplot(XZ_TajimaD,type="h",plot.type="m",file="pdf",LOG10=FALSE,
                       file.name="XZ_TajimaD",ylab="XZ Tajima's D",threshold=0,amplify=FALSE,
                       file.output=TRUE,verbose=TRUE,width=12,height=2.5)

XJ_TajimaD <- read.table("cmplot.XJ_TajimaD.txt", 
                         header = TRUE)
XJ_TajimaD_plot <- CMplot(XJ_TajimaD,type="h",plot.type="m",file="pdf",LOG10=FALSE,
                          file.name="XJ_TajimaD",ylab="XJ Tajima's D",threshold=0,amplify=FALSE,
                          file.output=TRUE,verbose=TRUE,width=12,height=2.5)

QG_TajimaD <- read.table("cmplot.QG_TajimaD.txt", 
                         header = TRUE)
QG_TajimaD_plot <- CMplot(QG_TajimaD,type="h",plot.type="m",file="pdf",LOG10=FALSE,
                          file.name="QG_TajimaD",ylab="QG Tajima's D",threshold=0,amplify=FALSE,
                          file.output=TRUE,verbose=TRUE,width=12,height=2.5)
#Figure S19B
QG_nsl <- read.table("cmplot.QG.nsl.2kb.txt", 
                         header = TRUE)
QG_nsl_plot <- CMplot(QG_nsl,type="h",plot.type="m",file="pdf",LOG10=FALSE,
                          file.name="QG_nsl",ylab="QG nSL",threshold=0,amplify=FALSE,
                          file.output=TRUE,verbose=TRUE,width=12,height=2.5)

XJ_nsl <- read.table("cmplot.XJ.nsl.2kb.txt", 
                     header = TRUE)
XJ_nsl_plot <- CMplot(XJ_nsl,type="h",plot.type="m",file="pdf",LOG10=FALSE,
                      file.name="XJ_nsl",ylab="XJ nSL",threshold=0,amplify=FALSE,
                      file.output=TRUE,verbose=TRUE,width=12,height=2.5)

XZ_nsl <- read.table("cmplot.XZ.nsl.2kb.txt", 
                     header = TRUE)
XZ_nsl_plot <- CMplot(XZ_nsl,type="h",plot.type="m",file="pdf",LOG10=FALSE,
                      file.name="XZ_nsl",ylab="XZ nSL",threshold=0,amplify=FALSE,
                      file.output=TRUE,verbose=TRUE,width=12,height=2.5)
#Figure S10B
XZ_pi <- read.table("cmplot.XZ.windowed.pi", 
                     header = TRUE)
XZ_pi_plot <- CMplot(XZ_pi,type="h",plot.type="m",file="pdf",LOG10=FALSE,
                      file.name="XZ_pi",ylab="XZ π",threshold=0.0009294263,amplify=FALSE,
                     file.output=TRUE,verbose=TRUE,width=14,height=3)

XJ_pi <- read.table("cmplot.XJ.windowed.pi", 
                    header = TRUE)
XJ_pi_plot <- CMplot(XJ_pi,type="h",plot.type="m",file="pdf",LOG10=FALSE,
                     file.name="XJ_pi",ylab="XJ π",threshold=0.001058388,amplify=FALSE,
                     file.output=TRUE,verbose=TRUE,width=14,height=3)

QG_pi <- read.table("cmplot.QG.windowed.pi", 
                    header = TRUE)
QG_pi_plot <- CMplot(QG_pi,type="h",plot.type="m",file="pdf",LOG10=FALSE,
                     file.name="QG_pi",ylab="QG π",threshold=0.0009312126,amplify=FALSE,
                     file.output=TRUE,verbose=TRUE,width=14,height=3)

#Figure 5
b2 <- read.table("cmplot.2kb_1.b2.txt", 
                    header = TRUE)
b2_plot <- CMplot(b2,type="p",plot.type="m",file="pdf",LOG10=FALSE,
                     file.name="b2",ylab="B2",
                     file.output=TRUE,verbose=TRUE,width=14,height=5,cex=0.3,
                  ylim=c(0.0001,1100))
#Figure 4F
b2_chr9 <- subset(b2, chromosome == 9)

SNPs <- c("rs82086", "rs82088", "rs82089")
b2_chr9_plot <- CMplot(b2_chr9,type="p",plot.type="m",file="pdf",LOG10=FALSE,
                  file.name="b2.chr3",ylab="B2", highlight= SNPs,highlight.col="red",
                  file.output=TRUE,verbose=TRUE,width=10,height=4,
                  cex=0.3,ylim=c(0.0001,1000))

##Figure 9B
XZ_rho <- read.table("E:\\doctor\\EG_muti\\anew_vcf\\图\\manhadun\\manhadun_rho_XZ.txt", 
                     header = TRUE)
XZ_rho_plot <- CMplot(XZ_rho, type="h", plot.type="m", file="pdf", LOG10=FALSE,
                      file.name="rho_XZ", ylab="XZ r(cM/Mb)", threshold=0.9269, amplify=FALSE,
                      file.output=TRUE, verbose=TRUE, width=14, height=3, ylim=c(0, 3))

XJ_rho <- read.table("E:\\doctor\\EG_muti\\anew_vcf\\图\\manhadun\\manhadun_rho_XJ.txt", 
                     header = TRUE)
XJ_rho_plot <- CMplot(XJ_rho, type="h", plot.type="m", file="pdf", LOG10=FALSE,
                      file.name="rho_XJ", ylab="XJ r(cM/Mb)", threshold=0.7501, amplify=FALSE,
                      file.output=TRUE, verbose=TRUE, width=14, height=3, ylim=c(0, 3))

QG_rho <- read.table("E:\\doctor\\EG_muti\\anew_vcf\\图\\manhadun\\manhadun_rho_QG.txt", 
                     header = TRUE)
QG_rho_plot <- CMplot(QG_rho, type="h", plot.type="m", file="pdf", LOG10=FALSE,
                      file.name="rho_QG", ylab="QG r(cM/Mb)", threshold=0.8059, amplify=FALSE,
                      file.output=TRUE, verbose=TRUE, width=14, height=3, ylim=c(0, 3))


#Figure 9C
XZ_het <- read.table("E:\\doctor\\EG_muti\\anew_vcf\\图\\manhadun\\XZ_het_count_manhadun.txt", 
                     header = TRUE)
XZ_het_plot <- CMplot(XZ_het, type="h", plot.type="m", file="pdf", LOG10=FALSE,
                      file.name="het_XZ", ylab="XZ het", threshold=9.36763, amplify=FALSE,
                      file.output=TRUE, verbose=TRUE, width=14, height=3, ylim=c(0, 200))

XJ_het <- read.table("E:\\doctor\\EG_muti\\anew_vcf\\图\\manhadun\\XJ_het_count_manhadun.txt", 
                     header = TRUE)
XJ_het_plot <- CMplot(XJ_het, type="h", plot.type="m", file="pdf", LOG10=FALSE,
                      file.name="het_XJ", ylab="XJ het", threshold=10.84389, amplify=FALSE,
                      file.output=TRUE, verbose=TRUE, width=14, height=3, ylim=c(0, 200))

QG_het <- read.table("E:\\doctor\\EG_muti\\anew_vcf\\图\\manhadun\\QG_het_count_manhadun.txt", 
                     header = TRUE)
QG_het_plot <- CMplot(QG_het, type="h", plot.type="m", file="pdf", LOG10=FALSE,
                      file.name="het_QG", ylab="QG het", threshold=9.881142, amplify=FALSE,
                      file.output=TRUE, verbose=TRUE, width=14, height=3, ylim=c(0, 200))

