create table sensors (
  id char(16) not null primary key,
  name varchar(50),
  number_ref tinyint(2),
  latest_temperature float(5,2),
  latest_reading_at datetime
  ) engine=InnoDB;
  
create table readings (
  id int unsigned not null primary key auto_increment,
  sensor_id char(16) not null,
  temperature float(5,2) not null,
  created_at timestamp default current_timestamp,
  index (created_at),
  foreign key (sensor_id) references sensors(id) on update cascade on delete cascade
  ) engine=InnoDB;

-- this doesn't work
create view latest_reading as SELECT 

SELECT number_ref, sensor_id, s.name, temperature, created_at 
FROM readings AS r LEFT JOIN sensors AS s ON r.sensor_id = s.id
WHERE id IN (SELECT id FROM readings WHERE serial IN
GROUP BY sensor_id
ORDER BY created_at DESC
