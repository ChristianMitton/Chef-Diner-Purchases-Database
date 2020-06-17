/* Dataset about diners
*/

CREATE DATABASE IF NOT EXISTS HW_diners;
USE HW_diners;

DROP TABLE IF EXISTS Chef;
DROP TABLE IF EXISTS Ingredient;
DROP TABLE IF EXISTS purchaseOrder;

/* Creating the three tables */
CREATE TABLE Chef(idC INT PRIMARY KEY, nameC VARCHAR(255), nameDiner VARCHAR(255), cityDiner VARCHAR(255), nbStars  INT, CONSTRAINT ch_nbStars CHECK (nbStars >= 0 AND nbStars <=3));
CREATE TABLE Ingredient(idI INT PRIMARY KEY, nameI VARCHAR(255), typeI VARCHAR(100), unitI VARCHAR(80));
CREATE TABLE purchaseOrder(idC INT REFERENCES Chef(idC), idI INT REFERENCES Ingredient(idI), dateP DATE, quantityP INT, PRIMARY KEY(idC, idI, dateP), CONSTRAINT ch_quantity CHECK (quantityP > 0));

/* Inserting tuples */
INSERT INTO Chef VALUES (1, 'Gordon Ramsay', 'Hansel and Griddle', 'New Brunswick', 2);
INSERT INTO Chef VALUES (2, 'Will Smith', 'The Fresh Prince', 'Princeton', 0);
INSERT INTO Chef VALUES (3, 'Marty McFly', 'Cafe 80s', 'New York', 1);
INSERT INTO Chef VALUES (4, 'Heisenberg', 'Los Pollos Hermanos', 'New Brunswick', 3);
INSERT INTO Chef VALUES (5, 'Andy', 'Pizza Planet', 'Philadeplphia', 2);
INSERT INTO Chef VALUES (6, 'Homer Simpson', 'Krusty Burgers', 'Springfield', 3);
INSERT INTO Chef VALUES (7, 'Han Solo', 'La Cantina', 'Syracuse', 2);
INSERT INTO Chef VALUES (8, 'Ron Swanson', 'Paunch Burger', 'New Brunswick', 0);
INSERT INTO Chef VALUES (9, 'Dumbledore', 'The Three Broomsticks', 'New York', 3);

INSERT INTO Ingredient VALUES (1, 'regular flour', 'flour', 'pound');
INSERT INTO Ingredient VALUES (2, 'sugar', 'condiment', 'pound');
INSERT INTO Ingredient VALUES (3, 'butter', 'dairy product', 'pound');
INSERT INTO Ingredient VALUES (4, 'egg', 'Meat, fish, eggs', 'piece');
INSERT INTO Ingredient VALUES (5, 'salmon', 'Meat, fish, eggs', 'pound');
INSERT INTO Ingredient VALUES (6, 'milk', 'dairy product', 'gallon');
INSERT INTO Ingredient VALUES (7, 'tomato', 'fruit, vegetable', 'pound');
INSERT INTO Ingredient VALUES (8, 'olive oil', 'huile', 'gallon');
INSERT INTO Ingredient VALUES (9, 'apple', 'fruit, vegetable', 'pound');
INSERT INTO Ingredient VALUES (10, 'carrot', 'fruit, vegetable', 'bunch');
INSERT INTO Ingredient VALUES (11, 'avocado', 'fruit, vegetable', 'piece');
INSERT INTO Ingredient VALUES (12, 'green pepper', 'condiment', 'pound');

INSERT INTO purchaseOrder VALUES (1, 8, '2019-09-01', 3);
INSERT INTO purchaseOrder VALUES (2, 1, '2019-09-03', 4);
INSERT INTO purchaseOrder VALUES (2, 2, '2019-09-03', 4);
INSERT INTO purchaseOrder VALUES (2, 3, '2019-09-03', 4);
INSERT INTO purchaseOrder VALUES (2, 4, '2019-09-03', 4);
INSERT INTO purchaseOrder VALUES (3, 3, '2019-08-26', 100);
INSERT INTO purchaseOrder VALUES (3, 8, '2019-08-26', 100);
INSERT INTO purchaseOrder VALUES (4, 12, '2019-08-26', 2);
INSERT INTO purchaseOrder VALUES (4, 8, '2019-09-01', 5);
INSERT INTO purchaseOrder VALUES (4, 12, '2019-09-01', 1);
INSERT INTO purchaseOrder VALUES (5, 11, '2019-09-02', 30);
INSERT INTO purchaseOrder VALUES (5, 12, '2019-09-02', 1);
INSERT INTO purchaseOrder VALUES (6, 1, '2019-09-01', 5);
INSERT INTO purchaseOrder VALUES (6, 4, '2019-08-20', 72);
INSERT INTO purchaseOrder VALUES (6, 5, '2019-09-01', NULL);
INSERT INTO purchaseOrder VALUES (6, 6, '2019-08-20', 12);
INSERT INTO purchaseOrder VALUES (6, 8, '2019-08-20', 5);
INSERT INTO purchaseOrder VALUES (6, 9, '2019-09-01', 4);
INSERT INTO purchaseOrder VALUES (6, 12, '2019-08-27', 1);
INSERT INTO purchaseOrder VALUES (7, 4, '2019-09-02', 20);
INSERT INTO purchaseOrder VALUES (7, 5, '2019-08-20', 8);
INSERT INTO purchaseOrder VALUES (7, 8, '2019-08-27', 2);
INSERT INTO purchaseOrder VALUES (7, 9, '2019-09-02', 40);
INSERT INTO purchaseOrder VALUES (8, 1, '2019-09-03', 6);
INSERT INTO purchaseOrder VALUES (8, 2, '2019-09-03', 3);
INSERT INTO purchaseOrder VALUES (8, 4, '2019-09-03', 24);
INSERT INTO purchaseOrder VALUES (8, 6, '2019-09-03', 6);
INSERT INTO purchaseOrder VALUES (8, 7, '2019-09-03', 12);
INSERT INTO purchaseOrder VALUES (8, 8, '2019-09-03', 2);
