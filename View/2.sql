CREATE VIEW "2_task" AS
	SELECT "Name", COUNT(DISTINCT f."id_object") num_flat, COUNT(DISTINCT h."id_object") num_house, COUNT(DISTINCT p."id_object") num_plot, SUM(DISTINCT price."Price")
	FROM "Clients" 
	LEFT JOIN "Objects" f ON "id_client" = f."id_owner" AND f."Type" = 'Flat' 
	LEFT JOIN "Objects" h ON "id_client" = h."id_owner" AND h."Type" = 'House' 
	LEFT JOIN "Objects" p ON "id_client" = p."id_owner" AND p."Type" = 'Plot'
	LEFT JOIN "Objects" price ON "id_client" = price."id_owner"
	GROUP BY "Name"