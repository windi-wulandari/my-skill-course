SELECT `restaurants`.`id`,
    `restaurants`.`restaurant_name`,
    `restaurants`.`restaurant_type_id`,
    `restaurants`.`income_persentage`,
    `restaurants`.`city_id`
FROM `penawaran`.`restaurants`;

SELECT `orders`.`id`,
    `orders`.`date`,
    `orders`.`hour`,
    `orders`.`member_id`,
    `orders`.`restaurant_id`,
    `orders`.`total_order`
FROM `penawaran`.`orders`;

-- 1. Bagaimana Cara menampilkan restaurant dengan rata-rata order termahal di setiap restaurant (Gunakan CTE)?

WITH AvgOrderPerRestaurant AS (
    SELECT
        r.id AS restaurant_id,
        r.restaurant_name,
        AVG(o.total_order) AS avg_order
    FROM
        penawaran.restaurants r
    LEFT JOIN
        penawaran.orders o ON r.id = o.restaurant_id
    GROUP BY
        r.id, r.restaurant_name
)

-- Ini ada tambahan untuk subquery nya
SELECT
    ar.restaurant_id,
    ar.restaurant_name,
    ar.avg_order
FROM
    AvgOrderPerRestaurant ar
WHERE
    ar.avg_order = (
        SELECT MAX(avg_order)
        FROM AvgOrderPerRestaurant
        WHERE restaurant_id = ar.restaurant_id
    );


-----------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------


-- 2. Bagaimana Cara menampilkan restaurant dengan rata-rata order termahal di setiap restaurant (Gunakan Subquery)?

SELECT
    r.id AS restaurant_id,
    r.restaurant_name,
    AVG(o.total_order) AS avg_order
FROM
    penawaran.restaurants r
LEFT JOIN
    penawaran.orders o ON r.id = o.restaurant_id
GROUP BY
    r.id, r.restaurant_name
HAVING
    AVG(o.total_order) = (
        SELECT MAX(avg_order)
        FROM (
            SELECT
                r.id AS restaurant_id,
                AVG(o.total_order) AS avg_order
            FROM
                penawaran.restaurants r
            LEFT JOIN
                penawaran.orders o ON r.id = o.restaurant_id
            GROUP BY
                r.id
        ) AS Subquery
        WHERE
            Subquery.restaurant_id = r.id
    );
