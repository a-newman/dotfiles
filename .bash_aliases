# navigation 
source ~/.nav_aliases.sh

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
alias gpsh="git push origin master" 
alias gpll="git pull origin master" 
alias gp="git push" 
alias gst="git stash"
alias gsta="git stash apply"
alias gco="git checkout"

#convenience 
alias -g g="grep -rnw . -e"
# serve static html w/ automatic reloading using npm's reload
alias serve="reload -b" 
# gpu stats 
alias gpus="gpustat -FP -i 0.5" 
# vim 
alias v="vim"
# scp 
scp_anelise_lambda() {
    scp $1 anelise@anelise-lambda.csail.mit.edu:~
} 
alias scpa="scp_anelise_lambda" 
scp_anelise_lambda_dl() {
    scp anelise@anelise-lambda.csail.mit.edu:$1 . 
}
alias scpadl="scp_anelise_lambda_dl" 
# csv 
view_csv_pp_readonly() {
    csvtool readable $1 | view -c "set nowrap" - 
}
alias csv="view_csv_pp_readonly"
# make new python file
new_py_file() {
    if [ "$#" -ne 1 ]; then 
        echo "Please pass a file name as an argument."
        exit 1
    fi 
    cp ~/.new_py.py $1; 
    # chmod +x $1;
}
alias p="python"
alias newp="new_py_file" 

alias gat="gatsby" # gb is taken by git branch

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

alias aws="aws2"
alias fair="~/FAIR-CLI.bin"

# fun 
hackysack_hollywood() {
    read -k 2;
    hollywood;
}
alias hh="hackysack_hollywood"
alias asdfghjkl="hollywood"
