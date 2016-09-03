/* ENVconfig */
CREATE DATABASE IF NOT EXISTS movies;

SET foreign_key_checks = 0;
DROP TABLE IF EXISTS movies.person_table;
DROP TABLE IF EXISTS movies.movie_table;
DROP TABLE IF EXISTS movies.reviews;
SET foreign_key_checks = 1;

/* 3 table system */
CREATE TABLE movies.person_table
(
  person_id int PRIMARY KEY NOT NULL UNIQUE,
  person_first varchar(200) NOT NULL,
  person_last varchar(200) NOT NULL
);

CREATE TABLE movies.movie_table
(
  movie_id int PRIMARY KEY NOT NULL,
  movie_name varchar(200) NOT NULL
);

CREATE TABLE movies.reviews
(
	review_rank int NOT NULL,
    person_id INT,
    movie_id INT,
	FOREIGN KEY (person_id) REFERENCES movies.person_table (person_id) 
		ON UPDATE CASCADE,
    FOREIGN KEY (movie_id) REFERENCES movies.movie_table (movie_id) 
		ON UPDATE CASCADE
 );
 
 /* load data */
 INSERT INTO movies.person_table (person_id, person_first, person_last)
 VALUES (1, 'Bailey', 'Wells'),
		(2, 'Thomas', 'Wells'),
		(3, 'Junior', 'Barnes'),
        (4, 'Kali', 'Lenner'),
        (5, 'Sam', 'Rockwell');

INSERT INTO movies.movie_table (movie_id, movie_name)
VALUES (1, "Don't Breathe"),
	   (2, "Suicide Squad"),
       (3, "Kubo and the Two Strings"),
       (4, "Pete's Dragon"),
       (5, "Sausage Party"),
       (6, "Star Trek Beyond");

INSERT INTO movies.reviews (review_rank, person_id, movie_id)
VALUES (4, 1, 1),
	   (3, 2, 1),
       (5, 3, 1), 
       (4, 4, 1),
       (5, 5, 1),
       (2, 1, 2),
	   (3, 2, 2),
       (2, 3, 2), 
       (3, 4, 2),
       (3, 5, 2),
       (5, 1, 3),
	   (4, 2, 3),
       (5, 3, 3), 
       (4, 4, 3),
       (4, 5, 3),
       (4, 1, 4),
	   (3, 2, 4),
       (3, 3, 4), 
       (4, 4, 4),
       (5, 5, 4),
       (3, 1, 5),
	   (3, 2, 5),
       (4, 3, 5), 
       (4, 4, 5),
       (3, 5, 5),
       (4, 1, 6),
	   (4, 2, 6),
       (5, 3, 6), 
       (4, 4, 6),
       (3, 5, 6);
       
SELECT p.person_first, p.person_last, m.movie_name, r.review_rank FROM movies.person_table p
	LEFT JOIN movies.reviews r
		ON p.person_id = r.person_id
	LEFT JOIN movies.movie_table m
		ON m.movie_id = r.movie_id
	ORDER BY m.movie_name;


        