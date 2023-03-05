/*==============================================================*/
/* Nom de SGBD :  MySQL 5.0                                     */
/* Date de création :  25/01/2023 14:55:06                      */
/*==============================================================*/


drop table if exists ADMINISTRATOR;

drop table if exists DETENIR;

drop table if exists FICHE_CONNEXION;

drop table if exists FICHE_INSCRIPTION;

drop table if exists ROOM;

drop table if exists STUDENT;

/*==============================================================*/
/* Table : ADMINISTRATOR                                        */
/*==============================================================*/
create table ADMINISTRATOR
(
   ID_ADMINI            int(6) not null auto_increment,
   NOM_ADMIN            varchar(30),
   PRENOM_ADMIN         varchar(15),
   MDP_ADMIN            varchar(15),
   primary key (ID_ADMINI)
);

alter table ADMINISTRATOR comment 'L''administateur a tout les droit sur la base de donnees con';

/*==============================================================*/
/* Table : DETENIR                                              */
/*==============================================================*/
create table DETENIR
(
   ID_STDT              int(6) not null,
   ID_CONNEXION         int(4) not null,
   primary key (ID_STDT, ID_CONNEXION)
);

/*==============================================================*/
/* Table : FICHE_CONNEXION                                      */
/*==============================================================*/
create table FICHE_CONNEXION
(
   ID_CONNEXION         int(4) not null auto_increment,
   ID_ROOM              int(6) not null,
   CODE_CONN            numeric(6,0),
   MDP_CONN             varchar(15),
   primary key (ID_CONNEXION)
);

alter table FICHE_CONNEXION comment 'Ici on entrer les donnees neccesair a la connexion, dans ce ';

/*==============================================================*/
/* Table : FICHE_INSCRIPTION                                    */
/*==============================================================*/
create table FICHE_INSCRIPTION
(
   ID_FCH_INSC          int(3) not null auto_increment,
   LIBELE_FICHE         text,
   primary key (ID_FCH_INSC)
);

alter table FICHE_INSCRIPTION comment 'La fiche d''inscription est un objet absrait de la db. cela ';

/*==============================================================*/
/* Table : ROOM                                                 */
/*==============================================================*/
create table ROOM
(
   ID_ROOM              int(6) not null auto_increment,
   ID_ADMINI            int(6) not null,
   NOM_ROOM             varchar(30),
   primary key (ID_ROOM)
);

alter table ROOM comment 'La chambre est une entite abstaite de notre db, elle aura to';

/*==============================================================*/
/* Table : STUDENT                                              */
/*==============================================================*/
create table STUDENT
(
   ID_STDT              int(6) not null auto_increment,
   ID_FCH_INSC          int(3) not null,
   NOM_STDT             varchar(30),
   PRENOM_STDT          varchar(15),
   NAISSANCE_STDT       date,
   MAIL_STDT            varchar(40),
   MDP_STDT             varchar(15),
   CODE_STDT            numeric(6,0),
   primary key (ID_STDT)
);

alter table STUDENT comment 'L''eudiant est une entite possedant un identifiant unique, u';

alter table DETENIR add constraint FK_DETENIR foreign key (ID_STDT)
      references STUDENT (ID_STDT) on delete restrict on update restrict;

alter table DETENIR add constraint FK_DETENIR2 foreign key (ID_CONNEXION)
      references FICHE_CONNEXION (ID_CONNEXION) on delete restrict on update restrict;

alter table FICHE_CONNEXION add constraint FK_ATTRIBUER foreign key (ID_ROOM)
      references ROOM (ID_ROOM) on delete restrict on update restrict;

alter table ROOM add constraint FK_GERER foreign key (ID_ADMINI)
      references ADMINISTRATOR (ID_ADMINI) on delete restrict on update restrict;

alter table STUDENT add constraint FK_AVOIR foreign key (ID_FCH_INSC)
      references FICHE_INSCRIPTION (ID_FCH_INSC) on delete restrict on update restrict;

