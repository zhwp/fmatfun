function fig_out=create_fig
%% CREATE_FIG create a figure with grid, box and hold on
fig_out = figure;hold on;grid on;box on;
fig_out.CurrentAxes.GridLineStyle = ':';
% fig_out.CurrentAxes.GridColor = [0 0 0];
fig_out.CurrentAxes.GridAlpha = 0.5; 