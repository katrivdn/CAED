#!/bin/bash
#

for x in $(ls DataCAE/sub-***/ses-T1/func/sub-***_task-**********_run-0[1-2]_bold.nii.gz
)
do
y=$(fslnvols $x)
[[ $x =~ .*(sub-...).*(run-..)_.* ]]
echo ${BASH_REMATCH[1]} ${BASH_REMATCH[2]} $y
done
