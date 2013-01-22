create index i01 on stations(`mindate`);
create index i02 on stations(`maxdate`);
create index i03 on stations(`mindate`, `maxdate`);
create index i04 on stations(`coverage`);
create index i05 on stations(`coverage`,`mindate`);
create index i06 on stations(`coverage`,`maxdate`);
create index i07 on stations(`coverage`,`mindate`,`maxdate`);
create index i08 on station_elements(`station_id`);
create index i09 on station_elements(`element_id`);
