SELECT s."id_employee", "Type", SUM(DISTINCT "Price")
FROM "Contracts" c, "Staff" s, "Objects" o
WHERE c."id_employee" = s."id_employee" AND c."id_object" = o."id_object"
GROUP BY s."id_employee", "Type"