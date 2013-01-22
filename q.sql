select
  id,description,longitude,latitude
  from stations s
 where s.mindate<='1900-01-01'
   and s.maxdate>='2013-01-01'
   and s.coverage > 0.95
   and s.id in (select station_id from station_elements where element_id='TMAX')
   and s.id in (select station_id from station_elements where element_id='TMIN')
   and s.id in (select station_id from station_elements where element_id='PRCP')
;
