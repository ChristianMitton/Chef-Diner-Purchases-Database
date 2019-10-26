/* Queries about diners
** Requires diners dataset
** Rutgers University - CS336 - Daniel Balouek-Thomert - 2019
*/

USE HW_diners;

-- Informations about the Chefs
SELECT * FROM Chef;


-- The name and city of diners who have at least two stars
SELECT nameDiner, cityDiner FROM Chef where nbStars >= 2;


-- The type of ingredients that are mesured in pounds, ordered by alphabetical order
SELECT typeI FROM Ingredient WHERE unitI = 'pound' ORDER BY typeI ASC;


-- The name of ingredients ordered by \textit{Will Smith} 
SELECT nameC, nameI
FROM Chef
	INNER JOIN purchaseOrder
    	ON Chef.idC = purchaseOrder.idC
    INNER JOIN Ingredient
    	ON purchaseOrder.idI = Ingredient.idI WHERE Chef.nameC = 'Will Smith';


-- What kind of dish can be cooked using those ingredients?
SELECT nameC, typeI
FROM Chef
	INNER JOIN purchaseOrder
    	ON Chef.idC = purchaseOrder.idC
    INNER JOIN Ingredient
    	ON purchaseOrder.idI = Ingredient.idI WHERE Chef.nameC = 'Will Smith';
/*
	Explanation:
	There is no way to determine the type of dish that can be cooked because that information isn't available.
	The Following gets the type of ingredient however:
*/


-- The name of Chefs associated to a diner containing the word \textit{'The'} or that are located in a city with a name containing at least two words
SELECT * FROM Chef 
WHERE Chef.nameDiner LIKE '%The%'
   OR LENGTH(Chef.cityDiner)-LENGTH(REPLACE(Chef.cityDiner, ' ', '')) > 0;


-- The pairs of ingredients of same type and same units
SELECT * FROM Ingredient ORDER BY typeI;


-- The orders for which the amount is unknown
SELECT * FROM purchaseOrder WHERE quantityP IS NULL;
/*
	Explanation:
	Selecting orders where the quantity is null
*/


-- The list of ingredients ordered by each Chef
SELECT nameC, nameI
FROM Chef
	INNER JOIN purchaseOrder
    	ON Chef.idC = purchaseOrder.idC
    INNER JOIN Ingredient
    	ON purchaseOrder.idI = Ingredient.idI;


-- For each ingredient of type 'fruit, vegetable', display its name and the Chefs that ordered it (without subqueries)
SELECT nameC, nameI, typeI
FROM Chef
	INNER JOIN purchaseOrder
    	ON Chef.idC = purchaseOrder.idC
    INNER JOIN Ingredient
    	ON purchaseOrder.idI = Ingredient.idI WHERE Ingredient.typeI = 'fruit, vegetable';


-- The name of Chefs that ordered an ingredient with a quantity greater than 50(using a join)
SELECT nameC, quantityP
FROM Chef
	INNER JOIN purchaseOrder
    	ON Chef.idC = purchaseOrder.idC WHERE purchaseOrder.quantityP > 50;


-- The name of Chefs that ordered an ingredient with a quantity greater than 50(using a subquery)
SELECT nameC
FROM Chef 
        WHERE idC IN (
            SELECT idC FROM purchaseOrder WHERE quantityP > 50
        );    

-- The chefs without any purchase order (using a multi lines subquery, no arithmetic operator)
SELECT nameC
FROM Chef 
        WHERE idC NOT IN (
            SELECT idC FROM purchaseOrder
        );    


-- The chefs without any purchase order (using a multi lines subquery, with arithmetic operator)
SELECT nameC
FROM Chef 
        WHERE idC = (
            SELECT idC FROM Chef WHERE idc NOT IN (
	            SELECT idC FROM purchaseOrder
            )
        );  
/*
	Explanation:
	Used '=' operator;
*/


-- The chefs without any purchase order (using a correlated subquery)
SELECT nameC
FROM Chef 
        WHERE idC IN (
            SELECT idC FROM purchaseOrder WHERE quantityP > 50
        );    
/*
	Explanation:
	Uses idC in outer subquery when finding searching for information in inner subquery
*/


-- The most awarded (starred) chefs (using a scalar subquery)
SELECT nameC, nbStars
FROM Chef
		WHERE nbStars = (SELECT MAX(nbStars) FROM Chef);


-- The ingredients ordered in the biggest quantity (using a multi lines subquery, with an arithmetic operator)
SELECT nameI
FROM Ingredient
	WHERE idI IN (
        SELECT idI FROM purchaseOrder WHERE quantityP = (
            SELECT MAX(quantityP) FROM purchaseOrder
        )
	);
/*
	Explanation:
	Gives the name of the ingredients ordered in the biggest quantity
*/


-- The chef that ordered ingredients of the same type, the same day as Homer Simpson
 SELECT nameC
 FROM Chef, purchaseOrder
 WHERE dateP IN (
                    SELECT dateP
                    FROM Chef
                        INNER JOIN purchaseOrder
                            ON Chef.idC = purchaseOrder.idC
                        INNER JOIN Ingredient
                            ON purchaseOrder.idI = Ingredient.idI WHERE Chef.nameC = 'Homer Simpson'
     																AND Ingredient.idI = purchaseOrder.idI
                 );

 /*
	Explanation:
	Gives the names of the chefs who ordered ingredients of the same type and day as Homer Simpson

	First, a table is created that has all of Homers information. Then, this Homer Simpson table is used in a subquery
	and compared to the purchaseOrder table and Chef table inorder to find the relevant information
 */


