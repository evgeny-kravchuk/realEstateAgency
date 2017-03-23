/*Составить хранимую процедуру для подбора по критериям клиента объекта недвижимости, близкого к ним (нечёткий поиск, степень близости – на усмотрение студента), и сохранения в БД этих критериев при отстутствии результата (необходимые элементы передавать как параметры).*/

==================================================================FINISH==============================================================

/*SELECT * FROM AddOrFindDesiredFlat (CAST(3 AS SMALLINT), 
					CAST('Odesa' AS VARCHAR), 
					CAST('Prymorskui' AS hood), 
					CAST(NULL AS VARCHAR), 
					CAST(NULL AS INT), 
					CAST(2 AS SMALLINT), 
					CAST(NULL AS SMALLINT), 
					CAST('WithRepair' AS home_status), 
					CAST(NULL AS FLOAT))*/
CREATE OR REPLACE FUNCTION 
	AddOrFindDesiredFlat ("id_client" SMALLINT,
				"DCity" VARCHAR,
				"DHood" hood,
				"DStreet" VARCHAR,
				"DArea" INT,
				"DRoom" SMALLINT,
				"DFloor" SMALLINT,
				"DStatus" home_status,
				"DPrice" FLOAT) 

	RETURNS TABLE("id_object" INT,
			"id_owner" SMALLINT,
			"Address" address,
			"Hood" hood,
			"Type" type,
			"Price" FLOAT,
			"Area" INT,
			"Room" SMALLINT,
			"Floor" SMALLINT,
			"Status" home_status)
	AS $$
	DECLARE
	"DType" TEXT;
	"RowCount" INT;
	BEGIN
		"DType" := 'Flat';
		SELECT COUNT(F.*) INTO "RowCount"
		FROM "Flat" F
		WHERE 	"DCity" = (F."Address")."City"
			AND ("DHood" = F."Hood" OR "DHood" IS NULL)
			AND ("DStreet" = (F."Address")."Street" OR "DStreet" IS NULL)
			AND ("DType" = F."Type")
			AND ((F."Area" < "DArea" * 1.5 AND F."Area" > "DArea" * 0.5) OR "DArea" IS NULL)
			AND ((F."Room" < "DRoom" + 2 AND F."Room" > "DRoom" - 2) OR "DRoom" IS NULL)
			AND ((F."Floor" < "DFloor" + 2 AND F."Floor" > "DFloor" - 2) OR "DFloor" IS NULL)
			AND ("DStatus" = F."Status" OR "DStatus" IS NULL)
			AND ((F."Price" < "DPrice" * 1.5 AND F."Price" > "DPrice" * 0.5) OR "DPrice" IS NULL);

		IF ("RowCount" = 0) THEN 
			INSERT INTO "DesiredFlat"("id_client","City","Hood","Street","Type","Area","Room","Floor","Status","Price") VALUES
				("id_client","DCity","DHood","DStreet","DType","DArea","DRoom","DFloor","DStatus","DPrice");
			RETURN QUERY 
			SELECT F.*
			FROM "Flat" F
			WHERE 	"DCity" = (F."Address")."City"
				AND ("DHood" = F."Hood" OR "DHood" IS NULL)
				AND ("DStreet" = (F."Address")."Street" OR "DStreet" IS NULL)
				AND ("DType" = F."Type")
				AND ((F."Area" < "DArea" * 1.5 AND F."Area" > "DArea" * 0.5) OR "DArea" IS NULL)
				AND ((F."Room" < "DRoom" + 2 AND F."Room" > "DRoom" - 2) OR "DRoom" IS NULL)
				AND ((F."Floor" < "DFloor" + 2 AND F."Floor" > "DFloor" - 2) OR "DFloor" IS NULL)
				AND ("DStatus" = F."Status" OR "DStatus" IS NULL)
				AND ((F."Price" < "DPrice" * 1.5 AND F."Price" > "DPrice" * 0.5) OR "DPrice" IS NULL);
		ELSE
			RETURN QUERY 
				SELECT F.*
				FROM "Flat" F
				WHERE 	"DCity" = (F."Address")."City"
					AND ("DHood" = F."Hood" OR "DHood" IS NULL)
					AND ("DStreet" = (F."Address")."Street" OR "DStreet" IS NULL)
					AND ("DType" = F."Type")
					AND ((F."Area" < "DArea" * 1.5 AND F."Area" > "DArea" * 0.5) OR "DArea" IS NULL)
					AND ((F."Room" < "DRoom" + 2 AND F."Room" > "DRoom" - 2) OR "DRoom" IS NULL)
					AND ((F."Floor" < "DFloor" + 2 AND F."Floor" > "DFloor" - 2) OR "DFloor" IS NULL)
					AND ("DStatus" = F."Status" OR "DStatus" IS NULL)
					AND ((F."Price" < "DPrice" * 1.5 AND F."Price" > "DPrice" * 0.5) OR "DPrice" IS NULL);
		END IF;
	END; 
$$ LANGUAGE plpgsql;

======================================================================================================================================

/*SELECT * FROM AddOrFindDesiredHouse (CAST(3 AS SMALLINT), 
					CAST('Odesa' AS VARCHAR), 
					CAST('Prymorskui' AS hood), 
					CAST(NULL AS VARCHAR), 
					CAST(NULL AS INT), 
					CAST(2 AS SMALLINT), 
					CAST(NULL AS SMALLINT), 
					CAST('WithRepair' AS home_status), 
					CAST(NULL AS FLOAT))*/
CREATE OR REPLACE FUNCTION 
	AddOrFindDesiredHouse ("id_client" SMALLINT,
				"DCity" VARCHAR,
				"DHood" hood,
				"DStreet" VARCHAR,
				"DArea" INT,
				"DRoom" SMALLINT,
				"DNumberOfStoreys" SMALLINT,
				"DStatus" home_status,
				"DPrice" FLOAT) 

	RETURNS TABLE("id_object" INT,
			"id_owner" SMALLINT,
			"Address" address,
			"Hood" hood,
			"Type" type,
			"Price" FLOAT,
			"Area" INT,
			"Room" SMALLINT,
			"NumberOfStoreys" SMALLINT,
			"Status" home_status)
	AS $$
	DECLARE
	"DType" TEXT;
	"RowCount" INT;
	BEGIN
		"DType" := 'House';
		SELECT COUNT(H.*) INTO "RowCount"
		FROM "House" H
		WHERE 	"DCity" = (H."Address")."City"
			AND ("DHood" = H."Hood" OR "DHood" IS NULL)
			AND ("DStreet" = (H."Address")."Street" OR "DStreet" IS NULL)
			AND ("DType" = H."Type")
			AND ((H."Area" < "DArea" * 1.5 AND H."Area" > "DArea" * 0.5) OR "DArea" IS NULL)
			AND ((H."Room" < "DRoom" + 2 AND H."Room" > "DRoom" - 2) OR "DRoom" IS NULL)
			AND ((H."NumberOfStoreys" < "DNumberOfStoreys" + 2 AND H."NumberOfStoreys" > "DNumberOfStoreys" - 2) OR "DNumberOfStoreys" IS NULL)
			AND ("DStatus" = H."Status" OR "DStatus" IS NULL)
			AND ((H."Price" < "DPrice" * 1.5 AND H."Price" > "DPrice" * 0.5) OR "DPrice" IS NULL);

		IF ("RowCount" = 0) THEN 
			INSERT INTO "DesiredHouse"("id_client","City","Hood","Street","Type","Area","Room","NumberOfStoreys","Status","Price") VALUES
				("id_client","DCity","DHood","DStreet","DType","DArea","DRoom","DNumberOfStoreys","DStatus","DPrice");
			RETURN QUERY 
			SELECT H.*
			FROM "House" H
			WHERE 	"DCity" = (H."Address")."City"
				AND ("DHood" = H."Hood" OR "DHood" IS NULL)
				AND ("DStreet" = (H."Address")."Street" OR "DStreet" IS NULL)
				AND ("DType" = H."Type")
				AND ((H."Area" < "DArea" * 1.5 AND H."Area" > "DArea" * 0.5) OR "DArea" IS NULL)
				AND ((H."Room" < "DRoom" + 2 AND H."Room" > "DRoom" - 2) OR "DRoom" IS NULL)
				AND ((H."NumberOfStoreys" < "DNumberOfStoreys" + 2 AND H."NumberOfStoreys" > "DNumberOfStoreys" - 2) OR "DNumberOfStoreys" IS NULL)
				AND ("DStatus" = H."Status" OR "DStatus" IS NULL)
				AND ((H."Price" < "DPrice" * 1.5 AND H."Price" > "DPrice" * 0.5) OR "DPrice" IS NULL);
		ELSE
			RETURN QUERY 
				SELECT H.*
				FROM "House" H
				WHERE 	"DCity" = (H."Address")."City"
					AND ("DHood" = H."Hood" OR "DHood" IS NULL)
					AND ("DStreet" = (H."Address")."Street" OR "DStreet" IS NULL)
					AND ("DType" = H."Type")
					AND ((H."Area" < "DArea" * 1.5 AND H."Area" > "DArea" * 0.5) OR "DArea" IS NULL)
					AND ((H."Room" < "DRoom" + 2 AND H."Room" > "DRoom" - 2) OR "DRoom" IS NULL)
					AND ((H."NumberOfStoreys" < "DNumberOfStoreys" + 2 AND H."NumberOfStoreys" > "DNumberOfStoreys" - 2) OR "DNumberOfStoreys" IS NULL)
					AND ("DStatus" = H."Status" OR "DStatus" IS NULL)
					AND ((H."Price" < "DPrice" * 1.5 AND H."Price" > "DPrice" * 0.5) OR "DPrice" IS NULL);
		END IF;
	END; 
$$ LANGUAGE plpgsql;

======================================================================================================================================

/*SELECT * FROM AddOrFindDesiredPlot (CAST(3 AS SMALLINT), 
					CAST('Odesa' AS VARCHAR), 
					CAST('Prymorskui' AS hood), 
					CAST(NULL AS VARCHAR), 
					CAST(NULL AS INT),
					CAST('WithRepair' AS plot_status), 
					CAST(NULL AS FLOAT))*/
CREATE OR REPLACE FUNCTION 
	AddOrFindDesiredPlot ("id_client" SMALLINT,
				"DCity" VARCHAR,
				"DHood" hood,
				"DStreet" VARCHAR,
				"DArea" INT,
				"DStatus" plot_status,
				"DPrice" FLOAT) 

	RETURNS TABLE("id_object" INT,
			"id_owner" SMALLINT,
			"Address" address,
			"Hood" hood,
			"Type" type,
			"Price" FLOAT,
			"Area" INT,
			"Status" plot_status)
	AS $$
	DECLARE
	"DType" TEXT;
	"RowCount" INT;
	BEGIN
		"DType" := 'Plot';
		SELECT COUNT(F.*) INTO "RowCount"
		FROM "Plot" F
		WHERE 	"DCity" = (F."Address")."City"
			AND ("DHood" = F."Hood" OR "DHood" IS NULL)
			AND ("DStreet" = (F."Address")."Street" OR "DStreet" IS NULL)
			AND ("DType" = F."Type")
			AND ((F."Area" < "DArea" * 1.5 AND F."Area" > "DArea" * 0.5) OR "DArea" IS NULL)
			AND ("DStatus" = F."Status" OR "DStatus" IS NULL)
			AND ((F."Price" < "DPrice" * 1.5 AND F."Price" > "DPrice" * 0.5) OR "DPrice" IS NULL);

		IF ("RowCount" = 0) THEN 
			INSERT INTO "DesiredPlot"("id_client","City","Hood","Street","Type","Area","Status","Price") VALUES
				("id_client","DCity","DHood","DStreet","DType","DArea","DStatus","DPrice");
			RETURN QUERY 
			SELECT F.*
			FROM "Plot" F
			WHERE 	"DCity" = (F."Address")."City"
				AND ("DHood" = F."Hood" OR "DHood" IS NULL)
				AND ("DStreet" = (F."Address")."Street" OR "DStreet" IS NULL)
				AND ("DType" = F."Type")
				AND ((F."Area" < "DArea" * 1.5 AND F."Area" > "DArea" * 0.5) OR "DArea" IS NULL)
				AND ("DStatus" = F."Status" OR "DStatus" IS NULL)
				AND ((F."Price" < "DPrice" * 1.5 AND F."Price" > "DPrice" * 0.5) OR "DPrice" IS NULL);
		ELSE
			RETURN QUERY 
				SELECT F.*
				FROM "Plot" F
				WHERE 	"DCity" = (F."Address")."City"
					AND ("DHood" = F."Hood" OR "DHood" IS NULL)
					AND ("DStreet" = (F."Address")."Street" OR "DStreet" IS NULL)
					AND ("DType" = F."Type")
					AND ((F."Area" < "DArea" * 1.5 AND F."Area" > "DArea" * 0.5) OR "DArea" IS NULL)
					AND ("DStatus" = F."Status" OR "DStatus" IS NULL)
					AND ((F."Price" < "DPrice" * 1.5 AND F."Price" > "DPrice" * 0.5) OR "DPrice" IS NULL);
		END IF;
	END; 
$$ LANGUAGE plpgsql;

=================================================================================================================================

/*SELECT * FROM DesiredFlat (3)*/
CREATE OR REPLACE FUNCTION DesiredFlat ("Client" INT) 
	RETURNS TABLE("id_object" INT,
			"id_owner" SMALLINT,
			"Address" address,
			"Hood" hood,
			"Type" type,
			"Price" FLOAT,
			"Area" INT,
			"Room" SMALLINT,
			"Floor" SMALLINT,
			"Status" home_status)
	AS $$
	BEGIN
		RETURN QUERY 
				SELECT F.*
				FROM "DesiredFlat" DF, "Flat" F
				WHERE 	DF."id_client" = "Client"
					AND DF."City" = (F."Address")."City"
					AND (DF."Hood" = F."Hood" OR DF."Hood" IS NULL)
					AND (DF."Street" = (F."Address")."Street" OR DF."Street" IS NULL)
					AND (DF."Type" = F."Type"OR DF."Type" IS NULL)
					AND ((F."Area" < DF."Area" * 1.5 AND F."Area" > DF."Area" * 0.5) OR DF."Area" IS NULL)
					AND ((F."Room" < DF."Room" + 2 AND F."Room" > DF."Room" - 2) OR DF."Room" IS NULL)
					AND ((F."Floor" < DF."Floor" + 2 AND F."Floor" > DF."Floor" - 2) OR DF."Floor" IS NULL)
					AND (DF."Status" = F."Status" OR DF."Status" IS NULL)
					AND ((F."Price" < DF."Price" * 1.5 AND F."Price" > DF."Price" * 0.5) OR DF."Price" IS NULL);
			
	END; 
$$ LANGUAGE plpgsql;

======================================================================================================================================

/*SELECT * FROM DesiredHouse (6)*/
CREATE OR REPLACE FUNCTION DesiredHouse ("Client" INT) 
	RETURNS TABLE("id_object" INT,
			"id_owner" SMALLINT,
			"Address" address,
			"Hood" hood,
			"Type" type,
			"Price" FLOAT,
			"Area" INT,
			"Room" SMALLINT,
			"NumberOfStoreys" SMALLINT,
			"Status" home_status)
	AS $$
	BEGIN
		RETURN QUERY 
			SELECT H.*
			FROM "DesiredHouse" DH, "House" H
			WHERE 	DH."id_client" = "Client"
				AND DH."City" = (H."Address")."City"
				AND (DH."Hood" = H."Hood" OR DH."Hood" IS NULL)
				AND (DH."Street" = (H."Address")."Street" OR DH."Street" IS NULL)
				AND (DH."Type" = H."Type"OR DH."Type" IS NULL)
				AND ((H."Area" < DH."Area" * 1.5 AND H."Area" > DH."Area" * 0.5) OR DH."Area" IS NULL)
				AND ((H."Room" < DH."Room" + 2 AND H."Room" > DH."Room" - 2) OR DH."Room" IS NULL)
				AND ((H."NumberOfStoreys" < DH."NumberOfStoreys" + 2 AND H."NumberOfStoreys" > DH."NumberOfStoreys" - 2) OR DH."NumberOfStoreys" IS NULL)
				AND (DH."Status" = H."Status" OR DH."Status" IS NULL)
				AND ((H."Price" < DH."Price" * 1.5 AND H."Price" > DH."Price" * 0.5) OR DH."Price" IS NULL);
			
	END; 
$$ LANGUAGE plpgsql;

======================================================================================================================================

/*SELECT * FROM DesiredPlot (4)*/
CREATE OR REPLACE FUNCTION DesiredPlot ("Client" INT) 
	RETURNS TABLE("id_object" INT,
			"id_owner" SMALLINT,
			"Address" address,
			"Hood" hood,
			"Type" type,
			"Price" FLOAT,
			"Area" INT,
			"Status" plot_status)
	AS $$
	BEGIN
		RETURN QUERY 
			SELECT P.*
			FROM "DesiredPlot" DP, "Plot" P
			WHERE 	DP."id_client" = "Client"
				AND DP."City" = (P."Address")."City"
				AND (DP."Hood" = P."Hood" OR DP."Hood" IS NULL)
				AND (DP."Street" = (P."Address")."Street" OR DP."Street" IS NULL)
				AND (DP."Type" = P."Type"OR DP."Type" IS NULL)
				AND ((P."Area" < DP."Area" * 1.5 AND P."Area" > DP."Area" * 0.5) OR DP."Area" IS NULL)
				AND (DP."Status" = P."Status" OR DP."Status" IS NULL)
				AND ((P."Price" < DP."Price" * 1.5 AND P."Price" > DP."Price" * 0.5) OR DP."Price" IS NULL);	
	END; 
$$ LANGUAGE plpgsql;