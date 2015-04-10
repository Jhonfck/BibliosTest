-- User_Loan [rel9]
alter table "APP"."LOAN"  add column  "USER_OID_3"  integer;


-- User.# Loads [User#att35]
drop view "APP"."USER_LOADS_VIEW";
create view "APP"."USER_LOADS_VIEW" as
select AL1."OID" as "OID", count(distinct AL2."OID") as "DER_ATTR"
from  "APP"."USER" AL1 
               left outer join "APP"."LOAN" AL2 on AL1."OID"=AL2."USER_OID_3"
group by AL1."OID";


