#!/bin/bash
#

# Specify 'WDIR' as the path under which folder the folder ds000109_R2.0.2 that contains the data is located.
# For example
# WDIR='/folder/where/my/datafolder/is/located'
# IMPORTANT: also create WDIR_sed as follows:
# WDIR_sed='\/folder\/where\/my\/datafolder\/is\/located'
WDIR='/mnt/c/users/katri/Desktop/CAED'
WDIR_sed='\/mnt\/c\/Users\/katri\/Desktop\/CAED'
cd $WDIR

for x in $(ls DataCAE/sub-***/ses-T1/func/sub-***_ses-T1_task-**********_run-**_bold.nii.gz
)
do
  [[ $x =~  .*(sub-...).*(task-..........).*(run-..)_.*  ]]
  SUBJECT=${BASH_REMATCH[1]}
  TASK=${BASH_REMATCH[2]}
  RUNNR=${BASH_REMATCH[3]}
  sed "s/{{RUNNR}}/${RUNNR}/g;s/{{TASK}}/${TASK}/g;s/{{SUBJECT}}/${SUBJECT}/g;s/{{WDIR}}/${WDIR_sed}/g" ${WDIR}/design_templateL2_linear-set_full.fsf > ${WDIR}/DataCAE/$SUBJECT/ses-T1/designL2_linear-set_full.fsf

done
