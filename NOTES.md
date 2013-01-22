1. Run `list-ghcnd-us-stations`, which makes requests of the form

       datasets/GHCND/locations/FIPS:US/stations.xml?page=N

   to write files with names like ghcnd-us-stationsNNN.xml, for NNN=001...461.
   These files contain basic station information for all US GHCND stations.
   Store these files in subdirectory `ghcnd-us-stations`.

2. Grep for all lines containing `<id>` in all the files in the `ghcnd-us-stations`
   subdir (the files downloaded by the previous step).  Use the results to
   create a list of all the station ids, store it in `ghcnd-us-stations-list.txt`.

3. Run `get-ghcnd-us-station-datatypes`, which reads the station id list in
   `ghcnd-us-stations-list.txt` and makes requests of the form

        datasets/GHCND/stations/$id/datatypes.xml

   to query the datatypes available for each station, storing the results
   in a huge XML file: `ghcnd-us-stations-datatypes.xml`.

   This take about 12 hours to run, because ghcnd-us-stations-list.txt contains
   about 46000 stations, and we can only make one query per second.

4. Run 

        station-collection-xml-to-csv > ghcnd-us-stations.csv

   which reads all the station basic data XML files in the
   `ghcnd-us-stations` subdirectory, and creates a single CSV file
   `ghcnd-us-stations.csv` summarizing it all.

5. Run

        station-datatypes-xml-to-csv > ghcnd-us-stations-datatypes.csv

   which reads the massive `ghcnd-us-stations-datatypes.xml` file and
   creates a single, much smaller, CSV file
   `ghcnd-us-stations-datatypes.csv` summarizing it all.

6. Run 

        merge-station-info > ghcnd-us-stations-final.csv

   which reads both the files `ghcnd-us-stations.csv` and
   `ghcnd-us-stations-datatypes.csv`, and creates a single file
   `ghcnd-us-stations-final.csv` containing the information from both
   of them.


7. Run

        makesql > load.sql

   to generate `load.sql` file containing script to (re)load inventory
   database.  Note that `load.sql` contains copies of `schema.sql`,
   which (re)creates tables, and `indices.sql`, which creates indices
   after tables have been loaded.  You should NOT load `schema.sql`
   and/or `indices.sql` separately, but if you want to change
   `schema.sql` or `indices.sql`, edit them directly and re-run
   `makesql > load.sql` (it copies `schema.sql` and `indices.sql` to
   its output).

8. Run

        mysql --user=cdometa --password=******* cdometa < load.sql 

   to (re)load the database.  See Settings.pm for the password.

9. See `q.sql`, and run

        mysql --user=cdometa --password=******* cdometa < q.sql

   for sample query to generate list of stations meeting certain
   criteria.
