--- URI Online Judge SQL
--- Copyright URI Online Judge
--- www.urionlinejudge.com.br
--- Problem 2611

--PROBLEM 
--A video store contractor hired her services to catalog her movies.
-- They need you to select the code and the name of the movies whose description of the genre is 'Action'.

CREATE TABLE genres (
  id numeric PRIMARY KEY,
  description varchar(50)
);

CREATE TABLE movies (
  id numeric PRIMARY KEY,
  name varchar(50),
  id_genres numeric REFERENCES genres (id)
);

INSERT INTO genres (id, description)
VALUES
  (1,	'Animation'),
  (2,	'Horror'),
  (3,	'Action'),
  (4,	'Drama'),
  (5,	'Comedy');
  
INSERT INTO movies (id, name, id_genres)
VALUES
  (1,	'Batman',	3),
  (2,	'The Battle of the Dark River',	3),
  (3,	'White Duck',	1),
  (4,	'Breaking Barriers',	4),
  (5,	'The Two Hours',	2);

/*  Execute this query to drop the tables */
-- DROP TABLE movies, genres; --

--RESOLUÇÃO
SELECT m.id, m.name
FROM movies m
JOIN genres g ON m.id_genres = g.id
WHERE g.description = 'Action';

