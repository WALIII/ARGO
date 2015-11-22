
function AR_DataTransfer()
% AR_DataTransfer

% Transfer Data from FreedomScopes every evening at midnight, and run
% analysis on them 

%   Created: 2015/11/21
%   By: WALIII
%   Updated: 2015/11/22
%   By: WALIII

% Running note: This function will work imeadiately when run ( i.e. it will
% first parse all data in the acquisition pipeline, then parse all
% subsequent runs at midnight). This is done in case birds are switched out
% of cages within a day, such that there is no mixing birds in the analysis
% later on. This shouldn't be an issue, if the BIRD IDs all match...



% Start in ABA_ACTIVE directory
INPUT = tdfread('INPUT.txt','\t');
BOX_ID = cellstr(INPUT.BOX_ID)
STATUS = cellstr(INPUT.STATUS)
BIRD_ID = cellstr(INPUT.BIRD_ID)


path = pwd;

disp('Processing Data...');

[nblanks formatstring]=fb_progressbar(100);
fprintf(1,['Progress:  ' blanks(nblanks)]);

for i=1:length(BOXID)
    % Pseudocode...
currentpath = path + BOXID{1};

    cd(currentpath) % GO into box, copy data into the current date
    
NEW_FOLDER = mkdir('folderName')
 mov_listing=dir(fullfile(pwd,'*.mov')); % Get all .mov files in directory
 mov_listing={mov_listing(:).name};
 filenames=mov_listing;
 
for ii = 1:length(mov_listing)
    movefile(filenames{i},Todays_Folder)
end
 copyfile(Todays_Folder,LOCALdestination)
 
 cd(LOCALdestination{i});
        FS_AV_Parse();
    
    cd(path); % go back to the original folder in ARGO or calypso

end
