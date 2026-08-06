#if the todo file has less or equal 2 lines then exit immediately without doing anything
if [ `cat todo.txt | wc -l` -le 2 ]
then
exit 0
fi
#if it has at least 3 lines, then going further is ok

#move all except first two lines to the tmp file
if [ `head --lines=1 ~/todo.txt | grep -e "todo:" -c` -eq 1 ]
then
#if the first line has a "todo:" then skip first two lines
tail --lines=+3 ~/todo.txt > ~/todo.txt.temp
else
#if the first line does not have a "todo:" then it is broken, and skip only that line, because the line after that is the one with a todo
tail --lines=+2 ~/todo.txt > ~/todo.txt.temp
fi

#move the first two lines to the tmp file, thus putting them at the end
if [ `head --lines=1 ~/todo.txt | grep -e "todo:" -c` -eq 1 ]
then
#if the first line has a "todo:" then move two lines to the tmp file
head --lines=2 ~/todo.txt >> ~/todo.txt.temp
fi
#if the first line does not have a "todo:" then do nothing, because the previous if statement would have already fixed the todo file, and moving anything now would break it

cat ~/todo.txt.temp > ~/todo.txt && rm ~/todo.txt.temp
