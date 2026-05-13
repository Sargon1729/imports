IMPORT="if [ -f $HOME/imports/bashrc-import.sh ]; then . $HOME/imports/bashrc-import.sh ; fi"

echo "#Bash Imports" >> $HOME/.bashrc
echo "$IMPORT" >> $HOME/.bashrc

source ~/.bashrc
