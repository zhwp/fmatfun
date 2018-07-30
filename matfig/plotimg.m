function fig_out = plotimg(scene_img,scene_x,scene_y,tar_x,tar_y,amp)
if ~isempty(scene_img)
    fig_out = figure;imagesc(scene_x,scene_y,scene_img/max(scene_img(:))*max(amp));axis xy;colormap gray;
    xlabel('azimuth (m)');ylabel('range (m)');
    freezeColors;colorbar;
    cmap = colormap(jet);
    [amp,idx_sort] = sort(amp,'ascend');
    tar_x = tar_x(idx_sort);
    tar_y = tar_y(idx_sort);
    amp_color = cmap(floor(amp/max(amp)*(size(cmap,1)-1))+1,:);
    hold on;scatter(tar_x,tar_y,10,amp_color,'filled');
else
    fig_out = figure;hold on;grid on;box on;
    fig_out.CurrentAxes.GridLineStyle = ':';
    fig_out.CurrentAxes.GridAlpha = 0.5;
    cmap = colormap(jet);
    [amp,idx_sort] = sort(amp,'ascend');
    tar_x = tar_x(idx_sort);
    tar_y = tar_y(idx_sort);
    amp_color = cmap(floor(amp/max(amp)*(size(cmap,1)-1))+1,:);
    scatter(tar_x,tar_y,10,amp_color,'filled');
    colorbar;colormap(jet);caxis([amp(1),amp(end)]);
    xlabel('azimuth (m)');ylabel('range (m)');
    xlim(scene_x([1 end]));ylim(scene_y([1 end]));
end