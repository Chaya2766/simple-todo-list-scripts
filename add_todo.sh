echo "you will type in title and then content of the todo task"
echo "type todo task title:"
read title
echo "type todo task content:"
read content

echo "todo: $title" >> ~/todo.txt
echo "$content" >> ~/todo.txt
