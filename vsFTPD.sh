#!/bin/bash
#Tankibaj
#https://github.com/tankibaj

clear
# Options
echo ""
echo ""
echo "# What do you want to do?"
echo "		1) Install vsftpd"
echo "		2) Add ftp user"
echo "		3) Restart vsftpd"
echo "		4) Add Apache2 FTP user"
echo "		5) Allow/Disallow FTP user"
echo "		6) Uninstall vsftpd"
echo "		7) Exit"

#
read -p "# Select an option [1-7]: " option
echo ""
echo ""

	# Start case
	case $option in
		
		1) ############################################
			#
			echo ""
			echo "################### Checking out update and upgrade ###################"
			echo ""
			apt-get update
			apt-get upgrade -y
			clear
			echo ""
			echo "Checked update and upgrade"
			echo "Done......"
			echo ""

			#
			echo ""
			echo "################### Installing vsftpd ###################"
			echo ""
			apt-get install vsftpd -y
			echo ""
			echo "Done..."
			echo ""

			#
			echo ""
			echo "################### Open up the configuration file & edit ###################"
			echo ""
			echo "write_enable=YES" >> /etc/vsftpd.conf
			echo "chroot_local_user=YES" >> /etc/vsftpd.conf
			echo "allow_writeable_chroot=YES" >> /etc/vsftpd.conf
			/etc/init.d/vsftpd restart
			echo ""
			echo "Done..."
			echo ""

			# Final Messsage
			echo ""
			echo ""
			echo ""
			echo ""
			echo ""
			echo "============================================================"
			echo "Congrats... your vsftpd server is ready :)"
			echo "Please add user to use ftp"
			echo "============================================================"
			echo ""
			echo ""
			echo ""
			echo ""
			echo ""
		exit;;

		
		2) ############################################
			#
			echo ""
			echo "################### Add User ###################"
			echo ""
			read -p "User name: " -e -i tankibaj USER
			adduser $USER
			chown -R $USER:$USER /home/$USER/
			/etc/init.d/vsftpd restart
			echo ""
			echo "Done..."
			echo ""

			#
			echo ""
			echo "################### Finding Server Public IP ###################"
			echo ""
			PIP=`wget -q -O - http://api.ipify.org`
			echo "Done..."

			# Final Messsage
			echo ""
			echo ""
			echo ""
			echo ""
			echo ""
			echo "============================================================"
			echo "	Congrats... your vsftpd server is ready :)"
			echo "============================================================"
			echo "	Server IP: $PIP"
			echo "	Username: $USER"
			echo "============================================================"
			echo ""
			echo ""
			echo ""
			echo ""
			echo ""
		exit;;

		
		3) ############################################
			#
			echo ""
			echo "################### Restarting vsftpd ###################"
			echo ""
			/etc/init.d/vsftpd restart
			echo ""
			echo "Done..."
			echo ""
		exit;;

		
		4) ############################################
			#
			echo ""
			echo "################### Apache2 FTP user ###################"
			echo ""
			read -p "User name: " -e -i tankibaj USER
			adduser $USER
			usermod --home /var/www/html $USER
			chown -R $USER:$USER /var/www/html
			/etc/init.d/vsftpd restart
			echo ""
			echo "Done..."
			echo ""

			#
			echo ""
			echo "################### Finding Server Public IP ###################"
			echo ""
			PIP=`wget -q -O - http://api.ipify.org`
			echo "Done..."

			# Final Messsage
			echo ""
			echo ""
			echo ""
			echo ""
			echo ""
			echo "============================================================"
			echo "Your PPTP Server Is Ready.... Enjoy"
			echo "============================================================"
			echo "Server IP: $PIP"
			echo "Username: $USER"
			echo "============================================================"
			echo ""
			echo ""
			echo ""
			echo ""
			echo ""
		exit;;

		
		5) ############################################
			#
			nano /etc/ftpusers
		exit;;

		
		6) ############################################
			#
			echo ""
			echo "################### Uninstalling vsftpd ###################"
			echo ""
			apt-get remove vsftpd
			apt-get purge vsftpd
			echo ""
			echo "Done..."
			echo ""
		exit;;

		
		7) #############################################
		exit;;

	esac

	exit