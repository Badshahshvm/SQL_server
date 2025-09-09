Create database CteQuerry;
use CteQuerry;

CREATE TABLE Product (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    price INT
);

INSERT INTO Product (id, name, price) VALUES
(1, 'Pen', 10),
(2, 'Notebook', 50),
(3, 'Pencil', 5),
(4, 'Eraser', 3),
(5, 'Marker', 25);

WITH ProductDiscount AS (
    SELECT 
        id, 
        name, 
        price, 
        price * 0.9 AS discounted_price
    FROM Product
)
SELECT * FROM ProductDiscount;


WITH ExpensiveProducts AS (
    SELECT id, name, price
    FROM Product
    WHERE price > 20
)
SELECT * FROM ExpensiveProducts;


