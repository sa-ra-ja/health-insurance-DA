hostname="jdbc:postgresql://db-insurance.************.ap-south-1.rds.amazonaws.com:****/insurance"
user="postgres"
pwd="*********"

sqoop import --connect $hostname --username $user --password $pwd -m 1 --fetch-size 10 --table $1 --create-hive-table --hive-table prod.$2 --hive-import

echo "rds table $1 imported to hive as $2"
