# This is a pretty basic bash profile that I’ll continue to update over time.
# Quite a lot of the things in here were ripped straight out of natelandau.com/my-mac-osx-bash_profile/

# Sets up bash completion if I have bash-completion installed
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

#-----------------FUN THINGS-----------------
alias f="clear; fortune" # fast fortune, can be repeated
alias starwars="telnet towel.blinkenlights.nl" # ASCII Star Wars
alias u="clear; /Users/johann/uncycl.sh"
#-----------------FAST THINGS-----------------
alias ~="cd ~" # fast way of going home
alias c='clear' # clears the screen
alias lssh="ssh 192.168.0.18" # local ssh - connects to arch pc when home
alias clera='clear' # fixes a common clear typo that I do
# Utilities
alias myip='curl ip.appspot.com' # Gives me my public facing IP
# Show/Hide hidden files in Finder
alias finderShowHidden='defaults write com.apple.finder ShowAllFiles TRUE'
alias finderHideHidden='defaults write com.apple.finder ShowAllFiles FALSE'



#   ii:  display useful host related informaton
#   -------------------------------------------------------------------
    ii() {
        echo -e "\nYou are logged on ${RED}$HOST"
        echo -e "\nAdditionnal information:$NC " ; uname -a
        echo -e "\n${RED}Users logged on:$NC " ; w -h
        echo -e "\n${RED}Current date :$NC " ; date
        echo -e "\n${RED}Machine stats :$NC " ; uptime
        echo -e "\n${RED}Current network location :$NC " ; scselect
        echo -e "\n${RED}Public facing IP Address :$NC " ;myip
        #echo -e "\n${RED}DNS Configuration:$NC " ; scutil --dns
        echo
    }

#   extract:  Extract most know archives with one command
#   ---------------------------------------------------------
    extract () {
        if [ -f $1 ] ; then
          case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar e $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xjf $1     ;;
            *.tgz)       tar xzf $1     ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)     echo "'$1' cannot be extracted via extract()" ;;
             esac
         else
             echo "'$1' is not a valid file"
         fi
    }
#   cleanupDS:  Recursively delete .DS_Store files
#   -------------------------------------------------------------------
    alias cleanupDS="find . -type f -name '*.DS_Store' -ls -delete"

transfer() {
        # write to output to tmpfile because of progress bar
        tmpfile=$( mktemp -t transferXXX )
        curl --progress-bar --upload-file $1 https://transfer.sh/$(basename $1) >> $tmpfile;
        cat $tmpfile;
        rm -f $tmpfile;
}

alias transfer=transfer
