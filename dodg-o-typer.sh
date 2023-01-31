#!/bin/bash


SNIPPY_TAB_FILE_WO_SEQCAP=$1
SNIPPY_TAB_FILE_W_SEQCAP=$2
OUTFILE=$3

#SNIPPY_TAB_FILE_WO_SEQCAP=543_s4.4.5_Mu_Parkin_21_chr_p_mask.tab
#SNIPPY_TAB_FILE_W_SEQCAP=543_W-DMG2212098_mincov-1.tab
#OUTFILE=out.aln

# generate random prefix for all tmp files
RAND_1=`echo $((1 + RANDOM % 100))`
RAND_2=`echo $((100 + RANDOM % 200))`
RAND_3=`echo $((200 + RANDOM % 300))`
RAND=`echo "${RAND_1}${RAND_2}${RAND_3}"`

tail -n +2 ${SNIPPY_TAB_FILE_WO_SEQCAP} | cut -f 1-2 | tr '\t' '#' > ${RAND}_tmp.txt

head -1 ${SNIPPY_TAB_FILE_W_SEQCAP} > ${RAND}_now.tab

for TAXA in $(cat ${RAND}_tmp.txt); do

	CHR=`echo ${TAXA} | tr '#' ',' | cut -f 1 -d ','`
	POS=`echo ${TAXA} | tr '#' ',' | cut -f 2 -d ','`
	
	grep -w "${CHR}" ${SNIPPY_TAB_FILE_W_SEQCAP} | grep -w "${POS}" >> ${RAND}_now.tab

	echo "${CHR}"
	echo "${POS}"

done

cut -f 3- ${RAND}_now.tab | head -1 | tr '\t' '\n' > ${RAND}_fofn.txt

cut -f 3- ${RAND}_now.tab | tail -n +2 | datamash transpose -H | tr -d '\t' > ${RAND}_tmp.seq

COUNT=`wc -l ${RAND}_fofn.txt | awk '{print $1}'`
seq 1 ${COUNT} | cut -b1 | tr 0-9 '>' > ${RAND}_START.txt
seq 1 ${COUNT} | cut -b1 | tr 0-9 '#' > ${RAND}_HASH.txt

paste ${RAND}_START.txt ${RAND}_fofn.txt ${RAND}_HASH.txt ${RAND}_tmp.seq | tr -d '\t' | tr '#' '\n' > ${OUTFILE}

rm ${RAND}_*
