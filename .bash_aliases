

alias gitstat='git status -sb'
alias gits='git status -sb'
alias gitlog='git log --format="%C(green)%cd %C(yellow)%h %C(red)%an %C(cyan)%d %C(white)%p%n%C(bold)%s%n%b" --first-parent'
alias gittree='git log --oneline --graph --color --all --decorate'
alias gitk-all='gitk --all --date-order --author="`git config user.name`" `git reflog show --format=%H`'


alias ll='ls -alFh'
alias la='ls -A'
alias l='ls -CF'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=always --group-directories-first -h'
    #alias dir='dir --color=always'
    #alias vdir='vdir --color=always'

    alias grep='grep --color=always'
    alias fgrep='fgrep --color=always'
    alias egrep='egrep --color=always'
fi

alias lint='ox dev lint -d --fix && ox dev lint --fix'
alias vranger='"ranger"'
alias ranger='. ranger'
alias grepls='ls | grep'
alias gls='ls | grep'
alias gll='ll | grep'
alias lsg='ls | grep'
alias llg='ll | grep'
alias less='less -r'
alias vimode='set -o vi'
alias gpp='g++'
alias wem='w3m'
alias dl='yt-dlp '
alias ydl='yt-dlp '