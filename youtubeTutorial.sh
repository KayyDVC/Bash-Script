#! /bin/bash
echo "What is your name?"
read name

if [ $name ]; then
	echo "$name sounds alright to me"
else 
	echo "Doesn't sound alright to me"
fi

