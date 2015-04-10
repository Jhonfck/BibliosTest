-- Loan [ent7]
create table "APP"."LOAN" (
   "OID"  integer  not null,
   "LOANDATE"  timestamp,
   "RETURNDATE"  timestamp,
   "COPIESID"  varchar(255),
  primary key ("OID")
);


-- User [User]
alter table "APP"."USER"  add column  "CODE"  integer;


-- Rules_Group [rel4]
alter table "APP"."RULES"  add column  "OID"  integer;
alter table "APP"."RULES"   add constraint FK_RULES_GROUP_2 foreign key ("OID") references "APP"."GROUP" ("OID");


-- Copies_Loan [rel8]
alter table "APP"."COPIES"  add column  "LOAN_OID"  integer;
alter table "APP"."COPIES"   add constraint FK_COPIES_LOAN foreign key ("LOAN_OID") references "APP"."LOAN" ("OID");


-- Rules_Loan [rel9]
alter table "APP"."RULES"  add column  "LOAN_OID"  integer;
alter table "APP"."RULES"   add constraint FK_RULES_LOAN foreign key ("LOAN_OID") references "APP"."LOAN" ("OID");


-- REL FK: RulesToCollectionBiblioMaterial [rel7#role13]
alter table "APP"."RULES"   add constraint FK_COLLECTIONBIBLIOMATERIAL_RU foreign key ("OID") references "APP"."RULES" ("OIDRULES");


