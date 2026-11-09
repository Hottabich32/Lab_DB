/*==============================================================*/
/* DBMS name:      PostgreSQL 9.x                               */
/* Created on:     09.11.2026 14:15:07                          */
/*==============================================================*/


drop index cityAddress_FK;

drop index address_PK;

drop index aircraft_type_PK;

drop index typeAirplane_FK;

drop index airplane_PK;

drop index cityAirport_FK;

drop index airport_PK;

drop index countryCity_FK;

drop index city_PK;

drop index airTypeClassSeats_FK;

drop index class_seats_PK;

drop index country_PK;

drop index crewFlightZone_FK;

drop index crew_PK;

drop index flightArrAirport_FK;

drop index flightDepAirport_FK;

drop index airplaneFlight_FK;

drop index crewFlight_FK;

drop index flight_PK;

drop index flight_zone_PK;

drop index job_position_PK;

drop index passenger_PK;

drop index person_PK;

drop index ticketClassSeats_FK;

drop index flightTicket_FK;

drop index passengerTicket_FK;

drop index ticket_PK;

drop index workerCrew_FK;

drop index addressPerson_FK;

drop index workerPosition_FK;

drop index worker_PK;

/*==============================================================*/
/* Table: address                                               */
/*==============================================================*/
create table address (
   ID_address           SERIAL               not null,
   city                 INT4                 not null,
   street               VARCHAR(128)         not null,
   house                VARCHAR(16)          not null,
   apartment            VARCHAR(8)           null
);

alter table address
   add constraint PK_ADDRESS primary key (ID_address);

/*==============================================================*/
/* Table: aircraft_type                                         */
/*==============================================================*/
create table aircraft_type (
   ID_type              SERIAL               not null,
   brand                VARCHAR(64)          not null,
   flightRange          INT4                 not null,
   maxAltitude          INT4                 not null,
   cruiseSpeed          INT4                 not null,
   maxTakeoffWeight     INT4                 not null
);

alter table aircraft_type
   add constraint PK_AIRCRAFT_TYPE primary key (ID_type);

/*==============================================================*/
/* Table: airplane                                              */
/*==============================================================*/
create table airplane (
   ID_airplane          SERIAL               not null,
   aircraft_type        INT4                 not null,
   boardNumber          VARCHAR(16)          not null,
   manufactureYear      INT2                 not null,
   operationStart       DATE                 not null,
   operationEnd         DATE                 null
);

alter table airplane
   add constraint PK_AIRPLANE primary key (ID_airplane);

alter table airplane
   add constraint AK_NUMBOARD_AIRPLANE unique (boardNumber);

/*==============================================================*/
/* Table: airport                                               */
/*==============================================================*/
create table airport (
   ID_airport           SERIAL               not null,
   city                 INT4                 not null,
   name                 VARCHAR(128)         not null,
   code                 VARCHAR(4)           not null
);

alter table airport
   add constraint PK_AIRPORT primary key (ID_airport);

/*==============================================================*/
/* Table: city                                                  */
/*==============================================================*/
create table city (
   ID_city              SERIAL               not null,
   country              INT4                 not null,
   name                 VARCHAR(64)          not null
);

alter table city
   add constraint PK_CITY primary key (ID_city);

/*==============================================================*/
/* Table: class_seats                                           */
/*==============================================================*/
create table class_seats (
   ID_class             SERIAL               not null,
   aircraft_type        INT4                 not null,
   className            VARCHAR(32)          not null,
   seatsCount           INT2                 not null
);

alter table class_seats
   add constraint PK_CLASS_SEATS primary key (ID_class);

/*==============================================================*/
/* Table: country                                               */
/*==============================================================*/
create table country (
   ID_country           SERIAL               not null,
   name                 VARCHAR(64)          not null
);

alter table country
   add constraint PK_COUNTRY primary key (ID_country);

/*==============================================================*/
/* Table: crew                                                  */
/*==============================================================*/
create table crew (
   ID_crew              SERIAL               not null,
   flight_zone          INT4                 not null,
   code                 VARCHAR(32)          not null
);

alter table crew
   add constraint PK_CREW primary key (ID_crew);

/*==============================================================*/
/* Table: flight                                                */
/*==============================================================*/
create table flight (
   ID_flight            SERIAL               not null,
   crew                 INT4                 not null,
   airplane             INT4                 not null,
   departureAirport     INT4                 not null,
   arrivalAirport       INT4                 not null,
   flightNumber         VARCHAR(16)          not null,
   departureTime        DATE                 not null,
   arrivalTime          DATE                 not null
);

alter table flight
   add constraint PK_FLIGHT primary key (ID_flight);

/*==============================================================*/
/* Table: flight_zone                                           */
/*==============================================================*/
create table flight_zone (
   ID_zone              SERIAL               not null,
   name                 VARCHAR(32)          not null
);

alter table flight_zone
   add constraint PK_FLIGHT_ZONE primary key (ID_zone);

/*==============================================================*/
/* Table: job_position                                          */
/*==============================================================*/
create table job_position (
   ID_position          SERIAL               not null,
   name                 VARCHAR(64)          not null
);

alter table job_position
   add constraint PK_JOB_POSITION primary key (ID_position);

alter table job_position
   add constraint AK_NAMEJOBPOS_JOB_POSI unique (name);

/*==============================================================*/
/* Table: passenger                                             */
/*==============================================================*/
create table passenger (
   ID_person            INT4                 not null
);

alter table passenger
   add constraint PK_PASSENGER primary key (ID_person);

/*==============================================================*/
/* Table: person                                                */
/*==============================================================*/
create table person (
   ID_person            SERIAL               not null,
   surname              VARCHAR(128)         not null,
   name                 VARCHAR(128)         not null,
   patronymic           VARCHAR(64)          null,
   birthDate            DATE                 not null,
   passportSeries       VARCHAR(4)           not null,
   passportNumber       VARCHAR(6)           not null,
   phone                VARCHAR(20)          null
);

alter table person
   add constraint PK_PERSON primary key (ID_person);

alter table person
   add constraint AK_PASSPORT_PERSON unique (passportSeries, passportNumber);

/*==============================================================*/
/* Table: ticket                                                */
/*==============================================================*/
create table ticket (
   ID_tick              INT4                 not null,
   flight               INT4                 not null,
   class_seats          INT4                 not null,
   passenger            SERIAL               not null,
   price                MONEY                not null,
   rowNumber            INT2                 not null,
   seat                 VARCHAR(4)           not null,
   baggageType          VARCHAR(32)          null,
   baggageWeight        DECIMAL(5,2)         null,
   baggagePlaces        INT2                 not null
);

alter table ticket
   add constraint PK_TICKET primary key (ID_tick);

alter table ticket
   add constraint AK_UNIQUESEAT_TICKET unique (flight, rowNumber, seat);

/*==============================================================*/
/* Table: worker                                                */
/*==============================================================*/
create table worker (
   ID_person            INT4                 not null,
   job_position         INT4                 not null,
   crew                 INT4                 not null,
   address              INT4                 not null,
   experience           INT2                 not null
);

alter table worker
   add constraint PK_WORKER primary key (ID_person);

alter table address
   add constraint FK_ADDRESS_CITYADDRE_CITY foreign key (city)
      references city (ID_city)
      on delete restrict on update cascade;

alter table airplane
   add constraint FK_AIRPLANE_TYPEAIRPL_AIRCRAFT foreign key (aircraft_type)
      references aircraft_type (ID_type)
      on delete restrict on update cascade;

alter table airport
   add constraint FK_AIRPORT_CITYAIRPO_CITY foreign key (city)
      references city (ID_city)
      on delete restrict on update cascade;

alter table city
   add constraint FK_CITY_COUNTRYCI_COUNTRY foreign key (country)
      references country (ID_country)
      on delete restrict on update cascade;

alter table class_seats
   add constraint FK_CLASS_SE_AIRTYPECL_AIRCRAFT foreign key (aircraft_type)
      references aircraft_type (ID_type)
      on delete restrict on update cascade;

alter table crew
   add constraint FK_CREW_CREWFLIGH_FLIGHT_Z foreign key (flight_zone)
      references flight_zone (ID_zone)
      on delete restrict on update cascade;

alter table flight
   add constraint FK_FLIGHT_AIRPLANEF_AIRPLANE foreign key (airplane)
      references airplane (ID_airplane)
      on delete restrict on update cascade;

alter table flight
   add constraint FK_FLIGHT_CREWFLIGH_CREW foreign key (crew)
      references crew (ID_crew)
      on delete restrict on update cascade;

alter table flight
   add constraint FK_FLIGHT_FLIGHTARR_AIRPORT foreign key (arrivalAirport)
      references airport (ID_airport)
      on delete restrict on update cascade;

alter table flight
   add constraint FK_FLIGHT_FLIGHTDEP_AIRPORT foreign key (departureAirport)
      references airport (ID_airport)
      on delete restrict on update cascade;

alter table passenger
   add constraint FK_PASSENGE_PERSON2_PERSON foreign key (ID_person)
      references person (ID_person)
      on delete restrict on update cascade;

alter table ticket
   add constraint FK_TICKET_FLIGHTTIC_FLIGHT foreign key (flight)
      references flight (ID_flight)
      on delete restrict on update cascade;

alter table ticket
   add constraint FK_TICKET_PASSENGER_PASSENGE foreign key (passenger)
      references passenger (ID_person)
      on delete restrict on update cascade;

alter table ticket
   add constraint FK_TICKET_TICKETCLA_CLASS_SE foreign key (class_seats)
      references class_seats (ID_class)
      on delete restrict on update cascade;

alter table worker
   add constraint FK_WORKER_ADDRESSPE_ADDRESS foreign key (address)
      references address (ID_address)
      on delete restrict on update cascade;

alter table worker
   add constraint FK_WORKER_PERSON_PERSON foreign key (ID_person)
      references person (ID_person)
      on delete restrict on update cascade;

alter table worker
   add constraint FK_WORKER_WORKERCRE_CREW foreign key (crew)
      references crew (ID_crew)
      on delete restrict on update cascade;

alter table worker
   add constraint FK_WORKER_WORKERPOS_JOB_POSI foreign key (job_position)
      references job_position (ID_position)
      on delete restrict on update cascade;

