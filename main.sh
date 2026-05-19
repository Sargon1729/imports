IMPORT="if [ -f $HOME/imports/.bashrc-imports ]; then . $HOME/imports/.bashrc-imports ; fi"

echo "#Bash Imports" >> $HOME/.bashrc
echo "$IMPORT" >> $HOME/.bashrc

source ~/.bashrc


