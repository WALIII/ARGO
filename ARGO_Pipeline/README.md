# ARGO IMAGING PIPELINE
ARGO is the behavioral imaging rig in the Gardner Lab, that contains 12 boxes for awake-behaving imaging, and tool prototyping. This repository is for the support code that is used for keeping track of the birds in the rig, and distributes data for pre-processing, then collects it for exploratory analysis.

This is the documentation for the Automated 'middle analysis' portion, and modules of the analysis pipeline. This will typically not be "cron'd" but reserves the ability to be.


#### BACKGROUND (preprocessing on other computers)

Data exists in Circe in this format:

    DATA--> PROC--> BIRD_ID--> DATE--> RAW-->mat
                                `--> gif

## MIDDLE-PROCESSING OVERVIEW


In brief:
1. (OPTIONAL) down-sampled Df/f (DS avi) videos of the unaligned data will be created.
2. the data for each bird will be aligned to song
3. ROI maps will be automatically determined
4. 'agnostic' ROI extraction will occur. This requires within-day image alignment
5. 'gnostic' ROI extraction will occur for n-(x) days, determined by extraction parameters read in a text file, merging highly overlapping ROIs. This requires within and across day image registration.
6. full resolution Df/f MTIFF for analysis in THUNDER
6. Reorganization: All ROI data will be stored in a separate directory, by BIRD_ID, for easy processing




### DATA TRANSFER AND PARSING

The entire directory, from PROC forward, will transfer to data processing computers. The active directory is the mat folder. In the BIRD-ID dir, a TEMPLATE file is stored, that is the BOS recored through the head-mounted mic

Within the 'mat' folder, an additional folder, 'extraction' will be created.




In terminal, edit in crontab with nano:
```
$  env EDITOR=nano crontab -e
 ```
To run every day, at 10PM, insert this into the crontab:
```
 0 21  * * * /Applications/MATLAB_R2015a.app/bin/matlab  -nodisplay -nosplash -r "AR_DataTransfer; quit"  >> ~/.MATLAB_logfile.log 2>&1
```

To monitor the output of this function, in a new terminal window:

```
tail -f ~/.MATLAB_logfile.log
```

This will read a ever-increasing .log file, which has the output of the matlab script directed to it. Good for troubleshooting as well.
