drop table if exists games cascade;
drop table if exists athletes cascade;
drop table if exists countries cascade;
drop table if exists sports cascade;
drop table if exists events cascade;
drop table if exists participations;


create table games(
  id serial4 primary key,
  name varchar(255) not null,
  year int4 not null
);

create table sports(
  id serial4 primary key,
  name varchar(255) not null check(name != '')
  -- participants_limit int4 not null
);

create table countries(
  id serial4 primary key,
  name varchar(255) not null check(name != ''),
  gold int4,
  silver int4,
  bronze int4,
  points int4

);

create table athletes(
  id serial4 primary key,
  name varchar(255) not null check(name != '') ,
  sport_id int4 not null references sports(id) on update cascade,
  country_id int4 not null references countries(id) on update cascade 
);

create table events(
  id serial4 primary key,
  sport_id int4 not null references sports(id) on update cascade,
  event_date date not null,
  event_time time not null
  
);

create table participations(
  id serial4 primary key,
  athlete_id int4 not null references athletes(id) on update cascade,
  event_id int4 not null references events(id) on update cascade,
  game_id int4 not null references games(id) on update cascade,
  athlete_position int4 not null check(athlete_position > 0)
);






