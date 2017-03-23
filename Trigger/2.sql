/*Составить хранимую процедуру для реализации факта продажи/сдачи в аренду объекта недвижимости (необходимые элементы передавать как параметры).*/

======================================================================================================================================================

SELECT * FROM FactRentSale (5)
/*CREATE OR REPLACE FUNCTION FactRentSale ("Object" INT) 
	RETURNS  
	TABLE ("id_object" INT, 
		"Fact" TEXT)
	AS $$
	DECLARE
	"Type" TEXT;
	"FDate" DATE;
	"SDate" DATE;
	BEGIN
		SELECT C."ContractType", C."FinishDate", C."StartDate" INTO "Type", "FDate", "SDate"
		FROM "Contracts" C
		WHERE C."id_object" = "Object";

		IF "Type" = 'Sale' AND "FDate" < 'today' THEN "Fact" := 'sold';
		ELSIF "Type" = 'Rent' AND "SDate" < 'today' THEN "Fact" := 'rented';
		ELSE "Fact" := 'actions have not been yet';
		END IF;
			
		RETURN QUERY 
			SELECT OobjId, "Fact"
			FROM
				(SELECT DISTINCT C."id_contract" CconId, O."id_object" OobjId, C."id_object" CobjId
				FROM "Objects" O LEFT JOIN "Contracts" C ON O."id_object" = C."id_object"
				ORDER BY C."id_contract") tab
			WHERE OobjId = "Object";
	END; 
$$ LANGUAGE plpgsql; */

======================================================================================================================================================

/*SELECT * FROM FactRentSalev2 (CAST(2 AS SMALLINT),
				CAST(22 AS SMALLINT),
				CAST(5 AS SMALLINT),
				CAST(4 AS SMALLINT),
				CAST('01.12.2016' AS DATE),
				CAST('01.12.2016' AS DATE),
				CAST('Sale' AS contract_type),
				CAST(780000 AS FLOAT))*/
CREATE OR REPLACE FUNCTION FactRentSalev2 ("id_employee" SMALLINT,
				"id_object" SMALLINT,
				"id_client" SMALLINT,
				"id_owner" SMALLINT,
				"StartDate" DATE,
				"FinishDate" DATE,
				"ContractType" contract_type,
				"Price" FLOAT) 
	RETURNS  
	TABLE ("_id_contract" INT,
		"_id_employee" SMALLINT,
		"_id_object" SMALLINT,
		"_id_client" SMALLINT,
		"_id_owner" SMALLINT,
		"_StartDate" DATE,
		"_FinishDate" DATE,
		"_ContractType" contract_type,
		"_Price" FLOAT)
	AS $$
	BEGIN
		INSERT INTO "Contracts"("id_employee","id_object","id_client","id_owner","StartDate","FinishDate","ContractType","Price") VALUES
					("id_employee","id_object","id_client","id_owner","StartDate","FinishDate","ContractType","Price");
			
		RETURN QUERY 
			SELECT *
			FROM "Contracts";
	END; 
$$ LANGUAGE plpgsql; 

============================================================FINISH========================================================================

/*SELECT * FROM FactRentSalev2 (CAST(2 AS SMALLINT),
				CAST(22 AS SMALLINT),
				CAST(5 AS SMALLINT),
				CAST(4 AS SMALLINT),
				CAST('01.12.2016' AS DATE),
				CAST('01.12.2016' AS DATE),
				CAST('Sale' AS contract_type),
				CAST(780000 AS FLOAT))*/
CREATE OR REPLACE FUNCTION FactRentSalev2 ("id_employee" SMALLINT,
				"id_object" SMALLINT,
				"id_client" SMALLINT,
				"id_owner" SMALLINT,
				"StartDate" DATE,
				"FinishDate" DATE,
				"ContractType" contract_type,
				"Price" FLOAT) 
	RETURNS INTEGER
	AS $$
	BEGIN
		INSERT INTO "Contracts"("id_employee","id_object","id_client","id_owner","StartDate","FinishDate","ContractType","Price") VALUES
					("id_employee","id_object","id_client","id_owner","StartDate","FinishDate","ContractType","Price");
	RETURN 1;
	END; 
$$ LANGUAGE plpgsql; 

======================================================================================================================================================

/*EXECUTE PROCEDURE AddRentSale (CAST(2 AS SMALLINT),
				CAST(22 AS SMALLINT),
				CAST(5 AS SMALLINT),
				CAST(4 AS SMALLINT),
				CAST(01.12.2016 AS DATE),
				CAST(01.12.2016 AS DATE),
				CAST('Sale' AS contract_type),
				CAST(780000 AS FLOAT))*/

SET TERM ; ^
GREATE PROCEDURE AddRentSale ("id_employee" SMALLINT,
				"id_object" SMALLINT,
				"id_client" SMALLINT,
				"id_owner" SMALLINT,
				"StartDate" DATE,
				"FinishDate" DATE,
				"ContractType" contract_type,
				"Price" FLOAT)
AS
BEGIN
	INSERT INTO "Contracts"("id_employee","id_object","id_client","id_owner","StartDate","FinishDate","ContractType","Price") VALUES
		("id_employee","id_object","id_client","id_owner","StartDate","FinishDate","ContractType","Price");	
END ^
SET TERM ^ ;