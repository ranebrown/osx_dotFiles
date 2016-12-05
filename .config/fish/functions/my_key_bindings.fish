# map jj to exit vi insert mode
function my_key_bindings
	fish_vi_key_bindings
    bind -M insert -m default jj force-repaint
end
