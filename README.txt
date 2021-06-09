Case study Analysis of experimental data.
The data that we used comes from a logical inference tasks. The logical inferences could either: 
*(1) be linear-order (dataset: 'Transitive'; e.g. A>B, B>C, A?C) or set-inclusion (dataset: 'Syllogism'; e.g. All A's are B's, B is part of C, Is C part of A?)
*(2) be True or false: e.g. false: A>B, B>C, A<C
*(3) need the integration of 2 or 3 statements: e.g. A>B, B>C, C>D, A<C (2) or A>B, B>C, C>D A<D (3) 
source:
Lytle, M. N., Prado, J., & Booth, J. R. (2020). A neuroimaging dataset of deductive reasoning in school-aged children. Data in Brief, 33, 106405.

I analyzed the data by first creating onset files for all conditions, regardless of accuracy. 
In a second analysis, I only looked at accurate trials.
#-----------#
Description of the files:
#-----------#
* 00.0_changeDataset.py:
python script to create an extra (new columns) to make onsetfiles for accurate & innacurate responses separately. Subconditions (true, false, ...) were 
merged (this was for the accurate-trials only analysis. In some trial types, participants were always correct resulting in a missed condition, which is why I decided to aggregate them into a general condition).

* 00.1_pre-processing.bs
brain extraction file using BET,  with robust brain centre estimation 

* 01.1_motionassessment_script.sh & 0.1.1_motionasessment_script_createlist.sh
Script that removes high motion trials; create list that will be used later to remove trials with too much movement.

* 01.2_onset_persubj.bs
Script that creates event onsets for the different conditions

* 01.2_onset_persubj_ACC.bd
Same as onset_persub but merges Transitive & Syllogistic trials, and takes makes different onset files for accurate and inacurrate responses (0/1).

* 02_createfsflevel1.sh
automatize level 1 fMRI analysis from design_template.fsf

* 03_level1.sh
proceeed with level 1 analysis using FEAT

* 04_createfsfslevel2.sh
create level 2 analysis file from design_templateL2.fsf

* 05_level2.sh
execute level 2 analysis using FEAT

* BIDSto3col.sh or BIDSto3col_ACC
create onset files from event files 

* check BET
check success of Brain extraction for each participant

* checkpt
check brain image for each participant

* checkvolumes
check number of volumes for each file (note: task was subject-paced, so volumes differ from task to task, and run to run)

* design_template.fsf, design_templateL2.fsf (and *_ACC)
design templates for first & second level analysis (_ACC proceeds with the same analysis, but for the accurate only pipeline)






