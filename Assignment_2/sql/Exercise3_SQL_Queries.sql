
--l) Output: maker, average_hd: D,266.6; E,133.3.
SELECT P.maker, AVG(PC.hd) AS average_hd
FROM Product AS P
INNER JOIN PC ON P.model = PC.model
WHERE P.maker IN (SELECT maker
    			  FROM Product
    			  WHERE type = 'printer')
GROUP BY P.maker;

-- k) Output: maker,max_price: B,1049; C,510; D,770; E,959; A,2114.
SELECT P.maker, MAX(PC.price) AS max_price
FROM PC
INNER JOIN Product AS P ON PC.model = P.model
GROUP BY P.maker; 

-- j) Output: A, B, D, E.
SELECT P.maker
FROM Product AS P
INNER JOIN PC ON P.model = PC.model
GROUP BY P.maker
HAVING COUNT(DISTINCT PC.model) >= 3;


-- i) Output: maker, average_scren: B,13.3; E,17.5; F,14.75; G,15.4; A,15.23.

SELECT P.maker, AVG(screen) AS Average_Screen
FROM Laptop AS L
INNER JOIN Product AS P ON L.model = P.model
GROUP BY P.maker; 


-- h) Output: model, price: 1005,630; 1006,1049; 2005,2500.
(SELECT model, price 
FROM Laptop
WHERE Laptop.speed = (SELECT MAX(speed) FROM LAPTOP)
GROUP BY model, price)
UNION
(SELECT model, price
FROM PC
WHERE PC.speed = (SELECT MAX(speed) FROM PC)
GROUP BY model, price);

-- g) Output: E.

SELECT P.maker
FROM Product as P
INNER JOIN Printer as PR ON P.model = PR.model
WHERE PR.color IS TRUE AND PR.price = (SELECT MIN(price) FROM Printer);


-- f) The output is 0.
SELECT P.model, L.speed
FROM Product AS P
INNER JOIN Laptop AS L ON P.model = L.model
WHERE L.speed < (SELECT MIN(speed) 
    			FROM PC);

-- e) Output: F, G.
SELECT DISTINCT maker
FROM Product AS p1
WHERE type = 'laptop'
AND NOT EXISTS (
    SELECT 1
    FROM Product AS p2
    WHERE p2.maker = p1.maker
    AND type = 'pc'
);

-- d) Output: model, price: 1004,649; 1005,630; 1006,1049; 2007,1249.
SELECT model, price
FROM PC
WHERE EXISTS (SELECT 1
    		  FROM Product
    		  WHERE Product.model = PC.model
   			  AND maker = 'B')   
UNION ALL
SELECT model, price
FROM Laptop
WHERE EXISTS (SELECT 1
    		  FROM Product
              WHERE Product.model = Laptop.model
              AND maker = 'B');


-- c) Output: maker, speed: A,2; A,2.16; A.2; B,1.83; E,2; E,1.73; E,1.8; F,1.6; F,1.6; G,2.
SELECT P.maker, L.speed
FROM Product as P
INNER JOIN Laptop as L ON P.model = L.model
WHERE hd >= 30;


-- b) Output: D, E, H. 
SELECT DISTINCT maker FROM Product
WHERE type = 'printer'

-- a) Output: model,GHz,GB: 1002,2.1,250; 1003,1.42,80; 1004,2.8,250; 
-- 1005,3.2,250; 1007,2.2,200; 1008,2.2,250; 1009,2,250; 1010,2.8,300;
-- 1011,1.86,160; 1012,2.8,160; 1013,3.06,80.
SELECT model, speed AS "GHz", hd AS "GB"
FROM PC
WHERE price < 1000;
