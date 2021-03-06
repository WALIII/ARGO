function AR_Check_Directed_ManOveride(BOX,BIRDID)
  % AR_Check_Directed_ManOveride.m


  % Check to see if the songs in the directory are directed or undirected,
  % based on the box status aggregate
  % * manual overide of AR_Check_Directed.m, Subfunction of DataTransfer *


  %   Created: 2016/12/17
  %   By: WALIII
  %   Updated: 2017/04/25
  %   By: WALIII

[FileName,PathName] = uigetfile('*.csv','Select the .csv file');

% Check CSV to see the aggregate when the box was open or closed
% Loc = '/Users/glab/Documents/DATA/LOGS' % where the CSVs are located
%
% % Get the date
% formatOut = 'yyyy_mm_dd';
% current_date =  datetime('today');
% current_date = datestr(current_date,formatOut);
%
% % format to fit processing's output
% if current_date(6) == '0'
%     current_date(6) = [];
%     if current_date(8)== '0'
%         current_date(8) = [];
%     end
% else
%     if current_date(8)== '0'
%         current_date(8) = [];
%     end
% end


% CSVfile = [Loc,'/',current_date,'.csv']
CSVfile = [PathName,FileName];
G = dlmread(CSVfile,',',1,0);

% G = dlmread('2016_12_2.csv',',',1,0);

% for i =
% idx = find(G(:,14) == 0);

% for i = 1:size(idx,1);
% TIMES_A{i} = [num2str(G(idx(i),2)),'-',num2str(G(idx(i),3)),'-',num2str(G(idx(i),4)),' ',num2str(G(idx(i),5)),' ',num2str(G(idx(i),6)) ,' ',num2str(G(idx(i),7)) ];
% %TIMES_B{i} =  datetime(G(idx(i),2),G(idx(i),3),G(idx(i),4),G(idx(i),5),G(idx(i),6),G(idx(i),7));
% end;


clear TIMES_B;


% if nargin<1 | isempty(DIR), DIR=pwd; end
DIR = pwd
cd(DIR)

mov_listing=dir(fullfile(pwd,'*.mov'));
mov_listing={mov_listing(:).name};
filenames=mov_listing;


% collect times in the CSV
TIMES_B(:,1) =  datenum(G(:,2),G(:,3),G(:,4),G(:,5),G(:,6),G(:,7));
TIMES_B(:,2) =  G(:,10+str2num(BOX(4:5))); % index into the proper BOX



for ii = 1: length(mov_listing);
    try
mov_T(:,ii) = datenum(str2num(filenames{ii}(1:4)),str2num(filenames{ii}(6:7)),str2num(filenames{ii}(9:10)),str2num(filenames{ii}(12:13)),str2num(filenames{ii}(15:16)),str2num(filenames{ii}(18:19)));
% Find closest timepoint in CSV
tmp = abs(TIMES_B(:,1)-mov_T(:,ii));
[idx idx] = min(tmp); %index of closest value
mov_Tclose(1,ii) = TIMES_B((idx),1); %closest value
mov_Tclose(2,ii) =  TIMES_B(find(TIMES_B(:,1) == mov_Tclose(1,ii)),2);
    catch
    disp('Bad filename');
    filenames(ii) = [];
continue
    end
end


% Save data for later analysis:
counter1 = 1;
counter2 = 1;
counter3 = 1;
for i = 1:size(filenames,2);
  if mov_Tclose(2,i) ==1; % box is closed
    undirected{counter1} = mov_listing{i};
    counter1 = counter1+1;

  elseif mov_Tclose(2,i) ==0; % box is open
    directed{counter2} = mov_listing{i};
    counter2 = counter2+1;

  else
    directed{counter3} = mov_listing{i};
    counter3 = counter3+1;
  end
end

if exist('directed') ==1;
save('context_index','directed','undirected');

% Get the difference in song files Created
H(1) = size(directed,2); H(2) = size(undirected,2)

% Make figure, but don't display it:
f = figure('visible','off');

subplot(1,10,1:8)
hold on;
plot(TIMES_B(:,1),1-TIMES_B(:,2));
ylim([-.2 1.2]);
hold on;
plot(mov_Tclose(1,:),1-mov_Tclose(2,:),'*');
dateFormat = 11;
title(['Summary for ',BIRDID, ' (',BOX,') ','on ',filenames{1}(1:10)]);
datetick('x','HHPM');

set(gca,'YTickLabel',{'BOX CLOSED' 'BOX OPEN'},'YTick',[0 1])
legend(' BOX STATUS ','song');
subplot(1,10,9:10)

bar(H)
set(gca,'YAxisLocation','right','XTickLabel',{'','Directed' 'UnDirected'},'XTick',[0 1 2],'XTickLabelRotation',50);


saveas(f,'figure.png');

end

% move files into new directories



% % sort into directtory
% mkdir('directed')
% mkdir('undirected')
% mkdir('unknown')

% for i = 1:length(mov_listing);
%   if mov_Tclose(2,i) ==1; % box is closed
%     copyfile(mov_listing{i},'undirected')
%   elseif mov_Tclose(2,i) ==0; % box is open
%     copyfile(mov_listing{i},'directed')
%   else
%     copyfile(mov_listing{i},'unknown')
%   end
% end

% make list
