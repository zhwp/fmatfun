function [Xdata Ydata Cdata]=Fig2Mat_image(filename)
if nargin==0
    [FileName,PathName] = uigetfile('.fig','´ò¿ªfigÍ¼');
    filename=[PathName,FileName];
end
open(filename);
h_line = get(gca,'Children');
Xdata =get(h_line,'Xdata');
Ydata =get(h_line,'Ydata');
Cdata=get(h_line,'CData');
index=find(filename=='.');
matSave=filename(1:index(end)-1);
matSave=strcat(matSave,'.mat');
save(matSave,'Xdata','Ydata','Cdata');
end
