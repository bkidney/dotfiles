# The rest of my fun git aliases
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"

grm() {
  git status | grep deleted | sed -e "s/[[:blank:]]*deleted:[[:blank:]]*//g" -e "s/\(^.*$\)/\"\1\" /g" |xargs git rm
}
