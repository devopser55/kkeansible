# database script

DBHOST=locahost
DBADMINUSER=root
DBNAME=kodekloud_db01
DBUSER=kodekloud_roy
DB_EXISTS_MSG="Database already exists"
DB_CREATED_MSG="Database $DBNAME has been created"
DB_NOTEMPTY_MSG="database is not empty"
DB_DUMPIMPORTED_MSG="imported database dump into $DBNAME database"
DB_IMPORT_FILE=/opt/db_backups/db.sql
DB_DUMP_FILE=/opt/db_backups/kodekloud_db01.sql

# create DB instance
sudo mysql -u $DBADMINUSER -e "CREATE DATABASE $DBNAME;"

if [[ $? == 0 ]]
  then
    echo "$DB_CREATED_MSG"
else
    echo "$DB_EXISTS_MSG"
fi

### db instance to use
### create the db user


sudo mysql -u $DBADMINUSER -e "USE $DBNAME;"
sudo mysql -u $DBADMINUSER -e "CREATE USER '$DBUSER'@'%' IDENTIFIED BY 'asdfgdsd';"
sudo mysql -u $DBADMINUSER -e "GRANT ALL ON $DBNAME.* TO '$DBUSER'@'%';"

sudo mysql -u $DBADMINUSER -e "show tables from $DBNAME;" 2>&1 > /tmp/mysql_command.out

if [[ -s /tmp/mysql_command.out ]]
  then
    echo "$DB_NOTEMPTY_MSG"
else
    sudo mysql -u $DBADMINUSER $DBNAME < $DB_IMPORT_FILE
    echo "$DB_DUMPIMPORTED_MSG"
fi

sudo mysqldump -u $DBADMINUSER $DBNAME > $DB_DUMP_FILE
