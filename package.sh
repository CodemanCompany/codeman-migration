#!/bin/bash
#  ██████╗ ██████╗ ██████╗ ███████╗███╗   ███╗ █████╗ ███╗   ██╗
# ██╔════╝██╔═══██╗██╔══██╗██╔════╝████╗ ████║██╔══██╗████╗  ██║
# ██║     ██║   ██║██║  ██║█████╗  ██╔████╔██║███████║██╔██╗ ██║
# ██║     ██║   ██║██║  ██║██╔══╝  ██║╚██╔╝██║██╔══██║██║╚██╗██║
# ╚██████╗╚██████╔╝██████╔╝███████╗██║ ╚═╝ ██║██║  ██║██║ ╚████║
#  ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝

# Variables
DATE=`date +%Y%m%d%H%M%S`

clear
echo -e "\n ██████╗ ██████╗ ██████╗ ███████╗███╗   ███╗ █████╗ ███╗   ██╗
██╔════╝██╔═══██╗██╔══██╗██╔════╝████╗ ████║██╔══██╗████╗  ██║
██║     ██║   ██║██║  ██║█████╗  ██╔████╔██║███████║██╔██╗ ██║
██║     ██║   ██║██║  ██║██╔══╝  ██║╚██╔╝██║██╔══██║██║╚██╗██║
╚██████╗╚██████╔╝██████╔╝███████╗██║ ╚═╝ ██║██║  ██║██║ ╚████║
 ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝"
df -h
echo -e "\n\nWrite the name of the project"
read project
echo -e "\nPath to create the file (Default: /root/)"
read path
echo -e "\nDirectory to back up (Full)"
read directory

if [ -z "$path"]; then
	path="/root/"
fi

echo -e "\nStart backup ..."
echo -e "Project:\t\t\t$project"
echo -e "Path:\t\t\t\t$path"
echo -e "Directory:\t\t\t$directory\n"

zip -r0 $path"backup-"$project-$DATE.zip $directory
echo -e "\nBackup:\t"$path"backup-"$project-$DATE.zip
echo "S U C C E S S!"