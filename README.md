# ARGO
ARGO is the behavioral imaging rig in the Gardner Lab, that contains 12 boxes for awake-behaving imaging, and tool prototyping. This repository is for the support code that is used for keeping track of the birds in the rig, and distributes data for pre-processing, then collects it for exploratory analysis.

## STAGE ONE: DATA COLLECTION

### Collect data from 3 acquisition computers, plus one support computer
  ARGO (MAC Mini): BOX01- BOX04

  CALYPSO (MAC Mini): BOX05-BOX08

  CALLIDICE (MAC Mini): BOX09-BOX12

  CIRCE (MAC pro): Support, data staging and distribution.


### Temperature, Humidity, Social Time Tracker
Program running on CIRCE outputs one .csv per day that includes Max/min Humidity and Temperature sampled every 2 seconds, as well as the BOX status for each 'active' BOX in the rig Will also list the name of the bird in each BOX.


![ScreenShot](closed.png)


![ScreenShot](open.png)


![ScreenShot](open2.png)

### Data Distribution

CIRCE will distribute data to other computers for analysis. Collects Data after processing, and places it on a RAID for analysis.

STATUS Page updates the current status of all Data collected over the past several days.
