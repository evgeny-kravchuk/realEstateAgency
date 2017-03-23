SELECT "Hood", COUNT(DISTINCT "id_contract") numCo
FROM "Objects" AS o, "Contracts" AS c
WHERE c."id_object" = o."id_object"
GROUP BY "Hood"
ORDER BY 2 DESC