if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_prompt -d "Write out the prompt"
    printf '%s@%s %s%s%s > ' $USER $hostname \
    (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
end

#for f in ~/.config/fish/conf.d/*.fish; 
#   source $f; 
#end; set --erase f;
