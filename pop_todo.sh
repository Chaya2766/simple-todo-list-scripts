if [ `head --lines=1 ~/todo.txt | grep -e "todo:" -c` -eq 1 ]
then
tail --lines=+3 ~/todo.txt > ~/todo.txt.temp && cat ~/todo.txt.temp > ~/todo.txt && rm ~/todo.txt.temp
else
tail --lines=+2 ~/todo.txt > ~/todo.txt.temp && cat ~/todo.txt.temp > ~/todo.txt && rm ~/todo.txt.temp
fi
