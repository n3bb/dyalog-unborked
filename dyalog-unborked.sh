#!/bin/bash
# dyalog-unborked.sh - utility to help install and run dyalog with RIDE
# make sure to run with root privileges

# double check the correctness of these variables before running - use full pathnames for file locations

packages_nonfree_dir='/home/nebb/Packages/Nonfree/' 
packages_free_dir='/home/nebb/Packages/Free/' 
dyalog_deb_url='https://www.dyalog.com/uploads/php/download.dyalog.com/download.php?file=18.0/linux_64_18.0.39712_unicode.x86_64.deb' # check that this is the latest - see dyalog site
dyalog_rpm_url='https://www.dyalog.com/uploads/php/download.dyalog.com/download.php?file=18.0/linux_64_18.0.39712_unicode.x86_64.rpm' # ditto
dyalog_ver='18.0' # edit as required
bash_rc_file='/home/path/to/bashrc'
ride_deb_url='https://github.com/Dyalog/ride/releases/download/v4.3.3463/ride-4.3.3463-1_amd64.deb'
ride_rpm_url='https://github.com/Dyalog/ride/releases/download/v4.3.3463/ride-4.3.3463-1.x86_64.rpm'
ride_ver='4.3.3463'

if [ $1 == "install" ]
then   
    case $2 in
	deb)
	    wget -O ${packages_nonfree_dir}dyalog$dyalog_ver.deb $dyalog_deb_url
	    dpkg -i ${packages_nonfree_dir}dyalog$dyalog_ver.deb
	    wget -O ${packages_free_dir}ride$ride_ver.deb $ride_deb_url
	    dpkg -i ${packages_free_dir}ride$ride_ver.deb
	    apt --fix-broken install # fix any unmet dependencies
	    ;;
	rpm)
	    echo "No RPM install support just yet - please contribute at https://github.com/n3bb/dyalog-unborked"
	    exit
	    ;;
	*)
	    echo "Sub-sub-command $2 not recognised - options are 'deb' or 'rpm'"
	    exit
	    ;;
   esac
elif [ $1 == "run" ]
then
    env RIDE_CONNECT=localhost:4502 ride &
    dyalog +s -q -nokbd RIDE_INIT=SERVE:*:4502
else
    echo "Sub-command $1 not recognised. Exiting!"
    exit
fi
