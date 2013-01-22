create table stations (
   id            char(17),
   description   varchar(128),
   mindate       date,
   maxdate       date,
   latitute      float,
   longitude     float,
   coverage      float,

   primary key (`id`)
);

create table elements (
   id            char(4),
   description   varchar(256),

   primary key (`id`)
);

create table station_elements (
   station_id,
   element_id,

   primary key (`station_id`, `element_id`)
);

--
-- indexes to create after data loaded:
--
--     create index i01 on stations(`mindate`);
--     create index i02 on stations(`maxdate`);
--     create index i03 on stations(`mindate`, `maxdate`);
--     create index i04 on stations(`coverage`);
--     create index i05 on stations(`coverage`,`mindate`);
--     create index i06 on stations(`coverage`,`maxdate`);
--     create index i07 on stations(`coverage`,`mindate`,`maxdate`);
--     create index i08 on station_elements(`station`_id);
--     create index i09 on station_elements(`element`_id);
