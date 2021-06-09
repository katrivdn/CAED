#!/bin/bash
#
outlier_QA=DataCAE/motion_QA_outlier.txt

rm $outlier_QA

for x in $(ls DataCAE/sub-***/ses-T1/func/sub-***_ses-T1_task-**********_run-**_bold.nii.gz
)
do
  [[ $x =~ .*(sub-...)_.*(task-..........)_(run-..)_.* ]]
  echo ${BASH_REMATCH[1]}
  echo ${BASH_REMATCH[2]}
  echo ${BASH_REMATCH[3]}

  mov=$(grep -o 1 DataCAE/${BASH_REMATCH[1]}/ses-T1/motion/${BASH_REMATCH[2]}/${BASH_REMATCH[3]}/confound.txt | wc -l)

  if [ $mov -gt 40 ]
  then
  echo "${BASH_REMATCH[1]} ${BASH_REMATCH[2]} ${BASH_REMATCH[3]} $mov" >> $outlier_QA
  fi

done
