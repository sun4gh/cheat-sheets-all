add this to include the hostname , the path to working directory, and a reminder i'm in bash not csh:
  export PS1="\[\e[36m\]\h\[\e[m\]\[\e[33m\]\w\[\e[m\]\$ "


add this to .bashrc or .bash_profile, to capture date/time in history
  export HISTTIMEFORMAT="%F %T  "
