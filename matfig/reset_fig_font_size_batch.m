function reset_fig_font_size_batch(input_file_path,output_file_path,save_opt,font_size)
if ~exist(output_file_path,'dir')
    mkdir(output_file_path);
end
if exist(input_file_path,'dir')
    cur_dir = pwd;
    cd(input_file_path);
    files_info = dir('*.fig');
    cd(cur_dir);
    for loop_file = 1:numel(files_info)
        cur_file_name = fullfile(input_file_path,files_info(loop_file).name);
        [pathstr,file_name,file_ext] = fileparts(cur_file_name);
        fig = openfig(cur_file_name);
        set_fig_fontsize(fig,font_size);
        saveas(fig,fullfile(output_file_path,file_name),save_opt);
    end
end
if exist(input_file_path,'file')
    
end
