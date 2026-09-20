if [ `cat ~/todo.txt | grep -c -e "todo:"` -gt 0 ]
then
action=$(notify-send "`head --lines=1 ~/todo.txt`" "`head --lines=2 ~/todo.txt | tail --lines=1`" -u critical --transient --action "Rotate to next" --action "Pop")
else
notify-send "no todo tasks for today" "display_todo.sh ran and found the ~/todo.txt file empty" --transient
fi

if [ $action ] && [ $action -eq 0 ]
then
bash rotate_todo.sh && bash display_todo.sh
elif [ $action ] && [ $action -eq 1 ] && [ `notify-send "confirm deletion of todo?" --action "YES" --action "NO"` -eq 0 ]
then
bash pop_todo.sh && bash display_todo.sh
fi
