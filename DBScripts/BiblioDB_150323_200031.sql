-- Rules_Group [rel4]
alter table "APP"."RULES"  add column  "OID"  integer;
alter table "APP"."RULES"   add constraint FK_RULES_GROUP_2 foreign key ("OID") references "APP"."GROUP" ("OID");


-- REL FK: RulesToCollectionBiblioMaterial [rel7#role13]
alter table "APP"."RULES"   add constraint FK_COLLECTIONBIBLIOMATERIAL_RU foreign key ("OID") references "APP"."RULES" ("OIDRULES");


