SELECT DISTINCT c."id_contract", c."id_object", c."Price" - o."Price" delta_prices
FROM "Contracts" c, "Objects" o
WHERE c."id_object" = o."id_object"

----------------------------

SELECT "id_object", "Price"
FROM "Contracts"
ORDER BY "id_object"

---------------------

CREATE VIEW "3_task" AS
SELECT "id_object", "Price",
	LEAD(CAST("Price" AS INTEGER), 1, CAST("Price" AS INTEGER)) OVER (PARTITION BY "id_object") - "Price" AS delta
FROM "Contracts"