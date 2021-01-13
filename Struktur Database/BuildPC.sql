/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     13/01/2021 01.50.19 PM                       */
/*==============================================================*/


drop table if exists Builds;

drop table if exists Components;

drop table if exists Detail_Build;

drop table if exists Items;

drop table if exists Users;

/*==============================================================*/
/* Table: Builds                                                */
/*==============================================================*/
create table Builds
(
   id_build             int not null,
   id_user              int not null,
   name_build           varchar(50) not null,
   price                int not null,
   primary key (id_build)
);

/*==============================================================*/
/* Table: Components                                            */
/*==============================================================*/
create table Components
(
   id_component         int not null,
   id_item              int not null,
   name_component       varchar(50) not null,
   primary key (id_component)
);

/*==============================================================*/
/* Table: Detail_Build                                          */
/*==============================================================*/
create table Detail_Build
(
   id_item              int not null,
   id_build             int not null,
   primary key (id_item, id_build)
);

/*==============================================================*/
/* Table: Items                                                 */
/*==============================================================*/
create table Items
(
   id_item              int not null,
   name_item            varchar(255) not null,
   price                int not null,
   watt                 int,
   primary key (id_item)
);

/*==============================================================*/
/* Table: Users                                                 */
/*==============================================================*/
create table Users
(
   id_user              int not null,
   full_name            varchar(50) not null,
   username             varchar(10) not null,
   password             varchar(10) not null,
   primary key (id_user)
);

alter table Builds add constraint FK_Relationship_1 foreign key (id_user)
      references Users (id_user) on delete restrict on update restrict;

alter table Components add constraint FK_Relationship_2 foreign key (id_item)
      references Items (id_item) on delete restrict on update restrict;

alter table Detail_Build add constraint FK_Detail_Build foreign key (id_item)
      references Items (id_item) on delete restrict on update restrict;

alter table Detail_Build add constraint FK_Detail_Build2 foreign key (id_build)
      references Builds (id_build) on delete restrict on update restrict;

