function set_fig_prop(p,line_type,marker,color,line_width)
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
for loop_line = 1:numel(p)
    p(loop_line).Marker = marker{rem(loop_line-1,numel(marker))+1};
    p(loop_line).LineStyle = line_type{rem(loop_line-1,numel(line_type))+1};
    p(loop_line).LineWidth = line_width{rem(loop_line-1,numel(line_width))+1};
    p(loop_line).Color = color{rem(loop_line-1,numel(color))+1};
end