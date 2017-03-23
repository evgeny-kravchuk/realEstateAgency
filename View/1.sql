SELECT hood."Hood", COUNT(DISTINCT num."id_object") num, AVG(flat."Price") flat_price, AVG(house."Price") house_price, AVG(plot."Price") plot_price, COUNT(DISTINCT popular."id_contract") num_popular, COUNT(DISTINCT contr."id_contract") num_contract
FROM "Objects" hood
LEFT JOIN "Objects" num ON hood."Hood" = num."Hood"
LEFT JOIN "Objects" flat ON hood."Hood" = flat."Hood" AND flat."Type" = 'Flat'
LEFT JOIN "Objects" house ON hood."Hood" = house."Hood" AND house."Type" = 'House'
LEFT JOIN "Objects" plot ON hood."Hood" = plot."Hood" AND plot."Type" = 'Plot'
LEFT JOIN "Contracts" popular ON hood."id_object" = popular."id_object"
LEFT JOIN "Contracts" contr ON hood."id_object" = contr."id_object"
GROUP BY hood."Hood"

------------------------------------------

SELECT hood."Hood", 
	DENSE_RANK() OVER(ORDER BY (SELECT COUNT(DISTINCT num."id_object") FROM "Objects" num WHERE hood."Hood" = num."Hood") DESC) number_of_proposals,
	DENSE_RANK() OVER(ORDER BY (SELECT AVG(flat."Price") FROM "Objects" flat WHERE hood."Hood" = flat."Hood" AND flat."Type" = 'Flat') DESC NULLS LAST) flat_prices,
	DENSE_RANK() OVER(ORDER BY (SELECT AVG(house."Price") FROM "Objects" house WHERE hood."Hood" = house."Hood" AND house."Type" = 'House') DESC NULLS LAST) house_prices,
	DENSE_RANK() OVER(ORDER BY (SELECT AVG(plot."Price") FROM "Objects" plot WHERE hood."Hood" = plot."Hood" AND plot."Type" = 'Plot') DESC NULLS LAST) plot_prices
FROM "Objects" hood
GROUP BY hood."Hood"

------------------------------------------
CREATE VIEW "1_task" AS
SELECT hood."Hood", 
	DENSE_RANK() OVER(ORDER BY COUNT(DISTINCT num."id_object") DESC NULLS LAST) number_of_proposals,
	DENSE_RANK() OVER(ORDER BY AVG(flat."Price") DESC NULLS LAST) flat_prices,
	DENSE_RANK() OVER(ORDER BY AVG(house."Price") DESC NULLS LAST) house_prices,
	DENSE_RANK() OVER(ORDER BY AVG(plot."Price") DESC NULLS LAST) plot_prices,
	DENSE_RANK() OVER(ORDER BY COUNT(DISTINCT popular."id_contract") DESC NULLS LAST) popular,
	DENSE_RANK() OVER(ORDER BY COUNT(DISTINCT contr."id_contract") DESC NULLS LAST) contracts
FROM "Objects" hood
LEFT JOIN "Objects" num ON hood."Hood" = num."Hood"
LEFT JOIN "Objects" flat ON hood."Hood" = flat."Hood" AND flat."Type" = 'Flat'
LEFT JOIN "Objects" house ON hood."Hood" = house."Hood" AND house."Type" = 'House'
LEFT JOIN "Objects" plot ON hood."Hood" = plot."Hood" AND plot."Type" = 'Plot'
LEFT JOIN "Contracts" popular ON hood."id_object" = popular."id_object"
LEFT JOIN "Contracts" contr ON hood."id_object" = contr."id_object"
GROUP BY hood."Hood"
