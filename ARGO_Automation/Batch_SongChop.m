function Batch_SongChop(DIR, varargin)

% run thorough directory and song chop all the .wav files
% WALIII
% 01.28.16



counter = 1;

if exist(Processed,'dir') rmdir(Processed,'s'); end
mkdir(mat_dir);


outlier_flag=0;
if nargin<1 | isempty(DIR), DIR=pwd; end
day_listing=dir(fullfile(DIR,'*.mat'));
day_listing={day_listing(:).name};
filenames=day_listing;


disp('Creating Dff movies');

[nblanks formatstring]=fb_progressbar(100);
fprintf(1,['Progress:  ' blanks(nblanks)]);

for i=1:length(day_listing)

zftftb_song_chop(filenames{i});

end
fprintf(1,'\n');
