#!/bin/bash
#

outhtml=DataCAE/motion_QA.html
dirhtml=DataCAE/

for x in $(ls DataCAE/sub-***/ses-T1/func/sub-***_ses-T1_task-**********_run-**_bold.nii.gz
)
do
  [[ $x =~ .*(sub-...)_.*(task-..........)_(run-..)_.* ]]
  echo ${BASH_REMATCH[1]}
  echo ${BASH_REMATCH[2]}
  echo ${BASH_REMATCH[3]}
  mkdir -p DataCAE/${BASH_REMATCH[1]}/ses-T1/motion/${BASH_REMATCH[2]}/${BASH_REMATCH[3]}
  mpath=DataCAE/${BASH_REMATCH[1]}/ses-T1/motion/${BASH_REMATCH[2]}/${BASH_REMATCH[3]}

  pathpng=${mpath#$dirhtml}

  fsl_motion_outliers -i $x -o $mpath/confound.txt --fd --thresh=0.9 -p $mpath/fd_plot -v > $mpath/outlier_output.txt

  echo "<h2> ${BASH_REMATCH[1]} - ${BASH_REMATCH[2]} - ${BASH_REMATCH[3]} </h2>" >> $outhtml
  cat $mpath/outlier_output.txt >> $outhtml
  echo "<p> <b> Framewise Displacement plot </b> <br><IMG BORDER=\"0\" SRC=\"${pathpng}/fd_plot.png\" WIDTH=\"100%\"></BODY></HTML>" >> $outhtml

  if [ ! -f $mpath/confound.txt ]
  then
  touch $mpath/confound.txt
  fi
done
