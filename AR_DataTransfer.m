
function AR_DataTransfer(DIR)
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
% later on. This shouldn't be an issue, if the BIRD IDs all match, and the text
% is allways up-to-date.

% *** Start in ABA_ACTIVE directory ***

if nargin<1 | isempty(DIR), DIR=pwd; end
% Start in ABA_ACTIVE directory, read text file, that dictates the experiment status.
INPUT = tdfread('INPUT.txt','\t');
BOX_ID = cellstr(INPUT.BOX_ID);
STATUS = INPUT.STATUS;
BIRD_ID = cellstr(INPUT.BIRD_ID);


path = pwd; % code will start in ABA_ACTIVE

disp('Processing Data...');

[nblanks formatstring]=fb_progressbar(100);
fprintf(1,['Progress:  ' blanks(nblanks)]);

for i=1:length(BOX_ID)

current_path = strcat(path,'/',BOX_ID{i});
current_date =  datetime('today');
current_date = datestr(current_date);
file_ending = strcat(BIRD_ID{i},'/',current_date)
% put a copy in ABA_ACTIVE/BIRD_DATA
local_copy_path = strcat(path,'/','BIRD_DATA','/',file_ending);
 % put processed data here...
destined_path = strcat('/Users/ARGO/Documents/DATA/PROC','/',file_ending);

cd(current_path) % GO into box, copy .mov data into the current date

 mov_listing=dir(fullfile(pwd,'*.mov')); % Get all .mov files in directory
 mov_listing={mov_listing(:).name};
 filenames=mov_listing;

disp('Moving Files...');
mkdir(local_copy_path);
for ii = 1:length(mov_listing)
   movefile(filenames{ii},local_copy_path)
end

mkdir(destined_path);
 copyfile(local_copy_path,destined_path)
disp('Parsing Data...');
 cd(destined_path);
        FS_AV_Parse();
        if STATUS == 2
            % Automated template matching, and potentially ROI
            % extraction...
        end

    cd(path); % go back to the original folder in ARGO or calypso
end
end
