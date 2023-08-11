#!/bin/bash
echo I will now check your work, wait a few seconds please
sleep 5
if grep bob /etc/passwd  &>/dev/null
then
	echo congratulations, you completed this lab successfully!
else
	echo sorry, I cant find user bob
	echo 'do you want me to show you the solution (y/n)'?
	read ANSWER
	if [ $ANSWER = y ]
	then
		echo okay, this is what you should do
		echo useradd bob
		echo 'would you like me to clean up now so that you can try yourself (y/n)'?
		read CLEANUP	
		if [ $CLEANUP = y ]
		then
			userdel -rf bob &>/dev/null
			echo I finished cleaning up, you can now try again
		else
			echo not cleaning up anything
			exit 9
		fi
	else
		echo not showing a solution, terminating
		exit 8
	fi
fi

