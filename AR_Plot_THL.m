function AR_Plot_THL(days)
% plot temperature and Humidity logs for the last week

% WALIII
% 08/14/16


% Run in the directory with the .csv logs:
DIR = pwd;
mov_listing=dir(fullfile(DIR,'*.csv'));
% Sort data by most recent:

S = [mov_listing(:).datenum].';
[S,S] = sort(S);
mov_listing={mov_listing(S).name};
filenames=mov_listing;

counter = 1; %set startup counter

% itterate through logs
for i=length(filenames)-days:length(filenames);

M = csvread(filenames{i},1,1);

if counter>1;
M1 = vertcat(M1,M);
else
    M1 = M;
end
counter = 2;
end


% Convert to datetime vector:
t = datetime(M1(:,1),M1(:,2),M1(:,3),M1(:,4),M1(:,5),M1(:,6));



% general graphics, this will apply to any figure you open
% (groot is the default figure object).
set(groot, ...
'DefaultFigureColor', 'w', ...
'DefaultAxesLineWidth', 0.5, ...
'DefaultAxesXColor', 'k', ...
'DefaultAxesYColor', 'k', ...
'DefaultAxesFontUnits', 'points', ...
'DefaultAxesFontSize', 20, ...
'DefaultAxesFontName', 'Helvetica', ...
'DefaultLineLineWidth', 1, ...
'DefaultTextFontUnits', 'Points', ...
'DefaultTextFontSize', 20, ...
'DefaultTextFontName', 'Helvetica', ...
'DefaultAxesBox', 'off', ...
'DefaultAxesTickLength', [0.02 0.025]);
 
% set the tickdirs to go out - need this specific order
set(groot, 'DefaultAxesTickDir', 'out');
set(groot, 'DefaultAxesTickDirMode', 'manual');


% plot the data:
figure(); plot(t, tsmovavg(M1(:,8),'s',1000,1),'LineWidth',4); hold on; plot(t,tsmovavg(M1(:,7),'s',1000,1),'LineWidth',4);
legend('Temp (C)','Humidity');
title(strcat('T/H logs for the last ',' ~',num2str(days),' days'));
xlabel('Date');
ylabel('Temperature / Humidity');


