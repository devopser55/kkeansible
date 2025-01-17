## datbase script
#set -x

DBHOST=localhost
DBADMINUSER=root
DBNAME=kodekloud_db01
DBUSER=kodekloud_roy
#DBUSERPWD=asdfgdsd
DB_EXISTS_MSG="Database already exists"
DB_CREATED_MSG="Database $DBNAME has been created"
DB_NOTEMPTY_MSG="database is not empty"
DB_DUMPIMPORTED_MSG="imported database dump into kodekloud_db01 database"
DB_IMPORT_FILE=/opt/db_backups/db.sql
DB_DUMP_FILE=/opt/db_backups/kodekloud_db01.sql

## run command to create the db instance
sudo mysql -u $DBADMINUSER -e "CREATE DATABASE $DBNAME;"

if [[ $? == 0 ]]
  then
    echo "$DB_CREATED_MSG"
else
  echo "$DB_EXISTS_MSG"
  ## extra tassks if the db exists
fi


## set the dbinstance to use
## run command to create the user
sudo mysql -u $DBADMINUSER -e "USE $DBNAME;"
sudo mysql -u $DBADMINUSER -e "CREATE USER '$DBUSER'@'%' IDENTIFIED BY 'asdfgdsd';"
sudo mysql -u $DBADMINUSER -e "GRANT ALL ON $DBNAME.* TO '$DBUSER'@'%';"

## run command to display tables in the database
sudo mysql -u root -e "show tables from $DBNAME;" 2>&1 > /tmp/mysql_command.out

if [[ -s /tmp/mysql_command.out ]]
  then
    # true and file is greater than zero meaning db has tables
    echo "$DB_NOTEMPTY_MSG"
else
    # false and file is empty meaning no issues and db is empty so import db dump 
    # run mysql to import sql dump
    sudo mysql -u $DBADMINUSER $DBNAME < $DB_IMPORT_FILE
    echo "$DB_DUMPIMPORTED_MSG"
fi

## take a db dump
sudo mysqldump -u $DBADMINUSER $DBNAME > $DB_DUMP_FILE
