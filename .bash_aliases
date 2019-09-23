# navigation 
alias gos="cd ~/Dropbox\ \(MIT\)/Files/Documents/Senior/sem2"
alias gov="cd ~/Dropbox\ \(MIT\)/Files/Documents/Viz"
alias gow="cd ~/Dropbox\ \(MIT\)/Files/Documents/personal_webpage"

# ssh 
alias goa="ssh -X apnewman@biohazard-cafe.mit.edu"
alias tun30="ssh -N -f -L localhost:7777:localhost:7777 apnewman@visiongpu30.csail.mit.edu"
alias tunwed="ssh -N -f -L localhost:7777:localhost:7777 apnewman@wednesday.csail.mit.edu"
alias tun30x="ssh -N -f -L localhost:7778:localhost:7778 apnewman@visiongpu30.csail.mit.edu"

# git 
alias gc="git commit" 
alias ga="git add" 
alias grb="git rebase" 
alias gb="git branch" 
alias gd="git diff" 
alias gds="git diff staged" 
alias gs="git status" 
alias gpom="git push origin master" 
alias gp="git push" 

# grep 
alias -g g="grep -rnw . -e"

# serve static html w/ automatic reloading using npm's reload
alias serve="reload -b" 
