SELECT
    p.product_name,
    p.units_in_stock
FROM
    products p
JOIN (
    SELECT
        product_id,
        AVG(quantity) AS avg_quantity
    FROM
        order_details
    GROUP BY
        product_id
) avg ON p.product_id = avg.product_id
WHERE
    p.units_in_stock < avg.avg_quantity
ORDER BY
    p.product_name;


SELECT DISTINCT
    p.product_name
FROM
    products p
JOIN
    order_details od
    ON p.product_id = od.product_id
WHERE
    od.quantity = 10
ORDER BY
    p.product_name;