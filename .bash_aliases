# navigation 
source ~/.nav_aliases

# ssh 
get_or_create_token() {
  validkey=false

  key=$(klist | grep 'krbtgt');
  if [ $(echo $key | wc -c) -gt 1 ] 
  then
    arr=(${(z)key})
    exp_date_str=$arr[3,4]
    exp_date=$(date -d $exp_date_str) 
    exp_date_seconds=$(date +%s -d $exp_date)
    cur_date_seconds=$(date +%s)
    date_diff_seconds=$((cur_date_seconds - exp_date_seconds))
    if [ $date_diff_seconds -ge 0 ] 
    then 
      echo "Key expired" 
    else 
      validkey=true
    fi  
  fi

  $validkey || kinit apnewman@CSAIL.MIT.EDU;
} 

clear_gpu_pids() {
    pids=$(fuser -v /dev/nvidia*);
    arr=(${(z)pids})
    for i in "${arr[@]}"
    do 
        kill $i;
    done
}
alias cleargpu="clear_gpu_pids" 

alias tun30="ssh -N -f -L localhost:7777:localhost:7777 apnewman@visiongpu30.csail.mit.edu"
alias tunwed="ssh -N -f -L localhost:7777:localhost:7777 apnewman@wednesday.csail.mit.edu"
alias tun30x="ssh -N -f -L localhost:7778:localhost:7778 apnewman@visiongpu30.csail.mit.edu"

alias jup="jupyter notebook --no-browser --port=7779"

# git 
alias gc="git commit" 
alias ga="git add" 
alias grb="git rebase" 
alias gb="git branch" 
alias gd="git diff" 
alias gds="git diff --staged" 
alias gs="git status" 
alias gpom="git push origin master" 
alias gp="git push" 

# grep 
alias -g g="grep -rnw . -e"

# serve static html w/ automatic reloading using npm's reload
alias serve="reload -b" 

# stats 
alias gpus="gpustat --watch" 

# tmux 
gpu_footer() {
    percent="10";
    # start a tmux session if one is not running
    if [ $(echo $TMUX | wc -c ) -le 1 ] 
    then 
        echo "No tmux session running!"
    else
        tmux split-window -v -p $percent;
        tmux send-keys 'gpus' C-m
        tmux select-pane -t 0
    fi 
}
alias gpuf="gpu_footer" 

# fun 
alias asdfghjkl="hollywood"
