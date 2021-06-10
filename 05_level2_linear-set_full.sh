#!/bin/bash
#

# Specify 'WDIR' as the path under which folder that contains the data is located.
# For example
# WDIR='/folder/where/my/datafolder/is/located'
WDIR='/mnt/c/users/katri/Desktop/CAED'
cd $WDIR

for x in $(ls DataCAE/sub-***/ses-T1/func/sub-***_ses-T1_task-Syllogisms_run-01_bold.nii.gz
)
do
  [[ $x =~ .*(sub-...).*(task-..........).*(run-..)_.* ]]
  SUBJECT=${BASH_REMATCH[1]}
  echo $SUBJECT

  feat DataCAE/${SUBJECT}/ses-T1/designL2_linear-set_full.fsf

done
