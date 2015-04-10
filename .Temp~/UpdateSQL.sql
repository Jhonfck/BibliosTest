-- Penalty [ent9]
create table "APP"."PENALTY" (
   "OID"  integer  not null,
   "CODEUSER"  integer,
   "PENALTYDATE"  date,
   "AMOUNT"  integer,
  primary key ("OID")
);


-- Loan_Penalty [rel13]
alter table "APP"."LOAN"  add column  "PENALTY_OID"  integer;


