test -z "$PROFILEREAD" && . /etc/profile || true

export EDITOR=/usr/bin/vim

#find ~/.shell/ -name ".sh_profile*" -type f
find ~/.shell/ -name ".sh_profile*" -type f -exec . '{}' \;
