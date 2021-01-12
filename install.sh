#!/bin/bash

cd ~
ABSOLUTE_GIT_HOME="`pwd`/git"

SHELL_NAME=${SHELL##*/}
RC="${HOME}/.${SHELL_NAME}rc"
echo "export GIT_HOME='$ABSOLUTE_GIT_HOME'" >> $RC

source $RC

TOOLBOX="./bash_toolbox"

echo "source '${TOOLBOX}/${SHELL_NAME}_profile'" >> $RC

source $RC
