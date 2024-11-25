-- 1 ################################################################################################################

CREATE TABLE categories (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(50)
);

CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(50),
    category_id INT REFERENCES categories(category_id) ON DELETE SET NULL
);


INSERT INTO categories (category_name) VALUES
('Electronics'),
('Furniture'),
('Books'),
('Clothing'),
('Sports');

INSERT INTO products (product_name, category_id) VALUES
('Laptop', 1),
('Smartphone', 1),
('TV', 1),
('Sofa', 2),
('Chair', 2),
('Table', 2),
('Novel', 3),
('Textbook', 3),
('Shirt', 4),
('Jacket', 4),
('Bicycle', 5),
('Treadmill', 5),
('Uncategorized Product 1', NULL),
('Uncategorized Product 2', NULL),
('Uncategorized Product 3', NULL);


SELECT c.category_name, p.product_name
FROM categories c
JOIN products p ON c.category_id = p.category_id;

SELECT c.category_name, p.product_name
FROM categories c
LEFT JOIN products p ON c.category_id = p.category_id;

SELECT p.product_name, c.category_name
FROM products p
LEFT JOIN categories c ON p.category_id = c.category_id;

SELECT * FROM products WHERE category_id IS NULL;

SELECT * FROM categories c
WHERE NOT EXISTS (
    SELECT 1 FROM products p WHERE p.category_id = c.category_id
);

SELECT * FROM categories;

SELECT * FROM products;

SELECT * FROM categories c
WHERE NOT EXISTS (
    SELECT 1 FROM products p WHERE p.category_id = c.category_id
)
UNION
SELECT * FROM products WHERE category_id IS NULL;

SELECT c.category_name, p.product_name
FROM categories c
CROSS JOIN products p;

SELECT * FROM categories NATURAL JOIN products;


-- 2 ###############################################################################################################


CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    employee_name VARCHAR(50),
    manager_id INT
);

INSERT INTO employees (employee_name, manager_id) VALUES
('Alice', NULL),
('Bob', 1),
('Charlie', 1),
('David', 2),
('Eve', 2);

SELECT e1.employee_name AS Employee, e2.employee_name AS Manager
FROM employees e1
LEFT JOIN employees e2 ON e1.manager_id = e2.employee_id;


-- 3 #########################################################################################################

CREATE TABLE movies (
    movie_id SERIAL PRIMARY KEY,
    movie_title VARCHAR(100)
);

CREATE TABLE actors (
    actor_id SERIAL PRIMARY KEY,
    actor_name VARCHAR(100)
);

CREATE TABLE movie_actors (
    movie_id INT REFERENCES movies(movie_id),
    actor_id INT REFERENCES actors(actor_id),
    PRIMARY KEY (movie_id, actor_id)
);


INSERT INTO movies (movie_title) VALUES
('Inception'),
('The Matrix'),
('Interstellar');

INSERT INTO actors (actor_name) VALUES
('Leonardo DiCaprio'),
('Keanu Reeves'),
('Matthew McConaughey'),
('Anne Hathaway');

INSERT INTO movie_actors (movie_id, actor_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(3, 4);


SELECT m.movie_title, a.actor_name
FROM movies m
JOIN movie_actors ma ON m.movie_id = ma.movie_id
JOIN actors a ON ma.actor_id = a.actor_id;

SELECT a.actor_name, m.movie_title
FROM actors a
JOIN movie_actors ma ON a.actor_id = ma.actor_id
JOIN movies m ON ma.movie_id = m.movie_id;















































































