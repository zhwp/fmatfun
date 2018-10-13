function [new_ax,ax] = copy_and_zoom_ax(fig,new_fig,pos,xlims,ylims,anno_type,linetype)
%% COPY_AND_ZOOM_AX copy and zoom the axes of fig to new_fig
% fig is the figure to be copied
% new_fig is the figure where the axes of fig will be plotted in
% pos is the positions of the zoomed region in the old figure; if a new
% figure is used, pos is []
% xlims is the scope of xaxis of the zoomed region
% ylims is the scope of yaxis of the zoomed region
% anno_type is the annotation type of fig, it can be
% 'rectangle','ellipse','textbox'
% line_type is the annotaion line type
if ~exist('new_fig') || isempty(new_fig)
    new_fig = fig;
end
if ~exist('linetype','var') || isempty(linetype)
    linetype = ':';
end
ax = fig.CurrentAxes; 
new_ax = copyobj(ax,new_fig);
axes(new_ax);
if ~isempty(pos)
    new_ax.Position = pos;
    xlabel('');
    ylabel('');
end
if ~exist('xlims','var') || isempty(xlims)
    xlims = ax.XLim;
end
if ~exist('ylims','var') || isempty(ylims)
    ylims = ax.YLim;
end
% if ~exist('anno_type','var') || isempty(anno_type)
%     anno_type = 'rectangle';
% end
new_ax.XLim = xlims;
new_ax.YLim = ylims;
anno_pos = [ax.Position(1) + (new_ax.XLim(1) - ax.XLim(1))/diff(ax.XLim)*ax.Position(3),...
    ax.Position(2) + (new_ax.YLim(1) - ax.YLim(1))/diff(ax.YLim)*ax.Position(4),...
    diff(new_ax.XLim)/diff(ax.XLim)*ax.Position(3),...
    diff(new_ax.YLim)/diff(ax.YLim)*ax.Position(4)];
if exist('anno_type','var') && ~isempty(anno_type)
    figure(fig);
    annotation(anno_type,anno_pos,'Color','r','LineWidth',1.5,'LineStyle',linetype);
end
figure(new_fig);