# Setup

0. Make sure `git` is installed and `~/.ssh` is setup
1. Fill-out:
```
ABSOLUTE_GIT_HOME=/directory/to/where/you/want/git/clone/to/store/to
```

2. Copy + paste
```
pushd ~ >/dev/null
HOME=`pwd`
popd >/dev/null

SHELL_NAME=${SHELL##*/}
RC="${HOME}/.${SHELL_NAME}rc"
echo "export GIT_HOME='$ABSOLUTE_GIT_HOME'" >> $RC

source $RC

MLGAMBLE="${GIT_HOME}/bash/mlgamble/"
mkdir -p $MLGAMBLE
cd $MLGAMBLE

git clone git@github.com:mlgamble/bash_toolbox.git

TOOLBOX="${MLGAMBLE}/bash_toolbox"

echo "source '${TOOLBOX}/${SHELL_NAME}_profile'" >> $RC

source $RC
```
