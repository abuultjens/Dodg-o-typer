# Dodg-o-typer

# About
When a seqcap dataset has poor enrichment for its target most sites that do have coverage only have few reads mapping (between 1-3x) and there is therefore insufficient depth to overcome the error rate of the sequencing and false positive SNPs will occur. To work around this Dodg-o-typer looks only at SNP sites of interest that have been discovered in a population not including the seqcap genome with poor coverage. This is somewhat alike to first discovering a set of informative SNPs and then investigating them via something like PCR-based amplicon sequencing.
  
## Running snippy with poor seq cap data  
```  
snippy --minqual 0 --mapqual 0 --basequal 0 --mincov 1 --minfrac 0 --outdir DMG2212098 --ref M_ulcerans_JKD8049.fa --R1 DMG2212098/DMG2212098_S1_L001_R1_001.fastq.gz --R2 DMG2212098/DMG2212098_S1_L001_R2_001.fastq.gz  
```  
  
## Running snippy-core without seq cap genome  
```  
snippy-core --prefix 543_VIC --ref ref.fa --mask M_ulcerans_JKD8049.mask.bed $(cat 543_VIC_fofn.txt)  
```  
  
## Running snippy-core with seq cap genome 
```  
snippy-core --prefix 543_VIC_W-DMG2212098 --ref ref.fa --mask M_ulcerans_JKD8049.mask.bed $(cat 543_VIC_W-DMG2212098_fofn.txt)  
```  
  
## Running dodg-o-typer 

#### Command  
```  
sh dodg-o-typer.sh [SNIPPY_TAB_FILE_WO_SEQCAP.tab] [SNIPPY_TAB_FILE_W_SEQCAP.tab] [OUTFILE.aln]  
```  
  
#### Running with example
```  
sh dodg-o-typer.sh 543_VIC.tab 543_VIC_W-DMG2212098.tab dodg-o-typer_543_VIC_W-DMG2212098.aln 
```  
  
## Make a ML tree using dodg-o-typer alignment
```  
FastTree -nt -gtr dodg-o-typer_543_VIC_W-DMG2212098.aln  > dodg-o-typer_543_VIC_W-DMG2212098.nwk  
```  

