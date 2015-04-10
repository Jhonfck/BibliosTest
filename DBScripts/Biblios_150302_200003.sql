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


