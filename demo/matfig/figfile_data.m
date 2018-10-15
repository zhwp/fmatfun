%% fetch the values of lines from the .fig file; 从.fig图中提取曲线的值
y = cumsum(randn(1,1000));
fig_line = figure; plot(1:1000,y);
saveas(fig_line,'rline.fig','fig');
[line_data] = fig2mat_line('rline.fig');
%% fetch the values of image from the .fig file; 从 figure 图中提取二维图像的值
img = randn(500,500);
fig_image = figure; imagesc(abs(img));
saveas(fig_image,'rimg.fig','fig');
[Xdata, Ydata, Cdata]= fig2mat_image('rimg.fig');