
function [ BOX_ID ] = argo_profiler()
  % ARGO_profiler

  % Get tracking data from birds in all active Boxes, and put it in a text file
  % hosted on Drive, readable by a QR code. This replaces daily task sheets
  % with a QR code.

  %   Created: 2015/12/30
  %   By: WALIII
  %   Updated: 2016/01/24
  %   By: WALIII


  % To set this up in chron:  http://www.nncron.ru/help/EN/working/cron-format.htm
  % In terminal, edit in crontab with nano: env EDITOR=nano crontab -e
  % To run every day, at 10PM:
  % 0 21  * * * /Applications/MATLAB_R2015a.app/bin/matlab  -nodisplay -nosplash -r "ARGO_profiler; quit"  >> ~/.MATLAB_logfile.log 2>&1


  % to monitor on terminal:  tail -f ~/.MATLAB_logfile.log
  % Run once, with command :
  % /Applications/MATLAB_R2015a.app/bin/matlab  -nodisplay -nosplash -r "ARGO_profiler; quit"




% Get Info/Status from text file...
TEXT_DIR = '/Users/ARGO/Documents/MATLAB/ARGO/ARGO_profiler/INPUT.txt';
INPUT = tdfread(TEXT_DIR,'\t'); % Assuimg that the .text file is in the path...
BOX_ID = cellstr(INPUT.BOX_ID);
STATUS = INPUT.STATUS;
BIRD_ID = cellstr(INPUT.BIRD_ID);
ENTRY_ID = cellstr(INPUT.ENTRY);



% Write Text Files for each box/bird
for i=1:length(BOX_ID)
  if STATUS(i) == 1;
    filename = char(strcat(BOX_ID(i),'_LOGFILE','.txt'));

    fileID = fopen(filename,'w');
    % Variable Names:
    space = ' ';
    BOXES = char(strcat('BOX ID:      ', BOX_ID(i)));
    BIRDS = char(strcat('BIRD ID:     ', BIRD_ID(i)));
    COMMUTATORS= char(strcat('COMMUTATOR:','DPL01'));
    ENTRY = char(strcat('ENTRY DATE:', ENTRY_ID(i)));
    LINE = 'DATE	       	HEALTH CHECK	        	SOCIAL TIME';
    DATA = datestr(datetime('today'));
    
    % if
% Write Data:
fprintf(fileID,'%s\n',BOXES);
fprintf(fileID,'%s\n',BIRDS);
fprintf(fileID,'%s\n',ENTRY);
fprintf(fileID,'%s\n',COMMUTATORS);
fprintf(fileID,'%s\n',space);
fprintf(fileID,'%s\n',LINE);
fprintf(fileID,'%s\n',DATA);





end
end

% END
csvwrite(CurrentBox,M) % write who is on the box now, so that we can track when birds change 

end
