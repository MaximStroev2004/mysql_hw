-- 1. 
SELECT authors.name FROM authors
JOIN authors_books ON authors_books.authors_id = authors.id
GROUP BY authors.name
ORDER BY COUNT(authors_books.authors_id) DESC
LIMIT 1;

-- 2. 
SELECT * FROM books
WHERE books.year IS NOT NULL
ORDER BY books.year ASC
LIMIT 5;

-- 3. 
SELECT COUNT(books.id) as count FROM books
JOIN shelves ON books.shelves_id = shelves.id
WHERE shelves.title = 'Полка в кабинете'
GROUP BY books.shelves_id;

-- 4. 
SELECT books.title, authors.name, books.year FROM books
JOIN shelves ON shelves.id = books.shelves_id
JOIN authors_books ON authors_books.books_id = books.id
JOIN authors ON authors_books.authors_id = authors.id
WHERE shelves.title = 'Полка в спальне';

-- 5. 
SELECT books.title, books.year FROM books
JOIN shelves ON shelves.id = books.shelves_id
JOIN authors_books ON authors_books.books_id = books.id
JOIN authors ON authors_books.authors_id = authors.id
WHERE authors.name = 'Лев Толстой';

-- 6.
SELECT books.title FROM books
JOIN shelves ON shelves.id = books.shelves_id
JOIN authors_books ON authors_books.books_id = books.id
JOIN authors ON authors_books.authors_id = authors.id
WHERE authors.name LIKE 'А%';

-- 7. 
SELECT books.title, authors.name FROM books
JOIN shelves ON shelves.id = books.shelves_id
JOIN authors_books ON authors_books.books_id = books.id
JOIN authors ON authors_books.authors_id = authors.id
WHERE shelves.title LIKE '%нижняя%' OR shelves.title LIKE '%верхняя%';

-- 8. 
UPDATE books
JOIN authors_books ON authors_books.books_id = books.id
JOIN authors ON authors_books.authors_id = authors.id
SET books.friends_id = (SELECT friends.id FROM friends WHERE friends.name = 'Иванов Иван')
WHERE authors.name = 'Данте Алигьери' AND books.title = 'Божественная комедия'
AND books.id > 0;
-- 9.
INSERT INTO authors 
(name)
VALUES 
(
"Стивен Хокинг"
);
INSERT INTO books 
(title, year, shelves_id)
VALUES (
"Краткие ответы на большие вопросы", 
 2020, 
(SELECT shelves.id FROM shelves WHERE shelves.title = "Полка в кабинете" LIMIT 1)
);
INSERT INTO authors_books
(books_id, authors_id)
VALUES 
(
(SELECT books.id FROM books WHERE books.title = "Краткие ответы на большие вопросы" AND books.year = 2020 LIMIT 1),
(SELECT authors.id FROM authors WHERE authors.name = "Стивен Хокинг" LIMIT 1)
);
