-- BiblioMaterial [ent3]
create table "APP"."BIBLIOMATERIAL" (
   "OID"  integer  not null,
   "ISBN"  varchar(255)  not null,
   "BIBLIOMATERIALNAME"  varchar(255),
   "DESCRIPTIONMATERIAL"  varchar(255),
  primary key ("OID", "ISBN")
);


-- BiblioMaterial_StatusBiblioMaterial [rel1]
alter table "APP"."BIBLIOMATERIAL"  add column  "STATUSBIBLIOMATERIAL_OID"  integer;
alter table "APP"."BIBLIOMATERIAL"   add constraint FK_BIBLIOMATERIAL_STATUSBIBLIO foreign key ("STATUSBIBLIOMATERIAL_OID") references "APP"."STATUSBIBLIOMATERIAL" ("OID");


-- BiblioMaterial_TypeBiblioMaterial [rel2]
alter table "APP"."BIBLIOMATERIAL"  add column  "TYPEBIBLIOMATERIAL_OID"  integer;
alter table "APP"."BIBLIOMATERIAL"   add constraint FK_BIBLIOMATERIAL_TYPEBIBLIOMA foreign key ("TYPEBIBLIOMATERIAL_OID") references "APP"."TYPEBIBLIOMATERIAL" ("OID");


