function new_coord = fig_coordinate_map(fig,coord)
ax = fig.CurrentAxes;
new_coord(:,1) = ax.Position(1) + (coord(:,1)- ax.XLim(1))/diff(ax.XLim)*ax.Position(3);
new_coord(:,2) = ax.Position(2) + (coord(:,2)- ax.YLim(1))/diff(ax.YLim)*ax.Position(4);
