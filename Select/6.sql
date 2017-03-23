SELECT "Type", COUNT(DISTINCT "id_client") numCl
FROM  "Objects" o, "Contracts" c
WHERE o."id_object" = c."id_object" AND c."ContractType" = 'Rent'
GROUP BY "Type"
ORDER BY 2 DESC