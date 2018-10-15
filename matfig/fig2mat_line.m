function [line_data]=fig2mat_line(filename,saveopt)
%% FIG2MAT_LINE fetch the data from the .fig file
% filename, input file
% saveopt, if it is 1 or ture, the line data will be stored.
if ~exist('filename','var')
    [FileName,PathName] = uigetfile('.fig','´ò¿ªfigÍ¼');
    filename=[PathName,FileName];
end
if ~exist('saveopt','var')
    saveopt = 0;
end
line_data = {};
fig = openfig(filename);
for loop_child = 1:numel(fig.Children)
    child = fig.Children(loop_child);
    if strcmp(class(child),'matlab.graphics.axis.Axes')
        %    matlab.graphics.illustration.Legend
        ax = child;
        h_line = get(ax,'Children');
%         line_data 
        line_data_tmp.XData = {h_line.XData};
        line_data_tmp.XData = line_data_tmp.XData(end:-1:1);
        line_data_tmp.YData = {h_line.YData};
        line_data_tmp.YData = line_data_tmp.YData(end:-1:1);
        line_data_tmp.ZData = {h_line.ZData};
        line_data_tmp.ZData = line_data_tmp.ZData(end:-1:1);
        line_data{end+1} = line_data_tmp;
    end
end
line_data = line_data(end:-1:1);
if saveopt && ~isempty(line_data)
    index=find(filename=='.');
    matSave=filename(1:index(end)-1);
    matSave=strcat(matSave,'.mat');
    save(matSave,'line_data');
end