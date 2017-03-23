SELECT cl.*
FROM "Clients" AS cl, "Objects" AS o1, "Contracts" AS co, "Objects" AS o2
WHERE cl."id_client" = co."id_owner" AND co."id_object" = o1."id_object"
GROUP BY cl."id_client"
HAVING COUNT(DISTINCT o1."Hood") = COUNT(DISTINCT o2."Hood")