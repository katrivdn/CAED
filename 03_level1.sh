#!/bin/bash
#

# Specify 'WDIR' as the path under which folder the folder that contains the data is located.
# For example
# WDIR='/folder/where/my/datafolder/is/located'

WDIR='/mnt/c/users/katri/Desktop/CAED'
cd $WDIR

for x in $(ls DataCAE/sub-***/ses-T1/func/sub-***_ses-T1_task-**********_run-**_bold.nii.gz
)
do
  [[ $x =~ .*(sub-...).*(task-..........).*(run-..)_.* ]]
  SUBJECT=${BASH_REMATCH[1]}
  TASK=${BASH_REMATCH[2]}
  RUNNR=${BASH_REMATCH[3]}

  echo $SUBJECT
  echo $TASK
  echo $RUNNR

  feat DataCAE/${SUBJECT}/ses-T1/design_${TASK}${RUNNR}.fsf

done
