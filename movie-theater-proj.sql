-- Creating tables and linking w/ keys
CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100)
);

CREATE TABLE tickets(
	ticket_id SERIAL PRIMARY KEY,
	order_date DATE,
	amount NUMERIC(5,2),
	total_cost NUMERIC(5,2),
	customer_id INTEGER NOT NULL,
	movie_id INTEGER NOT NULL,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);
CREATE TABLE movies(
	movie_id SERIAL PRIMARY KEY,
	title VARCHAR(100),
	genre VARCHAR(100),
	rating VARCHAR(100)	
);
CREATE TABLE concessions(
	prod_id SERIAL PRIMARY KEY,
	prod_name varchar(100),
	price NUMERIC(4,2),
	amount INTEGER,
	customer_id INTEGER NOT NULL,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);
-- ALtering tickets table to include foreign key for movie_id
ALTER TABLE tickets
ADD FOREIGN KEY(movie_id) REFERENCES movies(movie_id);

-- INSERTing data into customer table
INSERT INTO customer(
	customer_id,
	first_name,
	last_name
)
VALUES(
	1,
	'Nate',
	'Welter'
);
INSERT INTO customer(
	customer_id,
	first_name,
	last_name
)
VALUES(
	2,
	'Sam',
	'Schnell'
);
-- INSERTing data into movies table
INSERT INTO movies(
	movie_id,
	title,
	genre,
	rating
)
VALUES(
	1,
	'Step Brothers',
	'Comedy',
	'R'
);
INSERT INTO movies(
	movie_id,
	title,
	genre,
	rating
)
VALUES(
	2,
	'The Matrix',
	'Sci-fi',
	'R'
);
INSERT INTO movies(
	movie_id,
	title,
	genre,
	rating
)
VALUES(
	3,
	'Inception',
	'Sci-fi / Thriller',
	'PG-13'
);
--INSERTing data into tickets column
INSERT INTO tickets(
	ticket_id,
	order_date,
	amount,
	total_cost,
	customer_id,
	movie_id
)
VALUES(
	1,
	'08/03/2020',
	10.00,
	12.00,
	1,
	3
);
INSERT INTO tickets(
	ticket_id,
	order_date,
	amount,
	total_cost,
	customer_id,
	movie_id
)
VALUES(
	2,
	'08/03/2020',
	10.00,
	12.00,
	2,
	2
);

-- INSERTing values into the concessions table
INSERT INTO concessions(
	prod_id,
	prod_name,
	price,
	amount,
	customer_id
)
VALUES(
	1,
	'Popcorn',
	8.99,
	1,
	1
);
INSERT INTO concessions(
	prod_id,
	prod_name,
	price,
	amount,
	customer_id
)
VALUES(
	2,
	'Milk Duds',
	4.50,
	1,
	1
);
INSERT INTO concessions(
	prod_id,
	prod_name,
	price,
	amount,
	customer_id
)
VALUES(
	3,
	'Soft Drink',
	3.99,
	2,
	2
);
SELECT *
FROM concessions