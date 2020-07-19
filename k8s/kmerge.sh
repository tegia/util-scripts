# author: cuongnguyen
# Append kubectl config from other file
# Usage:
# ./kmerge.sh <path-to-new-file>
# -------------------------------------------------------------------
CONFIG_FILE=$1

# Review that you have two configurations in one view
KUBECONFIG=~/.kube/config:$CONFIG_FILE kubectl config view --merge --flatten > $HOME/.kube/config.temp
cat $HOME/.kube/config.temp

echo "\n----------------------------------------------------------------------"
while true; do
    read -p "Merge config files? [yn]" yn
    case $yn in
        [Yy]* ) cp $HOME/.kube/config $HOME/.kube/config.backup.$(date +%Y-%m-%d.%H:%M:%S); mv -f $HOME/.kube/config.temp $HOME/.kube/config; break;;
        [Nn]* ) echo "exit"; exit;;
        * ) echo "Please answer yes or no.";;
    esac
done