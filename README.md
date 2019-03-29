# Setup in ITerm2

1. `brew install zsh`
1. `chsh -s $(which zsh)`
1. `sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`
1. `echo "source ${TOOLBOX}/zsh_profile" >> ~/.zshrc`
1. Install Meslo fonts
1. Add Solarized-Dark
1. Apply custom ZSH changes from below
1. `sed -i 's/ZSH_THEME=".*"/ZSH_THEME="agnoster"/'`
1. `sed -i 's/plugins=.*/plugins=(git-prompt)/'`
1. Export Solarized-Dark from ITerm2, and import into Intellij
1. Change Intellij terminal to `/usr/local/bin/zsh`
1. Will still have to manually change the terminal background

# Custom oh-my-zsh (b7b40b0b68c791d57d91c7f4e17ed681d01d5c75) changes:

```diff
diff --git a/plugins/git-prompt/git-prompt.plugin.zsh b/plugins/git-prompt/git-prompt.plugin.zsh
index 2776f29..6a97656 100644
--- a/plugins/git-prompt/git-prompt.plugin.zsh
+++ b/plugins/git-prompt/git-prompt.plugin.zsh
@@ -47,46 +47,44 @@ function update_current_git_vars() {
 git_super_status() {
     precmd_update_git_vars
     if [ -n "$__CURRENT_GIT_STATUS" ]; then
-      STATUS="$ZSH_THEME_GIT_PROMPT_PREFIX$ZSH_THEME_GIT_PROMPT_BRANCH$GIT_BRANCH%{${reset_color}%}"
+      STATUS="$ZSH_THEME_GIT_PROMPT_PREFIX$ZSH_THEME_GIT_PROMPT_BRANCH$GIT_BRANCH" #%{${reset_color}%}"
       if [ "$GIT_BEHIND" -ne "0" ]; then
-          STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_BEHIND$GIT_BEHIND%{${reset_color}%}"
+          STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_BEHIND$GIT_BEHIND" #%{${reset_color}%}"
       fi
       if [ "$GIT_AHEAD" -ne "0" ]; then
-          STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_AHEAD$GIT_AHEAD%{${reset_color}%}"
+          STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_AHEAD$GIT_AHEAD" #%{${reset_color}%}"
       fi
       STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_SEPARATOR"
       if [ "$GIT_STAGED" -ne "0" ]; then
-          STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_STAGED$GIT_STAGED%{${reset_color}%}"
+          STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_STAGED$GIT_STAGED" #%{${reset_color}%}"
       fi
       if [ "$GIT_CONFLICTS" -ne "0" ]; then
-          STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_CONFLICTS$GIT_CONFLICTS%{${reset_color}%}"
+          STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_CONFLICTS$GIT_CONFLICTS" #%{${reset_color}%}"
       fi
       if [ "$GIT_CHANGED" -ne "0" ]; then
-          STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_CHANGED$GIT_CHANGED%{${reset_color}%}"
+          STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_CHANGED$GIT_CHANGED" #%{${reset_color}%}"
       fi
       if [ "$GIT_UNTRACKED" -ne "0" ]; then
-          STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_UNTRACKED%{${reset_color}%}"
+          STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_UNTRACKED$GIT_UNTRACKED" #%{${reset_color}%}"
       fi
       if [ "$GIT_CHANGED" -eq "0" ] && [ "$GIT_CONFLICTS" -eq "0" ] && [ "$GIT_STAGED" -eq "0" ] && [ "$GIT_UNTRACKED" -eq "0" ]; then
           STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_CLEAN"
       fi
-      STATUS="$STATUS%{${reset_color}%}$ZSH_THEME_GIT_PROMPT_SUFFIX"
+      STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_SUFFIX" #"$STATUS%{${reset_color}%}$ZSH_THEME_GIT_PROMPT_SUFFIX"
       echo "$STATUS"
     fi
 }
 
 # Default values for the appearance of the prompt.
-ZSH_THEME_GIT_PROMPT_PREFIX="("
-ZSH_THEME_GIT_PROMPT_SUFFIX=")"
+ZSH_THEME_GIT_PROMPT_PREFIX="" #"("
+ZSH_THEME_GIT_PROMPT_SUFFIX="" #")"
 ZSH_THEME_GIT_PROMPT_SEPARATOR="|"
-ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg_bold[magenta]%}"
-ZSH_THEME_GIT_PROMPT_STAGED="%{$fg[red]%}%{●%G%}"
-ZSH_THEME_GIT_PROMPT_CONFLICTS="%{$fg[red]%}%{✖%G%}"
-ZSH_THEME_GIT_PROMPT_CHANGED="%{$fg[blue]%}%{✚%G%}"
+ZSH_THEME_GIT_PROMPT_BRANCH="" #"%{$fg_bold[magenta]%}"
+ZSH_THEME_GIT_PROMPT_STAGED="%{●%G%}" #"%{$fg[red]%}%{●%G%}"
+ZSH_THEME_GIT_PROMPT_CONFLICTS="%{✖%G%}" #"%{$fg[red]%}%{✖%G%}"
+ZSH_THEME_GIT_PROMPT_CHANGED="%{✚%G%}" #"%{$fg[blue]%}%{✚%G%}"
 ZSH_THEME_GIT_PROMPT_BEHIND="%{↓%G%}"
 ZSH_THEME_GIT_PROMPT_AHEAD="%{↑%G%}"
 ZSH_THEME_GIT_PROMPT_UNTRACKED="%{…%G%}"
-ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}%{✔%G%}"
+ZSH_THEME_GIT_PROMPT_CLEAN="%{✔%G%}" #"%{$fg_bold[green]%}%{✔%G%}"
 
-# Set the prompt.
-RPROMPT='$(git_super_status)'
diff --git a/themes/agnoster.zsh-theme b/themes/agnoster.zsh-theme
index 3c30a9e..e7e8675 100644
--- a/themes/agnoster.zsh-theme
+++ b/themes/agnoster.zsh-theme
@@ -95,47 +95,16 @@ prompt_context() {
 
 # Git: branch/detached head, dirty status
 prompt_git() {
-  (( $+commands[git] )) || return
-  if [[ "$(git config --get oh-my-zsh.hide-status 2>/dev/null)" = 1 ]]; then
-    return
-  fi
-  local PL_BRANCH_CHAR
-  () {
-    local LC_ALL="" LC_CTYPE="en_US.UTF-8"
-    PL_BRANCH_CHAR=$'\ue0a0'         # 
-  }
-  local ref dirty mode repo_path
-
-  if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
-    repo_path=$(git rev-parse --git-dir 2>/dev/null)
-    dirty=$(parse_git_dirty)
-    ref=$(git symbolic-ref HEAD 2> /dev/null) || ref="➦ $(git rev-parse --short HEAD 2> /dev/null)"
-    if [[ -n $dirty ]]; then
+  GIT_STATUS="$(git_super_status)"
+  if [ -n "$GIT_STATUS" ] ; then
+    if [[ $GIT_CONFLICTS != 0 ]] ; then
+      prompt_segment red $CURRENT_FG
+    elif [[ $GIT_BEHIND != 0 || $GIT_UNTRACKED != 0 ]] ; then
       prompt_segment yellow black
-    else
+    else 
       prompt_segment green $CURRENT_FG
     fi
-
-    if [[ -e "${repo_path}/BISECT_LOG" ]]; then
-      mode=" <B>"
-    elif [[ -e "${repo_path}/MERGE_HEAD" ]]; then
-      mode=" >M<"
-    elif [[ -e "${repo_path}/rebase" || -e "${repo_path}/rebase-apply" || -e "${repo_path}/rebase-merge" || -e "${repo_path}/../.dotest" ]]; then
-      mode=" >R>"
-    fi
-
-    setopt promptsubst
-    autoload -Uz vcs_info
-
-    zstyle ':vcs_info:*' enable git
-    zstyle ':vcs_info:*' get-revision true
-    zstyle ':vcs_info:*' check-for-changes true
-    zstyle ':vcs_info:*' stagedstr '✚'
-    zstyle ':vcs_info:*' unstagedstr '●'
-    zstyle ':vcs_info:*' formats ' %u%c'
-    zstyle ':vcs_info:*' actionformats ' %u%c'
-    vcs_info
-    echo -n "${ref/refs\/heads\//$PL_BRANCH_CHAR }${vcs_info_msg_0_%% }${mode}"
+    echo -n "${GIT_STATUS}"
   fi
 }
 
@@ -197,9 +166,13 @@ prompt_hg() {
   fi
 }
 
+prompt_datetime() {
+  prompt_segment black default "$(date '+%H:%m:%S') -"
+}
+
 # Dir: current working directory
 prompt_dir() {
-  prompt_segment blue $CURRENT_FG '%~'
+  prompt_segment black default '%c'
 }
 
 # Virtualenv: current working virtualenv
@@ -243,7 +216,8 @@ build_prompt() {
   prompt_status
   prompt_virtualenv
   prompt_aws
-  prompt_context
+  #prompt_context
+  prompt_datetime
   prompt_dir
   prompt_git
   prompt_bzr
```
