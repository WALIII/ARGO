function AR_BatchProcessing(inputfunction,level,scope,time_range)
% AR_BatchProcessing(...) put the (input_function) that you want to run across
% (range) of times
% Example: AR_BatchProcessing(AR_BatchDff_movfile,unprocessed,all_birds,today)
% this will run batch processing on all birds, every day.

% THIS FUNCTION IS UNFINISHED/UNTESTED



% STEP ONE: copy mat files from CALYPSO


% STEP TWO:
here = pwd;
% Get a list of all files and folders in this folder.
files = dir(here);
% Get a logical vector that tells which is a directory.
dirFlags = [files.isdir];
% Extract only those that are directories.
subFolders = files(dirFlags);
% Print folder names to command window.
for k = 3 : length(subFolders)
	inputfunction(subFolders(k).name);
    cd(subFolders(k).name);
    delete('*.wav')
    cd(here);
    disp(k)
end
