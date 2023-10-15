-- 1. Write a procedure that computes the perimeter and the area of a rectangle. Define your own 
--    values for the length and width. (Assuming that L and W are the length and width of the 
--    rectangle, Perimeter = 2*(L+W) and Area = L*W.


DROP PROCEDURE IF EXISTS perimeter;

DELIMITER $$
CREATE PROCEDURE perimeter()
BEGIN
    DECLARE L INT DEFAULT 10;
    DECLARE W INT DEFAULT 20;
    DECLARE Perimeter DOUBLE;
    DECLARE Area DOUBLE;
    SET Perimeter = 2*(L+W);
    SET Area = L*W;
    SELECT Perimeter AS Perimeter_of_rectangle, Area AS Area_of_rectangle;
END;
$$
DELIMITER ;



-- 2. Write a procedure that declares an integer variable called num, assigns a value to it, and 
--    computes and inserts into the temp table the value of the variable itself, its square, and its cube.

DROP PROCEDURE IF EXISTS square_cube;

DELIMITER $$
CREATE PROCEDURE square_cube()
BEGIN
    DECLARE num INT DEFAULT 10;
    DECLARE num_square INT;
    DECLARE num_cube INT;
    SET num_square = num*num;
    SET num_cube = num*num*num;
    INSERT INTO temp VALUES(num, num_square, num_cube);
END;
$$
DELIMITER ;



-- 3.Create a procedure to Convert a temperature in Fahrenheit (F) to its equivalent in Celsius (C) 
--   and vice versa. The required formulae are:- C= (F-32)*5/9 F= 9/5*C + 32

DROP PROCEDURE IF EXISTS temperature;

DELIMITER $$
CREATE PROCEDURE temperature(IN temp DOUBLE, IN ref VARCHAR(5))
BEGIN
    DECLARE Fahrenheit DOUBLE;
    DECLARE Celsius DOUBLE;
    IF ref = "F" THEN
        SET Fahrenheit = (9/5)*temp + 32;
        SELECT Fahrenheit AS Temperature_in_Fahrenheit;
    ELSEIF ref = "C" THEN
        SET Celsius = (temp-32) * 5/9;
        SELECT Celsius AS Temperature_in_Celsius;
    ELSE 
        SELECT "Enter 'F' or 'C' as Second Parameter." AS Error;
    END IF;
END;
$$
DELIMITER ;



-- 4.Create a procedure to Convert a number of inches into yards, feet, and inches. For example,
--   124 inches equals 3 yards, 1 foot, and 4 inches.

DROP PROCEDURE IF EXISTS convert_inch;

DELIMITER $$
CREATE PROCEDURE convert_inch(IN inch INT)
BEGIN
    DECLARE Y INT;
    DECLARE F INT;
    DECLARE I INT;
    SET Y = inch*0.0277778;
    SET F = (inch - (Y*36)) * 0.0833334;
    SET I = inch - ((Y*36) + (F*12));
    SELECT CONCAT_WS(" ", inch, " inches equals to ", Y, " yards, ", F, " foot, and ", I, " inches.") AS result;
END;
$$
DELIMITER ;



-- 5. Your block should read in two real numbers and tell whether the product of the two numbers 
--    is equal to or greater than 100.

DROP PROCEDURE IF EXISTS real_num;

DELIMITER $$
CREATE PROCEDURE real_num(IN num1 INT, IN num2 INT)
BEGIN
    DECLARE product INT;
    SET product = num1 * num2;
    IF product >= 100 THEN
    SELECT CONCAT_WS(" ", "product of ", num1, " AND ", num2, " is equal to or greater than 100.") AS Result;
    ELSE
    SELECT CONCAT_WS(" ", "product of ", num1, " AND ", num2, " is NOT equal to or greater than 100.") AS Result;
    END IF;
END;
$$
DELIMITER ;

------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------




