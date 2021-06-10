# -*- coding: utf-8 -*-
"""
Created on Sat Jun  5 09:21:27 2021

change dataset into new condition column. We only mention here whether the logical 
inference is a Syllogism or a Transitive; and add whether the response was accurate or 
innacurate.

@author: Katrien Vandenbroeck
"""

import pandas as pd
import os

# cd
os.chdir(r"C:/Users/Katri/Desktop/CAED/DataCAE")
subjects = [i for i in os.listdir() if i.startswith('sub')]

#%%
# list over subjects
for i in subjects:
    path = os.getcwd()+'\\'+i+'\\ses-T1\\func\\' ## select path to onsetfiles
    event_files = [event for event in os.listdir(path) if event.endswith('.tsv')] 
    for event in event_files: ## loop over all event files
        data = pd.read_csv(path+'//'+event, sep="\t") # read data
        data['Cond_ACC'] = data['accuracy'].astype('int').astype('str')
            
        ## add control trials condition:
        control_i = data.index[data['trial_type']=='control']  ## indexes for control trials
        data.loc[control_i,'Cond_ACC']='control' ## replace event with 'control'
        
        # save file:
        data.to_csv(os.getcwd()+'//'+i+'//ses-T1//func//'+event,sep = "\t", index= False)