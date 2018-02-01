set PATH=%PATH%;C:\Program Files\MySQL\MySQL Server 5.7\bin

SET GLOBAL sql_mode='ANSI';

CREATE USER 'test123'@'localhost' IDENTIFIED BY 'test123';

GRANT ALL PRIVILEGES ON *.* TO 'test123'@'localhost' WITH GRANT OPTION;

mysql -u test123 -p

CREATE TABLE fred_observations
   (
   		batch_id 					INT,
      series_id 				VARCHAR(10),
      event_date 				varchar(10),
      realtime_start_dt varchar(10),
      realtime_end_dt 	varchar(10),
      value 						float,
      batch_inserted_dt TIMESTAMP DEFAULT CURRENT_TIMESTAMP      
   )
   ;

--What was the average rate of unemployment for each year starting with 1980 and going up to 2015? 

select extract(year from cast(event_date as date)),avg(value) from fred_observations
where 
series_id = 'UNRATE'
and extract(YEAR from cast(event_date as date)) between 1980 and 2015
group by extract(YEAR from cast(event_date as date))
order by extract(YEAR from cast(event_date as date))
;