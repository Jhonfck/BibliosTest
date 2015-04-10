-- Copies [ent6]
create table "APP"."COPIES" (
   "OID"  integer  not null,
   "COPIESID"  varchar(255),
   "TYPECOPIES"  varchar(255),
  primary key ("OID")
);


-- BiblioMaterial_BiblioMaterial [rel5]
alter table "APP"."COPIES"  add column  "BIBLIOMATERIAL_OID"  integer;
alter table "APP"."COPIES"   add constraint FK_COPIES_BIBLIOMATERIAL foreign key ("BIBLIOMATERIAL_OID") references "APP"."BIBLIOMATERIAL" ("OID");


-- Copies_StatusBiblioMaterial [rel6]
alter table "APP"."COPIES"  add column  "STATUSBIBLIOMATERIAL_OID"  integer;
alter table "APP"."COPIES"   add constraint FK_COPIES_STATUSBIBLIOMATERIAL foreign key ("STATUSBIBLIOMATERIAL_OID") references "APP"."STATUSBIBLIOMATERIAL" ("OID");


-- REL FK: BiblioMaterialToStatusBiblioMaterial [rel1#role1]
alter table "APP"."BIBLIOMATERIAL"   add constraint FK_STATUSBIBLIOMATERIAL_BIBLIO foreign key ("OID") references "APP"."BIBLIOMATERIAL" ("OID");


-- REL FK: BiblioMaterialToTypeBiblioMaterial [rel2#role3]
alter table "APP"."BIBLIOMATERIAL"   add constraint FK_TYPEBIBLIOMATERIAL_BIBLIOMA foreign key ("OID") references "APP"."BIBLIOMATERIAL" ("OID");


-- REL FK: BiblioMaterialToCollectionBiblioMaterial [rel3#role5]
alter table "APP"."BIBLIOMATERIAL"   add constraint FK_COLLECTIONBIBLIOMATERIAL_BI foreign key ("OID") references "APP"."BIBLIOMATERIAL" ("OID");


-- BiblioMaterial.# Copies [ent3#att32]
create view "APP"."BIBLIOMATERIAL_COPIES_VIEW" as
select AL1."OID" as "OID", count(distinct AL2."OID") as "DER_ATTR"
from  "APP"."BIBLIOMATERIAL" AL1 
               left outer join "APP"."COPIES" AL2 on AL1."OID"=AL2."BIBLIOMATERIAL_OID"
group by AL1."OID";


