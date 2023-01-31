# Dodg-o-typer

# Data files
  
### Running snippy with poor seq cap data  
```  
snippy --minqual 0 --mapqual 0 --basequal 0 --mincov 1 --minfrac 0 --outdir DMG2212098 --ref M_ulcerans_JKD8049.fa --R1 DMG2212098/DMG2212098_S1_L001_R1_001.fastq.gz --R2 DMG2212098/DMG2212098_S1_L001_R2_001.fastq.gz  
```  
  
### Running snippy-core without seq cap genome  
```  
snippy-core --prefix 543_VIC --ref ref.fa --mask M_ulcerans_JKD8049.mask.bed $(cat 543_VIC_fofn.txt)  
```  
  
### Running snippy-core with seq cap genome 
```  
snippy-core --prefix 543_VIC_W-DMG2212098 --ref ref.fa --mask M_ulcerans_JKD8049.mask.bed $(cat 543_VIC_W-DMG2212098_fofn.txt)  
```  
  
### Running dodg-o-typer 

#### Command  
```  
sh dodg-o-typer.sh [SNIPPY_TAB_FILE_WO_SEQCAP.tab] [SNIPPY_TAB_FILE_W_SEQCAP.tab] [OUTFILE.aln]  
```  
  
#### Running with example
```  
sh dodg-o-typer.sh 543_VIC.tab 543_VIC_W-DMG2212098.tab dodg-o-typer_543_VIC_W-DMG2212098.aln 
```  
  
### Make a ML tree using dodg-o-typer alignment
```  
FastTree -nt -gtr dodg-o-typer_543_VIC_W-DMG2212098.aln  > dodg-o-typer_543_VIC_W-DMG2212098.nwk  
```  

