
function AR_DataTransfer(DIR)
% AR_DataTransfer

% Transfer Data from FreedomScope temp repository every evening at midnight, and run
% analysis on them

%   Created: 2015/11/21
%   By: WALIII
%   Updated: 2016/12/18
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
START_DIR_ROOT2 = '/Volumes/AEOLUS_DATA';
END_DIR_ROOT =  '/Volumes/WALIII_DATA01/DATA/PROC';
TEXT_DIR = '/Users/glab/Desktop/INPUT.txt';
if nargin<1 | isempty(DIR), DIR=pwd; end

%% Variables:
INPUT = tdfread(TEXT_DIR,'\t'); % Assuimg that the .text file is in the path...
BOX_ID = cellstr(INPUT.BOX_ID);
STATUS = INPUT.STATUS;
BIRD_ID = cellstr(INPUT.BIRD_ID);

%% % get date, only once!
current_date =  datetime('today');
current_date = datestr(current_date);


disp('Processing Data...');

% [nblanks formatstring]=fb_progressbar(100);
% fprintf(1,['Progress:  ' blanks(nblanks)]);

for i=1:length(BOX_ID)
  if STATUS(i) == 1 | STATUS(i) == 2;% if status is set to 1. 'extract' or 2. 'extract and process'
    if i<4 % For the first 3 boxes ( from argo)
      START_DIR_ROOT = START_DIR_ROOT;
    else
      START_DIR_ROOT = START_DIR_ROOT2;
    end


current_path = strcat(START_DIR_ROOT,'/',BOX_ID{i});
file_ending = strcat(BIRD_ID{i},'/',current_date)
% put a copy in a directory called: path.../BIRD_DATA
local_copy_path = strcat(START_DIR_ROOT,'/','BIRD_DATA','/',file_ending);
 % put processed data here... edit to actual path...
destined_path = strcat(END_DIR_ROOT,'/',file_ending);

cd(current_path) % GO into box, copy .mov data into the current date

 mov_listing=dir(fullfile(pwd,'*.mov')); % Get all .mov files in directory
 csv_listing = dir(fullfile(pwd,'*.csv')); % Get all .mov files in directory
 mov_listing={mov_listing(:).name};
 csv_listing = {csv_listing(:).name};

disp('Moving Files...');
mkdir(local_copy_path);

for ii = 1:length(mov_listing)
  movefile(mov_listing{ii},local_copy_path)
  movefile(csv_listing{ii},local_copy_path)
 % disp('Skipping Moving Files for troubleshoting...');
end




mkdir(destined_path);
copyfile(local_copy_path,destined_path)
disp('Parsing Data...');
 cd(destined_path);

    try
            
              if STATUS(i) == 1;
                  % Automated template matching, and potentially ROI % extraction...
                 try
                  AR_Check_Directed(pwd,BOX_ID{i},BIRD_ID{i})
                  
                catch
                  send_text_message('617-529-0762','Verizon', ...
                           'Dir/Undir','An error occured in parsing Dir/UnDir data in ARGO')
                  end
              end
              FS_AV_Parse();
    catch
        warning('Problem using function FS_AV_Parse.  Skipping to next BOX');
        % email that there was a problem
        send_text_message('617-529-0762','Verizon', ...
                 'Batch Error','An error occured with data processing in ARGO')
    end

    cd(START_DIR_ROOT); % go back to the original folder in ARGO or calypso
end
end
send_text_message('617-529-0762','Verizon', ...
         'Batch Complete ','ARGO has successfully transfered all files')
end
