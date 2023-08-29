/*
UPDATE Laptop
SET screen = screen + 1,
    price = price - 100
FROM Product
WHERE Laptop.model = Product.model AND Product.maker = 'B';

--e
UPDATE PC
SET ram = ram * 2,
    hd = hd + 60;

--d
UPDATE Product
SET maker = 'A'
WHERE maker = 'B';

--a
INSERT INTO Product (Maker, Model, Type)
VALUES ('C', '1100', 'pc');

INSERT INTO PC (Model, Speed, Ram, Hd, Price)
VALUES ('1100', 3.2, 1024, 180, 2499);

--b
DELETE FROM Laptop 
WHERE model IN (
    SELECT P.model
    FROM Product AS P
    WHERE P.maker NOT IN (
        SELECT maker
        FROM Product
        WHERE type = 'printer'
    )
    AND P.type = 'laptop'
);

DELETE FROM Product 
WHERE type = 'laptop' AND maker NOT IN (
    SELECT maker
    FROM Product
    WHERE type = 'printer'
);

*/