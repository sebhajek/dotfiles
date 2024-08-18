alias odin="~/.odin/odin";
alias update-odin="pushd ~/.odin && git fetch;git pull;sudo zypper in clang llvm llvm-devel;make;popd";
export ODIN_ROOT=$(readlink -f ~/.odin);
export PATH="$ODIN_ROOT:$PATH";
