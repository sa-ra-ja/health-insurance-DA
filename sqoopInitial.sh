##LOADING JDBC DRIVER ###
#cd /usr/lib/sqoop/lib
#sudo curl -O https://jdbc.postgresql.org/download/postgresql-42.6.2.jar
#cd
### LOADINF REFERENCE TABLES/STATIC TABLES
hive -e "drop database prod cascade;"
hive -e "create database prod;"
hostname="jdbc:postgresql://db-insurance.cr22ga0waq41.ap-south-1.rds.amazonaws.com:5432/insurance"
user="postgres"
pwd="srjAwsRds"
###ADDRESS
sqoop import --connect $hostname --username $user --password $pwd -m 1 --fetch-size 10 --table address --create-hive-table --hive-table prod.address_hve --hive-import

echo "Address_hve Table Imported"

###CITY

sqoop import --connect $hostname --username $user --password $pwd -m 1 --fetch-size 10 --table city --create-hive-table --hive-table prod.city_hve --hive-import

echo "city_hve Table Imported"

###COUNTRY

sqoop import --connect $hostname --username $user --password $pwd -m 1 --fetch-size 10 --table country --create-hive-table --hive-table prod.country_hve --hive-import

echo "country_hve Table Imported"

###DEPARTMENT

sqoop import --connect $hostname --username $user --password $pwd -m 1 --fetch-size 10 --table department  --create-hive-table --hive-table prod.department_hve --hive-import

echo "department_hve Table Imported"
 
###DISEASE

sqoop import --connect $hostname --username $user --password $pwd -m 1 --fetch-size 10 --table disease --create-hive-table --hive-table prod.disease_hve --hive-import

echo "disease_hve Table Imported"

###DOCTOR

sqoop import --connect $hostname --username $user --password $pwd -m 1 --fetch-size 10 --table doctor --create-hive-table --hive-table prod.doctor_hve --hive-import

echo "doctor_hve Table Imported"

###E_ADDRESS 

sqoop import --connect $hostname --username $user --password $pwd -m 1 --fetch-size 10 --table e_address --create-hive-table --hive-table prod.e_address_hve --hive-import

echo "e_address_hve Table Imported"

###HOSPITAL

sqoop import --connect $hostname --username $user --password $pwd -m 1 --fetch-size 10 --table hospital --create-hive-table --hive-table prod.hospital_hve --hive-import

echo "hospital_hve Table Imported"

###POLICY

sqoop import --connect $hostname --username $user --password $pwd -m 1 --fetch-size 10 --table policy --create-hive-table --hive-table prod.policy_hve --hive-import

echo "policy_hve Table Imported"

###STATE

sqoop import --connect $hostname --username $user --password $pwd -m 1 --fetch-size 10 --table state --create-hive-table --hive-table prod.state_hve --hive-import

echo "state_hve Table Imported"

###TEST

sqoop import --connect $hostname --username $user --password $pwd -m 1 --fetch-size 10 --table test --create-hive-table --hive-table prod.test_hve --hive-import

echo "test_hve Table Imported" 

echo "#######ALL REF TABLES LOADED#########"  
###LOADING TRANSACTIONAL TABLES/DYNAMIC TABLES
###BILLING

sqoop import --connect $hostname --username $user --password $pwd -m 1 --fetch-size 10 --table billing --create-hive-table --hive-table prod.billing_hve --hive-import

echo "billing_hve Table Imported"

#CLAIM

sqoop import --connect $hostname --username $user --password $pwd -m 1 --fetch-size 10 --table claim  --create-hive-table --hive-table prod.claim_hve --hive-import

echo "claim_hve Table Imported"

#FAMILY_DETAIL

sqoop import --connect $hostname --username $user --password $pwd -m 1 --fetch-size 10 --table family_detail --create-hive-table --hive-table prod.family_detail_hve --hive-import

echo "family_detail_hve Table Imported"
 
#patient

sqoop import --connect $hostname --username $user --password $pwd -m 1 --fetch-size 10 --table patient --create-hive-table --hive-table prod.patient_hve --hive-import

echo "patient_hve Table Imported"

#STAFF

sqoop import --connect $hostname --username $user --password $pwd -m 1 --fetch-size 10 --table staff --create-hive-table --hive-table prod.staff_hve --hive-import

echo "staff_hve Table Imported"

echo "##############Transactional Table  Load Completed################"   

###VERIFYING###
 hive -e "use prod;
select 'ADDRESS_hve',count(*) AS COUNT from ADDRESS_hve UNION ALL
select 'BILLING_hve',count(*) AS COUNT from BILLING_hve UNION ALL 
select 'CITY_hve',count(*) AS COUNT from CITY_hve UNION ALL 
select 'CLAIM_hve',count(*) AS COUNT from CLAIM_hve UNION ALL 
select 'COUNTRY_hve',count(*) AS COUNT from COUNTRY_hve UNION ALL 
select 'DEPARTMENT_hve',count(*) AS COUNT from DEPARTMENT_hve UNION ALL 
select 'DISEASE_hve',count(*) AS COUNT from DISEASE_hve UNION ALL 
select 'DOCTOR_hve',count(*) AS COUNT from DOCTOR_hve UNION ALL 
select 'E_ADDRESS_hve',count(*) AS COUNT from E_ADDRESS_hve UNION ALL 
select 'FAMILY_DETAIL_hve',count(*) AS COUNT from FAMILY_DETAIL_hve UNION ALL 
select 'HOSPITAL_hve',count(*) AS COUNT from HOSPITAL_hve UNION ALL 
select 'PATIENT_hve',count(*) AS COUNT from PATIENT_hve UNION ALL 
select 'POLICY_hve',count(*) AS COUNT from POLICY_hve UNION ALL 
select 'STAFF_hve',count(*) AS COUNT from STAFF_hve UNION ALL 
select 'STATE_hve',count(*) AS COUNT from STATE_hve UNION ALL 
select 'TEST_hve',count(*) AS COUNT from TEST_hve;" >> l1-count.txt



cat l1-count.txt