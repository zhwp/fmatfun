function [Xdata, Ydata, Cdata]=fig2mat_image(filename,saveopt)
%% FIG2MAT_IMAGE fetch the data from the .fig file
% filename, input file
% saveopt, if it is 1 or ture, the line data will be stored.
if ~exist('filename','var')
    [FileName,PathName] = uigetfile('.fig','´ò¿ªfigÍ¼');
    filename=[PathName,FileName];
end
if ~exist('saveopt','var')
    saveopt = 0;
end
fig = openfig(filename);
h_line = get(gca,'Children');
Xdata =get(h_line,'Xdata');
Ydata =get(h_line,'Ydata');
Cdata=get(h_line,'CData');
if saveopt 
    index=find(filename=='.');
    matSave=filename(1:index(end)-1);
    matSave=strcat(matSave,'.mat');
    save(matSave,'Xdata', 'Ydata', 'Cdata');
end
