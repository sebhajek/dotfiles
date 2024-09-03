if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_prompt -d "Write out the prompt"
    set -l normal (set_color normal)
    set -l status_color (set_color red)
    set -l user_color (set_color blue)
    set -l file_color (set_color cyan)
    set -l time_color (set_color purple)
    set -l cwd_color (set_color $fish_color_cwd)
    set -l vcs_color (set_color brpurple)
    set -l vcs_b_color (set_color yellow)
    set -l in_color (set_color brgreen)


    set -l time_text $in_color"╤═"$normal"["$time_color(date "+%H:%M")$normal"]"
    echo -n $time_text
    
    set -l user_info $normal"["$user_color$USER$normal"]("$cwd_color"@"(prompt_hostname)$normal")"
    echo -n $in_color"═"$user_info
    
    set -q fish_prompt_pwd_dir_length
    or set -lx fish_prompt_pwd_dir_length 0
    set -l dir_info $normal"["$file_color(prompt_pwd)$normal"]"
    echo -n $in_color"═"$dir_info
   
    set -l git_branch (fish_git_prompt | string match -r '.*[(].*[)].*' | string trim | string trim --chars="()" | string trim)
    if test -n $git_branch
        echo -n $in_color"═"$normal"["$vcs_color"GIT"$normal"]("$vcs_b_color$git_branch$normal")"
    end
    set -l hg_branch (fish_hg_prompt | string match -r '.*[(].*[)].*' | string trim | string trim --chars="()" | string trim)
    if test -n $hg_branch
        echo -n $in_color"═"$normal"["$vcs_color"HG"$normal"]("$vcs_b_color$hg_branch$normal")"
    end

    
    echo $in_color"═╡"$normal

    set -l last_status $status
    set -l prompt_status $status_color"∅"$normal
    if test $last_status -ne 0
        set status_color (set_color $fish_color_error)
        set prompt_status $status_color$last_status$normal
    end
    set -l status_text $in_color"╘═"$normal"("$prompt_status")"
    echo -n $status_text

    echo -n -e $in_color"═══╡❱❱ "$normal

end

for f in ~/.config/fish/conf.d/*.fish; 
   source $f; 
end; set --erase f;
