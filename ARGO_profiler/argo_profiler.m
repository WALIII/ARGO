

G = 'BOX01_';
GG = datestr(datetime('today'));
GGG = '.txt';
s = strcat(G,GG,GGG);
filename = s;
fileID = fopen(s,'w');
counter = 1;

space = '';
BOXES = 'BOX01'
BIRDS = 'BIRD01'
COMMUTATORS= 'DPL01'
ENTRY = GG
LINE = 'DATE	       	HEALTH CHECK	        	SOCIAL TIME'
DATA = GG

fprintf(fileID,'%s\n','Name2')
fprintf(fileID,'%s\n','EMAIL')
fprintf(fileID,'%s\n',space)
fprintf(fileID,'%s\n',LINE)
fprintf(fileID,'%s\n',DATA)
