## Install useful tools and run commands after a lab has started up
yum list tmux ansible
sudo yum -y install tmux ansible
tmux new-session -d
tmux list-sessions > tmuxsessiondetails.txt
tmux set-option -g history-limit 10000
echo
echo "INSTALLED tmux"
echo "INSTALLED ansible"
echo "tmux SCREEN BUFFER INCREASED"
echo
