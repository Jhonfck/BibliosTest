-- Copies [ent6]
create table "APP"."COPIES" (
   "OID"  integer  not null,
   "COPIESID"  varchar(255)  not null,
   "TYPECOPIES"  varchar(255),
  primary key ("OID", "COPIESID")
);


-- BiblioMaterial_BiblioMaterial [rel5]
alter table "APP"."COPIES"  add column  "BIBLIOMATERIAL_OID"  integer;
alter table "APP"."COPIES"  add column  "BIBLIOMATERIAL_ISBN"  varchar(255);
alter table "APP"."COPIES"   add constraint FK_COPIES_BIBLIOMATERIAL foreign key ("BIBLIOMATERIAL_OID", "BIBLIOMATERIAL_ISBN") references "APP"."BIBLIOMATERIAL" ("OID", "ISBN");


-- Copies_StatusBiblioMaterial [rel6]
alter table "APP"."COPIES"  add column  "STATUSBIBLIOMATERIAL_OID"  integer;
alter table "APP"."COPIES"   add constraint FK_COPIES_STATUSBIBLIOMATERIAL foreign key ("STATUSBIBLIOMATERIAL_OID") references "APP"."STATUSBIBLIOMATERIAL" ("OID");


-- BiblioMaterial.# Copies [ent3#att32]
create view "APP"."BIBLIOMATERIAL_COPIES_VIEW" as
select AL1."OID" as "OID", AL1."ISBN" as "ISBN", count(distinct ( cast(AL2."COPIESID" as varchar(255))||'_$$_'||cast(AL2."OID" as varchar(255)))) as "DER_ATTR"
from  "APP"."BIBLIOMATERIAL" AL1 
               left outer join "APP"."COPIES" AL2 on AL1."OID"=AL2."BIBLIOMATERIAL_OID" and AL1."ISBN"=AL2."BIBLIOMATERIAL_ISBN"
group by AL1."OID", AL1."ISBN";


