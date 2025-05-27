#handle Updated Data



#create table in hive if not exist 
hive -e "CREATE  TABLE IF NOT EXISTS prod.PATIENT_delta(PID INT,F_NAME STRING,L_NAME STRING,B_DATE TIMESTAMP ,PHONE INT,AADHAR INT,SYS_CRE_DATE TIMESTAMP,SYS_UPD_DATE TIMESTAMP ,SEX STRING ,P_ADD STRING,E_ADD STRING,BL_GR STRING,POL_NO INT,CLAIM_ID INTEGER,POL_TYPE_ID INTEGER,MED_HIST STRING) ROW format delimited FIELDS TERMINATED BY ',' STORED AS TEXTFILE;"

hive -e "CREATE  TABLE  IF NOT EXISTS prod.STAFF_delta(EMP_ID INT,F_NAME STRING,L_NAME STRING,B_DATE TIMESTAMP,PHONE INTEGER,AADHAR INTEGER,JOIN_DATE TIMESTAMP,SYS_CRE_DATE TIMESTAMP ,SYS_UPD_DATE TIMESTAMP,SEX STRING,P_ADD STRING,E_ADD STRING,BL_GR STRING,POL_NO INTEGER,D_ID STRING,CLAIM_ID INTEGER,POL_TYPE_ID INTEGER,MED_HIST STRING)  ROW format delimited FIELDS TERMINATED BY ',' STORED AS TEXTFILE;"

hostname="jdbc:postgresql://db-insurance.cr22ga0waq41.ap-south-1.rds.amazonaws.com:5432/insurance"
user="postgres"
pwd="srjAwsRds"

#PATIENT
#hive -e "drop table prod.patient_delta;"

sqoop import --connect $hostname --username $user --password $pwd -m 1 --fetch-size 10 --table patient  --incremental lastmodified --check-column sys_upd_date --last-value '1993-05-22 00:00:00.0' --target-dir /user/hive/warehouse/prod.db/patient_delta --append

echo "patient_delta Table Imported"

#STAFF
#hive -e "drop table prod.staff_delta;"

sqoop import --connect $hostname --username $user --password $pwd -m 1 --fetch-size 10 --table staff --incremental lastmodified --check-column sys_upd_date --last-value '1991-04-08 00:00:00.0' --target-dir /user/hive/warehouse/prod.db/staff_delta --append

echo "staff_delta Table Imported"

#hive -e "msck repair table prod.patient_delta;"
#hive -e "msck repair table prod.staff_delta;"

echo "##############Transactional Table Updated Data Load Completed################"