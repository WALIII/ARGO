
function AR_DataTransfer(DIR)
% AR_DataTransfer

% Transfer Data from FreedomScopes every evening at midnight, and run
% analysis on them

%   Created: 2015/11/21
%   By: WALIII
%   Updated: 2015/11/27
%   By: WALIII


% To set this up in chron:  http://www.nncron.ru/help/EN/working/cron-format.htm
% In terminal, edit in crontab with nano: env EDITOR=nano crontab -e
% To run every day, at 10PM:
% 0 21  * * * /Applications/MATLAB_R2015a.app/bin/matlab  -nodisplay -nosplash -r "AR_DataTransfer; quit"  >> ~/.MATLAB_logfile.log 2>&1


% to monitor on terminal:  tail -f ~/.MATLAB_logfile.log
% Run once, with command :
% /Applications/MATLAB_R2015a.app/bin/matlab  -nodisplay -nosplash -r "AR_DataTransfer; quit"


%% PATHS:
START_DIR_ROOT = '/Volumes/ARGO_DATA'; %code will start in ABA_ACTIVE. Put Text File
END_DIR_ROOT =  '/Users/glab/Documents/DATA/PROC';
TEXT_DIR = '/Users/glab/Desktop/INPUT.txt';
if nargin<1 | isempty(DIR), DIR=pwd; end

%% Variables:
INPUT = tdfread(TEXT_DIR,'\t'); % Assuimg that the .text file is in the path...
BOX_ID = cellstr(INPUT.BOX_ID);
STATUS = INPUT.STATUS;
BIRD_ID = cellstr(INPUT.BIRD_ID);


disp('Processing Data...');

% [nblanks formatstring]=fb_progressbar(100);
% fprintf(1,['Progress:  ' blanks(nblanks)]);

for i=1:length(BOX_ID)
  if STATUS(i) == 1;

current_path = strcat(START_DIR_ROOT,'/',BOX_ID{i});
current_date =  datetime('today');
current_date = datestr(current_date);
file_ending = strcat(BIRD_ID{i},'/',current_date)
% put a copy in a directory called: path.../BIRD_DATA
local_copy_path = strcat(START_DIR_ROOT,'/','BIRD_DATA','/',file_ending);
 % put processed data here... edit to actual path...
destined_path = strcat(END_DIR_ROOT,'/',file_ending);

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
        if STATUS(i) == 2
            % Automated template matching, and potentially ROI
            % extraction...
        end

    cd(START_DIR_ROOT); % go back to the original folder in ARGO or calypso
end
end
end
