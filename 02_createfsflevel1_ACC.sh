#!/bin/bash
#
# IMPORTANT: also create WDIR_sed as follows:
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
  VOL=$(fslnvols $x)
  sed "s/{{VOL}}/${VOL}/g;s/{{RUNNR}}/${RUNNR}/g;s/{{TASK}}/${TASK}/g;s/{{SUBJECT}}/${SUBJECT}/g;s/{{WDIR}}/${WDIR_sed}/g" ${WDIR}/design_template_ACC.fsf > ${WDIR}/DataCAE/$SUBJECT/ses-T1/design_${TASK}${RUNNR}_ACC.fsf

done
