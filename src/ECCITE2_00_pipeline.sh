basedir=$HOME/GFS/PROJECTS/TfCf/

source $CODEBASE/tfcf/setup.sh

# cd Data/Raw_data_ECCITE1
#
# python $CODEBASE/tfcf/crukci_to_illumina.py
#
#
# # ANALYZE WITH ANTIBODIES
# mkdir -p $HOME/omicstmp/nf
# cd $HOME/omicstmp/nf
#
# ~/code/cellranger-6.0.1/cellranger count --id=ECCITE2 \
# 	--no-bam \
#     --libraries=$CODEBASE/tfcf/metadata/ECCITE1_Library.csv \
#     --transcriptome=$HOME/GFS/RESOURCES/Genomes/refdata-gex-mm10-2020-A/ \
#     --feature-ref=$CODEBASE/tfcf/metadata/ECCITE1_Features.csv \
#     --localcores=24 \
#     --localmem=64 \
#     --expect-cells=10000 &> ECCITE1.log
#
# mkdir -p ~/GFS/PROJECTS/TfCf/Data/ECCITE1/
# cp -R ECCITE1/outs ~/GFS/PROJECTS/TfCf/Data/ECCITE1/



# ANALYZE WITHOUT GUIDES
mkdir -p $HOME/omicstmp/nf
cd $HOME/omicstmp/nf

grep -v "CRISPR Guide Capture" $CODEBASE/tfcf/metadata/ECCITE2_Library.csv > $CODEBASE/tfcf/metadata/ECCITE2_Library_onlyRNA.csv

id="ECCITE2_onlyRNA"

~/code/cellranger-6.0.1/cellranger count --id=$id \
	--no-bam \
    --libraries=$CODEBASE/tfcf/metadata/ECCITE2_Library_onlyRNA.csv \
    --transcriptome=$GFS/RESOURCES/Genomes/refdata-gex-mm10-2020-A/ \
    --localcores=24 \
    --localmem=64 \
    --expect-cells=10000 &> $id.log

mkdir -p ~/GFS/PROJECTS/TfCf/Data/$id/
cp -R ECCITE1/outs ~/GFS/PROJECTS/TfCf/Data/$id/