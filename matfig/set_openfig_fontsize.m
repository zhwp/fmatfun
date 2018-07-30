function set_openfig_fontsize(font_size)
%% SET_OPENFIG_FONTSIZE set the fontsize of all open figures
fig_handles=findall(0,'type','figure');
fig_handles = fig_handles(end:-1:1);
for loop_index=1:length(fig_handles)
    fig_cur=figure(fig_handles(loop_index));
    set_fig_fontsize(fig_cur,font_size)
end