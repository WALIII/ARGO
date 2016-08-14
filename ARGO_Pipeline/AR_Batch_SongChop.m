function AR_Batch_SongChop(DIR)

% run thorough directory and song chop all the .wav files
% This script should be run in the directory that contains folders for each
% bird.


% WALIII
% 01.28.16



% if exist(Processed,'dir') rmdir(Processed,'s'); end
% mkdir(mat_dir);
here = pwd;
% Get a list of all files and folders in this folder.
files = dir(here);
% Get a logical vector that tells which is a directory.
dirFlags = [files.isdir];
% Extract only those that are directories.
subFolders = files(dirFlags);
% Print folder names to command window.
for k = 3 : length(subFolders)
    G = strcat(subFolders(k).name,'/wav');
	zftftb_song_chop(G);
    cd(subFolders(k).name);
    delete('*.wav')
    cd(here);
    disp(k)
end


%
%
%
% outlier_flag=0;
% if nargin<1 | isempty(DIR), DIR=pwd; end
% day_listing=dir(fullfile(DIR,'*.'));
% day_listing={day_listing(:).name};
% filenames=day_listing;
%
%
% disp('Creating Dff movies');
%
% [nblanks formatstring]=fb_progressbar(100);
% fprintf(1,['Progress:  ' blanks(nblanks)]);
%
% for i=1:length(day_listing)
%
% zftftb_song_chop(filenames{i});
%
% end
% fprintf(1,'\n');
