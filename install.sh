#! /bin/bash
# Programming and idea by : E2MA3N [Iman Homayouni]
# Gitbub : https://github.com/e2ma3n
# Email : e2ma3n@Gmail.com
# Website : http://OSLearn.ir
# License : GPL v3.0
# Gcheck v2.0 - Install [Gmail Notification]
#--------------------------------------------------------#

# help function
function help_f {
	echo 'Usage: '
	echo '	sudo ./install.sh -i [install program]'
	echo '	sudo ./install.sh -c [check dependencies]'
}

# check dependencies in system
function check_f {
	echo '[+] check dependencies in system:  '
	for program in sleep curl zenity sox
	do
		if [ ! -z `which $program 2> /dev/null` ] ; then
			echo "[+] $program found"
		else
			echo "[-] Error: $program not found"
		fi
		sleep 0.5
	done
}

function install_f {
	sleep 0.5
	echo '[+] Gcheck v2.0 [Gmail Notification]'
	
	sleep 1.5
	echo '[+] Programming and idea by : E2MA3N [Iman Homayouni]'
	
	sleep 3
	read -p '[+] Enter Gmail username : ' username
	read -p '[+] Enter Gmail password : ' password
	echo -en '[+] Play sound with notification ? [y/n] : ' ; read sound_q
	if [ "$sound_q" = "y" ] ; then
		echo -en '[+] Enter sound address : ' ; read sound_a
		sound_v="		play $sound_a &> /dev/null"
	elif [ "$sound_q" = "n" ] ; then
		sound_v="		# No sound"
	else
		echo '[-] Bad input !, we anser n automaticly'
		sound_v='		# No sound'
	fi

	sleep 1.5
	echo '[+] Creating Gcheck.sh file'

	sleep 1.5
	echo -en "[+] Please wait"
	
	echo "#! /bin/bash" > Gcheck.sh
	echo "# Programming and idea by : E2MA3N [Iman Homayouni]" >> Gcheck.sh
	echo "# Gitbub : https://github.com/e2ma3n" >> Gcheck.sh
	echo "# Email : e2ma3n@Gmail.com" >> Gcheck.sh
	echo "# Website : http://OSLearn.ir" >> Gcheck.sh
	echo "# License : GPL v3.0" >> Gcheck.sh
	echo "# Gcheck v2.0 - Core [Gmail Notification]" >> Gcheck.sh
	echo "#--------------------------------------------------------#" >> Gcheck.sh

	sleep 1.5
	echo -en '.'

	echo "user=$username" >> Gcheck.sh
	echo "pass=$password" >> Gcheck.sh
	echo "" >> Gcheck.sh
	echo 'sleep 10' >> Gcheck.sh
	echo "j=0 ; for ((;;)) ; do" >> Gcheck.sh
	echo '	n=`curl -u $user:$pass --silent 'https://mail.google.com/mail/feed/atom' | cut -d ">" -f 8 | cut -d "<" -f 1`' >> Gcheck.sh

	sleep 1.5
	echo -en '.'

	echo '	if [ "$n" -gt "$j" ]; then' >> Gcheck.sh
	echo '		zenity --timeout=1 --notification --text "You have $n unread email"' >> Gcheck.sh
	echo "$sound_v" >> Gcheck.sh
	echo '		sleep 172' >> Gcheck.sh
	echo '	else' >> Gcheck.sh
	echo '		sleep 173' >> Gcheck.sh
	echo '	fi' >> Gcheck.sh
	echo '	j=$n' >> Gcheck.sh
	echo 'done' >> Gcheck.sh
	
	sleep 1.5
	echo '.'

	echo '[+] Please see README'
	sleep 2

	echo '[+] Done'
}

case $1 in
	-i) install_f ;;
	-c) check_f ;;
	*) help_f ;;
esac
