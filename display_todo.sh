if [ `cat ~/todo.txt | grep -c -e "todo:"` -gt 0 ]
then
notify-send "`head --lines=1 ~/todo.txt`" "`head --lines=2 ~/todo.txt | tail --lines=1`" -u critical
else
notify-send "no todo tasks for today" "display_todo.sh ran and found the ~/todo.txt file empty"
fi
