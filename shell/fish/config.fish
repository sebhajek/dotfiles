if status is-interactive
    # Commands to run in interactive sessions can go here
end

for f in ~/.config/fish/conf.d/*.fish; 
    do source $f; 
done; unset f;