-- CollectionBiblioMaterial [ent4]
create table "APP"."COLLECTIONBIBLIOMATERIAL" (
   "OID"  integer  not null,
   "COLLECTIONNAME"  varchar(255),
  primary key ("OID")
);


-- Rules [ent5]
create table "APP"."RULES" (
   "OID"  integer  not null,
   "RETURNDAYS"  integer,
   "PENALTYDAYS"  integer,
  primary key ("OID")
);


-- Group [Group]
alter table "APP"."GROUP"  add column  "NUMBERBOOKSLEND"  integer;


-- BiblioMaterial_CollectionBiblioMaterial [rel3]
alter table "APP"."BIBLIOMATERIAL"  add column  "COLLECTIONBIBLIOMATERIAL_OID"  integer;
alter table "APP"."BIBLIOMATERIAL"   add constraint FK_BIBLIOMATERIAL_COLLECTIONBI foreign key ("COLLECTIONBIBLIOMATERIAL_OID") references "APP"."COLLECTIONBIBLIOMATERIAL" ("OID");


-- Rules_Group [rel4]
alter table "APP"."GROUP"  add column  "RULES_OID"  integer;
alter table "APP"."GROUP"   add constraint FK_GROUP_RULES foreign key ("RULES_OID") references "APP"."RULES" ("OID");


-- Rules_CollectionBiblioMaterial [rel5]
alter table "APP"."COLLECTIONBIBLIOMATERIAL"  add column  "RULES_OID"  integer;
alter table "APP"."COLLECTIONBIBLIOMATERIAL"   add constraint FK_COLLECTIONBIBLIOMATERIAL_RU foreign key ("RULES_OID") references "APP"."RULES" ("OID");


