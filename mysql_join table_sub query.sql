SELECT `restaurants`.`id`,
    `restaurants`.`restaurant_name`,
    `restaurants`.`restaurant_type_id`,
    `restaurants`.`income_persentage`,
    `restaurants`.`city_id`
FROM `restaurant`.`restaurants`;


SELECT `meals`.`id`,
    `meals`.`restaurant_id`,
    `meals`.`serve_type_id`,
    `meals`.`meal_type_id`,
    `meals`.`hot_cold`,
    `meals`.`meal_name`,
    `meals`.`price`
FROM `restaurant`.`meals`;

SELECT 
    `restaurants`.`id` AS `restaurant_id`,
    `restaurants`.`restaurant_name`,
    `meals`.`id` AS `meal_id`,
    `meals`.`meal_name`,
    `meals`.`price`
FROM 
    `restaurant`.`restaurants`
INNER JOIN
    `restaurant`.`meals` ON `restaurants`.`id` = `meals`.`restaurant_id`;
    

-- 1. Inner Join
SELECT 
    restaurants.id AS restaurant_id,
    restaurants.restaurant_name,
    meals.id AS meal_id,
    meals.meal_name,
    meals.price
FROM 
    restaurant.restaurants
INNER JOIN
    restaurant.meals ON restaurants.id = meals.restaurant_id;
    
    
-- 2. Restaurant dengan jumlah menu terbanyak sub query ya, yaitu join dengan agregat
SELECT 
    `restaurants`.`id` AS `restaurant_id`,
    `restaurants`.`restaurant_name`,
    COUNT(`meals`.`id`) AS `total_menus`
FROM 
    `restaurant`.`restaurants`
INNER JOIN
    `restaurant`.`meals` ON `restaurants`.`id` = `meals`.`restaurant_id`
GROUP BY 
    `restaurants`.`id`, `restaurants`.`restaurant_name`
ORDER BY 
    `total_menus` DESC
LIMIT 3;


-- 3. Restaurant dengan menu termahal ini termasuk pada sub query ya, yaitu join dengan agregat
SELECT 
    `restaurants`.`id` AS `restaurant_id`,
    `restaurants`.`restaurant_name`,
    MAX(`meals`.`price`) AS `max_menu_price`
FROM 
    `restaurant`.`restaurants`
INNER JOIN
    `restaurant`.`meals` ON `restaurants`.`id` = `meals`.`restaurant_id`
GROUP BY 
    `restaurants`.`id`, `restaurants`.`restaurant_name`
ORDER BY 
    `max_menu_price` DESC
LIMIT 4;
