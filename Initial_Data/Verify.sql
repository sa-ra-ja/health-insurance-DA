select 'ADDRESS',count(*) AS COUNT from ADDRESS UNION ALL
select 'BILLING',count(*) AS COUNT from BILLING UNION ALL 
select 'CITY',count(*) AS COUNT from CITY UNION ALL 
select 'CLAIM',count(*) AS COUNT from CLAIM UNION ALL 
select 'COUNTRY',count(*) AS COUNT from COUNTRY UNION ALL 
select 'DEPARTMENT',count(*) AS COUNT from DEPARTMENT UNION ALL 
select 'DISEASE',count(*) AS COUNT from DISEASE UNION ALL 
select 'DOCTOR',count(*) AS COUNT from DOCTOR UNION ALL 
select 'E_ADDRESS',count(*) AS COUNT from E_ADDRESS UNION ALL 
select 'FAMILY_DETAIL',count(*) AS COUNT from FAMILY_DETAIL UNION ALL 
select 'HOSPITAL',count(*) AS COUNT from HOSPITAL UNION ALL 
select 'PATIENT',count(*) AS COUNT from PATIENT UNION ALL 
select 'POLICY',count(*) AS COUNT from POLICY UNION ALL 
select 'STAFF',count(*) AS COUNT from STAFF UNION ALL 
select 'STATE',count(*) AS COUNT from STATE UNION ALL 
select 'TEST',count(*) AS COUNT from TEST;


--"ADDRESS","25"
--"BILLING","15"
--"CITY","17"
--"CLAIM","11"
--"COUNTRY","8"
--"DEPARTMENT","10"
--"DISEASE","11"
--"DOCTOR","10"
--"E_ADDRESS","150"
--"FAMILY_DETAIL","125"
--"HOSPITAL","10"
--"PATIENT","100"
--"POLICY","6"
--"STAFF","25"
--"STATE","15"
--"TEST","11"