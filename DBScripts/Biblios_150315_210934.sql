-- Rules [ent5]
alter table "APP"."RULES"  add column  "RULESNAME"  varchar(255);


-- Rules_CollectionBiblioMaterial [rel7]
alter table "APP"."RULES"  add column  "COLLECTIONBIBLIOMATERIAL_OID"  integer;
alter table "APP"."RULES"   add constraint FK_RULES_COLLECTIONBIBLIOMATER foreign key ("COLLECTIONBIBLIOMATERIAL_OID") references "APP"."COLLECTIONBIBLIOMATERIAL" ("OID");


