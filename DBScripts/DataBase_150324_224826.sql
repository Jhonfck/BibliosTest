-- Reserve [ent8]
alter table "APP"."RESERVE"  add column  "USERCODE"  integer;
alter table "APP"."RESERVE"  add column  "BIBLIOMATERIALNAME"  varchar(255);


-- Rules_Group [rel4]
alter table "APP"."RULES"  add column  "OID"  integer;


