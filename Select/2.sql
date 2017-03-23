SELECT "Clients"."Name", "Clients"."PhoneNumber"
FROM "Clients"
WHERE "Clients"."PhoneNumber" LIKE '%+380 50%'
UNION ALL
SELECT "Staff"."Name", "Staff"."PhoneNumber"
FROM "Staff"
WHERE "Staff"."PhoneNumber" LIKE '%+380 50%'