function save_openfig(output_file_path,file_names,save_opt)
%% SAVE_OPENFIG save all the open figures to output_file_path
% save_opt is the format type of the figure, such as 'fig', 'epsc'
if ~exist(output_file_path,'dir')
    mkdir(output_file_path);
end
if ~exist('file_names','var')
    file_names = 'figure';
end
fig_handles=findall(0,'type','figure');
fig_handles = fig_handles(end:-1:1);
for loop_index=1:length(fig_handles)
    fig=figure(fig_handles(loop_index));
    if ~iscell(file_names)
        file_name = fullfile(output_file_path,strcat(file_names,'_',num2str(loop_index)));
    else
        file_name = fullfile(output_file_path,strcat(file_names{loop_index},'_',num2str(loop_index)));
    end
    saveas(fig,file_name,save_opt);
end