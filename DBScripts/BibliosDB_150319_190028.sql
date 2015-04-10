-- Group [Group]
create table "APP"."GROUP" (
   "OID"  integer  not null,
   "GROUPNAME"  varchar(255),
   "NUMBERBOOKSLEND"  integer,
  primary key ("OID")
);


-- Module [Module]
create table "APP"."MODULE" (
   "OID"  integer  not null,
   "MODULEID"  varchar(255),
   "MODULENAME"  varchar(255),
  primary key ("OID")
);


-- User [User]
create table "APP"."USER" (
   "OID"  integer  not null,
   "USERNAME"  varchar(255),
   "PASSWORD"  varchar(255),
   "EMAIL"  varchar(255),
   "DATEOFBIRTH"  date,
   "ADDRESSUSER"  varchar(255),
   "CELLPHONE"  varchar(255),
   "LASTNAME"  varchar(255),
   "FIRSTNAME"  varchar(255),
  primary key ("OID")
);


-- StatusBiblioMaterial [ent1]
create table "APP"."STATUSBIBLIOMATERIAL" (
   "OID"  integer  not null,
   "STATUSNAME"  varchar(255),
  primary key ("OID")
);


-- TypeBiblioMaterial [ent2]
create table "APP"."TYPEBIBLIOMATERIAL" (
   "OID"  integer  not null,
   "TYPENAME"  varchar(255),
  primary key ("OID")
);


-- BiblioMaterial [ent3]
create table "APP"."BIBLIOMATERIAL" (
   "OID"  integer  not null,
   "ISBN"  varchar(255),
   "BIBLIOMATERIALNAME"  varchar(255),
   "DESCRIPTIONMATERIAL"  varchar(255),
  primary key ("OID")
);


-- CollectionBiblioMaterial [ent4]
create table "APP"."COLLECTIONBIBLIOMATERIAL" (
   "OID"  integer  not null,
   "COLLECTIONNAME"  varchar(255),
  primary key ("OID")
);


-- Rules [ent5]
create table "APP"."RULES" (
   "OIDRULES"  integer  not null,
   "RETURNDAYS"  integer,
   "PENALTYDAYS"  integer,
   "RULESNAME"  varchar(255),
  primary key ("OIDRULES")
);


-- Copies [ent6]
create table "APP"."COPIES" (
   "OID"  integer  not null,
   "COPIESID"  varchar(255),
   "TYPECOPIES"  varchar(255),
  primary key ("OID")
);


-- Group_DefaultModule [Group2DefaultModule_DefaultModule2Group]
alter table "APP"."GROUP"  add column  "MODULE_OID"  integer;
alter table "APP"."GROUP"   add constraint FK_GROUP_MODULE foreign key ("MODULE_OID") references "APP"."MODULE" ("OID");


-- Group_Module [Group2Module_Module2Group]
create table "APP"."GROUP_MODULE" (
   "GROUP_OID"  integer not null,
   "MODULE_OID"  integer not null,
  primary key ("GROUP_OID", "MODULE_OID")
);
alter table "APP"."GROUP_MODULE"   add constraint FK_GROUP_MODULE_GROUP foreign key ("GROUP_OID") references "APP"."GROUP" ("OID");
alter table "APP"."GROUP_MODULE"   add constraint FK_GROUP_MODULE_MODULE foreign key ("MODULE_OID") references "APP"."MODULE" ("OID");


-- User_DefaultGroup [User2DefaultGroup_DefaultGroup2User]
alter table "APP"."USER"  add column  "GROUP_OID"  integer;
alter table "APP"."USER"   add constraint FK_USER_GROUP foreign key ("GROUP_OID") references "APP"."GROUP" ("OID");


-- User_Group [User2Group_Group2User]
create table "APP"."USER_GROUP" (
   "USER_OID"  integer not null,
   "GROUP_OID"  integer not null,
  primary key ("USER_OID", "GROUP_OID")
);
alter table "APP"."USER_GROUP"   add constraint FK_USER_GROUP_USER foreign key ("USER_OID") references "APP"."USER" ("OID");
alter table "APP"."USER_GROUP"   add constraint FK_USER_GROUP_GROUP foreign key ("GROUP_OID") references "APP"."GROUP" ("OID");


-- BiblioMaterial_StatusBiblioMaterial [rel1]
alter table "APP"."BIBLIOMATERIAL"  add column  "STATUSBIBLIOMATERIAL_OID"  integer;
alter table "APP"."BIBLIOMATERIAL"   add constraint FK_BIBLIOMATERIAL_STATUSBIBLIO foreign key ("STATUSBIBLIOMATERIAL_OID") references "APP"."STATUSBIBLIOMATERIAL" ("OID");


-- BiblioMaterial_TypeBiblioMaterial [rel2]
alter table "APP"."BIBLIOMATERIAL"  add column  "TYPEBIBLIOMATERIAL_OID"  integer;
alter table "APP"."BIBLIOMATERIAL"   add constraint FK_BIBLIOMATERIAL_TYPEBIBLIOMA foreign key ("TYPEBIBLIOMATERIAL_OID") references "APP"."TYPEBIBLIOMATERIAL" ("OID");


-- BiblioMaterial_CollectionBiblioMaterial [rel3]
alter table "APP"."BIBLIOMATERIAL"  add column  "COLLECTIONBIBLIOMATERIAL_OID"  integer;
alter table "APP"."BIBLIOMATERIAL"   add constraint FK_BIBLIOMATERIAL_COLLECTIONBI foreign key ("COLLECTIONBIBLIOMATERIAL_OID") references "APP"."COLLECTIONBIBLIOMATERIAL" ("OID");


-- Rules_Group [rel4]
alter table "APP"."RULES"  add column  "OID"  integer;
alter table "APP"."RULES"   add constraint FK_RULES_GROUP foreign key ("OID") references "APP"."GROUP" ("OID");


-- BiblioMaterial_BiblioMaterial [rel5]
alter table "APP"."COPIES"  add column  "BIBLIOMATERIAL_OID"  integer;
alter table "APP"."COPIES"   add constraint FK_COPIES_BIBLIOMATERIAL foreign key ("BIBLIOMATERIAL_OID") references "APP"."BIBLIOMATERIAL" ("OID");


-- Copies_StatusBiblioMaterial [rel6]
alter table "APP"."COPIES"  add column  "STATUSBIBLIOMATERIAL_OID"  integer;
alter table "APP"."COPIES"   add constraint FK_COPIES_STATUSBIBLIOMATERIAL foreign key ("STATUSBIBLIOMATERIAL_OID") references "APP"."STATUSBIBLIOMATERIAL" ("OID");


-- Rules_CollectionBiblioMaterial [rel7]
alter table "APP"."RULES"  add column  "COLLECTIONBIBLIOMATERIAL_OID"  integer;
alter table "APP"."RULES"   add constraint FK_RULES_COLLECTIONBIBLIOMATER foreign key ("COLLECTIONBIBLIOMATERIAL_OID") references "APP"."COLLECTIONBIBLIOMATERIAL" ("OID");


-- BiblioMaterial.# Copies [ent3#att32]
create view "APP"."BIBLIOMATERIAL_COPIES_VIEW" as
select AL1."OID" as "OID", count(distinct AL2."OID") as "DER_ATTR"
from  "APP"."BIBLIOMATERIAL" AL1 
               left outer join "APP"."COPIES" AL2 on AL1."OID"=AL2."BIBLIOMATERIAL_OID"
group by AL1."OID";


