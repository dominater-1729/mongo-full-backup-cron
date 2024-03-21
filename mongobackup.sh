#!/bin/sh

MONGO_DATABASE="mydb"
# Backup directory
BACKUPS_DIR="/home/authenticode/Desktop/Practice/$MONGO_DATABASE"
# Days to keep the backup
DAYSTORETAINBACKUP="14"

#=====================================================================

TIMESTAMP=`date +%F-%H%M`
BACKUP_NAME="$MONGO_DATABASE-$TIMESTAMP"

echo "Performing backup of $MONGO_DATABASE"
echo "--------------------------------------------"
# Create backup directory
if ! mkdir -p $BACKUPS_DIR; then
  echo "Can't create backup directory in $BACKUPS_DIR. Go and fix it!" 1>&2
  exit 1;
fi;

mongodump --uri=mongodb+srv://kundan:Oy6IP3Es6iSpAYsX@cluster0.c8z5ezw.mongodb.net/prayerQuest

mongorestore --uri mongodb+srv://shubhamjr:shubhamjr@trial.nihmrhd.mongodb.net/?retryWrites=true&w=majority&appName=trial --db admin --drop $BACKUP_NAME

echo "--------------------------------------------"
echo "Database backup complete!"


# crontab -e
# * * * * * /home/authenticode/Desktop/Practice/backup_script/mongobackup.sh >> /home/authenticode/Desktop/Practice/cronlog.log 2&1