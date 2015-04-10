-- Loan.Code [ent7#att48]
create view "APP"."LOAN_CODE_VIEW" as
select AL1."OID" as "OID", AL2."CODE" as "DER_ATTR"
from  "APP"."LOAN" AL1 
               left outer join "APP"."USER" AL2 on AL1."USER_OID_3"=AL2."OID";


