
function ARGO_profiler
% Get Info
TEXT_DIR = '/Users/ARGO/Documents/MATLAB/ARGO/ARGO_profiler/INPUT.txt';
INPUT = tdfread(TEXT_DIR,'\t'); % Assuimg that the .text file is in the path...
BOX_ID = cellstr(INPUT.BOX_ID);
STATUS = INPUT.STATUS;
BIRD_ID = cellstr(INPUT.BIRD_ID);
ENTRY_ID = cellstr(INPUT.ENTRY);



% Write Text File
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
end
