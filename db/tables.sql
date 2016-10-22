drop table if exists game cascade;
drop table if exists athlete cascade;
drop table if exists country cascade;
drop table if exists sport cascade;
drop table if exists event cascade;
drop table if exists participation;


create table game(
  id serial4 primary key,
  name varchar(255) not null,
  year int4 not null
);

create table sport(
  id serial4 primary key,
  name varchar(255) not null check(name != '')
  -- participants_limit int4 not null
);

create table country(
  id serial4 primary key,
  name varchar(255) not null check(name != '')
);

create table athlete(
  id serial4 primary key,
  name varchar(255) not null check(name != '') ,
  sport int4 not null references sport(id) on update cascade,
  country int4 not null references country(id) on update cascade 
);

create table event(
  id serial4 primary key,
  sport_id int4 not null references sport(id) on update cascade,
  event_date date not null,
  event_time time not null
  
);

create table participation(
  id serial4 primary key,
  athlete_id int4 not null references athlete(id) on update cascade,
  event_id int4 not null references event(id) on update cascade,
  athlete_position int4 not null check(athlete_position > 0)
);






