function [fig_out,p_lines,p_lines_marker,p_lines_legend] = plotfig(x,y,x_m,y_m,line_type,marker,color,line_width)
%% PLOTFIG plot multiple lines by three layers
% Input:
% x,y are the input data of the lines
% x_m, y_m are a subset of x,y where the markers will display. If they are
% empty, about 15 points will be selected from x,y.
% line_type, marker, color, line_width custom the appearance of the lines,
% if they do not exist or are empty, defaults settting will be used.
% Output:
% fig_out is the figure handle 
% p_lines is the handle of the first layer lines (with only line types)
% p_lines_marker is the handle of the second layer lines (with only line
% markers)
% p_lines_legend is the handle of the third layer lines (with both line
% types and markers) and it is often used to display the line legend

if ~exist('line_width','var') || isempty(line_width)
    line_width = {1.5,1.5,1.5,1.5,1.5,1.5,1.5,1.5,1.5};
end
if ~exist('marker','var') || isempty(marker)
    marker = {'none','o','+','*','x','s','d','^','v','>','<','p','h','.'};
end
if ~exist('line_type','var') || isempty(line_type)
    line_type = {'-',':','--','-.'};
end
if ~exist('color','var') || isempty(color)
    color = {[0.0 0.447 0.741],[0.85 0.325 0.098],[0.929 0.694 0.125],[0.494 0.184 0.556],...
        [0.466 0.674 0.188],[0.301 0.745 0.933],[0.635 0.078 0.184]};
end
dim = find(size(x)-size(y)~=0);
if isempty(dim) && sum(size(x)>1)>1
    dim = 2;
else if isempty(dim) && sum(size(x)>1)==1
        dim = find(size(x)==1);
    end
end
fig_out = create_fig;
p_lines = plot(x,y);
if ~exist('x_m','var')
    x_m = [];
end
if ~exist('y_m','var')
    y_m = [];
end
idx = 1;
if isempty(x_m) || isempty(y_m)
    idx = 1:round(length(x)/15):length(x);
%     x_m = x(idx);
    if dim == 1
        x_m = x(:,idx);
        y_m = y(:,idx);
    else
        x_m = x(idx,:);
        y_m = y(idx,:);
    end
end
if isempty(idx)
    idx = 1;
end
p_lines_marker = plot(x_m,y_m);
if dim == 1
    p_lines_legend= plot(x(idx(1)),y(:,idx(1)));
else
    p_lines_legend= plot(x(idx(1)),y(idx(1),:));
end
set_fig_prop(p_lines,line_type,{'none'},color,line_width);
set_fig_prop(p_lines_marker,{'none'},marker,color,line_width);
set_fig_prop(p_lines_legend,line_type,marker,color,line_width);