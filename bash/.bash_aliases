# Check for changes on SVN
alias svnmod='svn status -u --ignore-externals | grep -v ?'
# Easy text search
alias seek='~/bin/seek.sh'
alias seeknot='~/bin/seeknot.sh'
# Easy file search
alias ff='~/bin/find-file.sh'
# Shortcut to gnome-open (opens files and dirs)
alias go='gnome-open 2> /dev/null'
# Git bootstrap
alias git-boot='~/bin/git-boot.sh'
# Django script to run dev server on local IP
alias runserver='~/bin/django-runserver.sh'
# Supress gvim errors
alias gvim='gvim 2> /dev/null'
# Remove pyc
alias rmpyc='find -iname "*.pyc" -delete'
