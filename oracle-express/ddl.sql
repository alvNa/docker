create user movies identified by "movies";

grant create session to movies;

grant unlimited tablespace to movies;

commit;

create table movies.actors
(
   id            decimal(10)   not null,
   name          varchar(255)  not null,
   surname       varchar(255)  not null
);
alter table movies.actors add constraint actors_pk  primary key ( id );

create table movies.movies
(
   id              decimal(10)   not null,
   title           varchar(255)  not null,
   score           number(4,2)   not null,
   description     varchar(255)  not null
);

alter table movies.movies add constraint movies_pk  primary key ( id );

create table movies.actors4movies
(
   movies_id       decimal(10)   not null,
   actors_id       decimal(10)   not null
);

alter table movies.actors4movies add constraint actors4movies_fk_01  foreign key ( movies_id ) references movies.movies (id);
alter table movies.actors4movies add constraint actors4movies_fk_02  foreign key ( actors_id ) references movies.actors (id);


insert into movies.actors values (1,'Samuel','L. Jackson');
insert into movies.actors values (2,'Bruce','Willis');
insert into movies.actors values (3,'Tim','Roth');
insert into movies.actors values (4,'Kurt','Russell');
insert into movies.movies values (1,'The hateful eight',8.3,'Western');
insert into movies.movies values (2,'Inglorious bastards',7.5,'Belic');
insert into movies.movies values (3,'Pulp fiction',8.6,'Gangsters');

insert into movies.actors4movies values (1,1);
insert into movies.actors4movies values (1,3);
insert into movies.actors4movies values (1,4);
insert into movies.actors4movies values (3,1);
insert into movies.actors4movies values (3,2);

commit;