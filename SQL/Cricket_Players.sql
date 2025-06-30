use Cricket;

show tables;

show create table players;

CREATE TABLE players(
  player_id int,
  player_name varchar(30) NOT NULL,
  captain_id int
);

select * from players;

select p.player_id as Player_ID, p.player_name as Player_Name, PN.player_name as Captain_Name, p.captain_id as Captain_ID from players p
left join players PN on p.player_id = PN.player_id; 