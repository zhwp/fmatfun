%% 多条曲线作图
% 用随机数模拟多条曲线
rng(0);
M = 3; N = 1000;
x = 1:N;
y = cumsum(randn(M,N),2);
% 曲线的每一点都打上标记 (太密了，影响图像美观性！！！）
[fig_rndlines,~,~,plines] = plotfig(x,y,x,y);  % 注意x,y必须有一维维度相同
xlabel('index'); ylabel('amplitude');
legend(plines,{'line 1','line 2','line 3'});
set_fig_fontsize(fig_rndlines,14);

% 抽取1/15的点打上标记
[fig_rndlines,~,~,plines] = plotfig(x,y,x(1:15:end),y(:,1:15:end)); 
xlabel('index'); ylabel('amplitude');
legend(plines,{'line 1','line 2','line 3'});
set_fig_fontsize(fig_rndlines,14);

% 更改线型、标记、颜色、线宽
[fig_rndlines,~,~,plines] = plotfig(x,y,[],[],{'-','-','-'},{'none','o','*'},{[0.0 0.447 0.741],[0.85 0.325 0.098],[0 0 0]},{1.0});  %或[fig_rndlines,~,~,plines] = plotfig(x,y);
xlabel('index'); ylabel('amplitude');
legend(plines,{'line 1','line 2','line 3'});
set_fig_fontsize(fig_rndlines,14);

%% 对图的局部进行放大
% 用随机数模拟多条靠得比较近的曲线
rng(0);
M = 3; N = 1500;
x = 1:N;
y = cumsum(rand(M,N),2);
[fig_rndlines,~,~,plines] = plotfig(x,y);
xlabel('index'); ylabel('amplitude');
legend(plines,{'line 1','line 2','line 3'});
set_fig_fontsize(fig_rndlines,14);
copy_and_zoom_ax(fig_rndlines,[],[0.2 0.6 0.35 0.30],[400 600],[200 300],'rectangle','-');

% 局部放大图画在新图上
rng(0);
M = 3; N = 1500;
x = 1:N;
y = cumsum(rand(M,N),2);
[fig_rndlines,~,~,plines] = plotfig(x,y);
xlabel('index'); ylabel('amplitude');
legend(plines,{'line 1','line 2','line 3'});
set_fig_fontsize(fig_rndlines,14);
fig_rndlines_new = figure;
copy_and_zoom_ax(fig_rndlines,fig_rndlines_new,[],[400 600],[200 300],'rectangle','-');