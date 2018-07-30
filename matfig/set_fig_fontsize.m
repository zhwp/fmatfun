function set_fig_fontsize(fig,font_size)
%% SET_FIG_FONTSIZE set the font size of figure
for loop_child = 1:numel(fig.Children) % All axes can be found in the Children property
    child = fig.Children(loop_child);
    switch class(child) % Currently support Axes and PloarAxes
        case 'matlab.graphics.axis.Axes' % The font of matlab.graphics.illustration.Legend is set as well. 
            ax = child;
            set(ax,'FontSize',font_size);
            xlhandle=get(ax,'xlabel');
            set(xlhandle,'FontSize',font_size);
            ylhandle=get(ax,'ylabel');
            set(ylhandle,'FontSize',font_size);
            zlhandle=get(ax,'zlabel');
            set(zlhandle,'FontSize',font_size);
            titlehandle=get(ax,'title');
            set(titlehandle,'FontSize',font_size);
        case 'matlab.graphics.axis.PolarAxes'
            ax = child;
            set(ax,'FontSize',font_size);
            titlehandle=get(ax,'title');
            set(titlehandle,'FontSize',font_size);
    end
end