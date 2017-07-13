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
echo -e "\nEnter the host"
read host
echo -e "\nWrite the name of the database"
read database
echo -e "\nUser database (Default root)"
read user
echo -e "\nPath to create the file (Default /root/)"
read path

if [ -z "$host"]; then
	host="localhost"
fi

if [ -z "$user"]; then
	user="root"
fi

if [ -z "$path"]; then
	path="/root/"
fi

echo -e "\nStart backup ..."
echo -e "Host:\t\t\t\t$host"
echo -e "Database:\t\t\t$database"
echo -e "User:\t\t\t\t$user"
echo -e "Path:\t\t\t\t$path"

# MySQL
mysqldump --host $host --user $user --password --default-character-set=utf8 --events --routines $database | sed -e 's/DEFINER[ ]*=[ ]*[^*]*\*/\*/' > $path$database$DATE.sql
sed -i "1i DROP SCHEMA IF EXISTS $database;\nCREATE SCHEMA $database;\nUSE $database;" $path$database$DATE.sql

echo -e "\nBackup:\t$path$database$DATE.sql"
echo "S U C C E S S!"