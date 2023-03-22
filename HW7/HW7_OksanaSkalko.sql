-- Task 1
'film_in_stock - скільки екземплярів певного фільму є в наявності у вибраному магазині'
'film_not_in_stock - скільки екземплярів вказаного фільму із вибраного магазину являються на даний момент орендованими (ще не повернені)'
'rewards_report - звіт про найкращих клієнтів за останній місяць, які відповідають заданим вимогам по кількості і вартості замовлень'
'get_customer_balance - визначає чи немає боргів у користувача з певним id на вказану дату, якщо є, то яка сума боргу'
'inventory_held_by_customer - знаходить у якого клієнта неповернений inventory по inventory_id'
'inventory_in_stock - перевіряє чи є в наявності певний inventory'

-- Task 2
DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `amount_of_orders`() RETURNS int
    READS SQL DATA
BEGIN
    DECLARE amount INT;

    SELECT COUNT(*) INTO amount
    FROM orders;

    RETURN (amount);
END;
$$

SELECT wallpaper.amount_of_orders();

-- Task 3
CREATE DEFINER=`root`@`localhost` FUNCTION `customer_phone`(p_customer_id int) RETURNS VARCHAR(20) CHARSET utf8mb4
	READS SQL DATA
BEGIN
    DECLARE customer_phone VARCHAR(20);

    SELECT phone INTO customer_phone
    FROM customers
    WHERE customer_id = p_customer_id;

    RETURN customer_phone;
END;

SELECT wallpaper.customer_phone(1);

-- Task 4
DELIMITER $$
CREATE TRIGGER wallpaper.before_insert_order_date
    before INSERT
    on wallpaper.orders FOR EACH ROW
BEGIN
    if NEW.order_date is null
		then set NEW.order_date = curdate();
end if;
END;
$$

INSERT INTO wallpaper.orders (customer_id, production_line_id, order_date)
VALUES
    (4, 4, NULL);

SELECT * FROM wallpaper.orders;

-- Task 5
CREATE TABLE test_table (
    id INT NOT NULL AUTO_INCREMENT,
    str_field VARCHAR(50),
    int_field INT,
    PRIMARY KEY (id)
);

INSERT INTO wallpaper.test_table (str_field, int_field)
VALUES
    ('a', 1),
    ('b', 2),
    ('c', 3),
    ('d', 4);

SELECT * FROM wallpaper.test_table

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_test_table`()
    MODIFIES SQL DATA
BEGIN
UPDATE test_table
SET str_field = CONCAT(str_field,str_field),
    int_field = int_field + 1;
END;
$$

CALL wallpaper.update_test_table();

SELECT * FROM wallpaper.test_table;
