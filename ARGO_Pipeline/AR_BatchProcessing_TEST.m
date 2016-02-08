function AR_BatchProcessing_TEST()
% batch across a single bird, for all days in directory



BIRD_ID = pwd;

% Get a list of all files and folders in this folder.
files = dir(BIRD_ID);
% Get a logical vector that tells which is a directory.
dirFlags = [files.isdir];
% Extract only those that are directories.
subFolders = files(dirFlags);
% Print folder names to command window.
for k = 3 : length(subFolders)
	cd(subFolders(k).name);
if exist(fullfile(pwd,'Dff_mov');,'dir')
	disp('Skipping, already extracted Dff_mov')
else
	inputfunction(subFolders(k).name);
end
cd(pwd);


send_text_message('617-529-0762','Verizon', ...
         'Calculation Complete','CIRCE is waiting for input')

end
