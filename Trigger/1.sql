/*Составить триггер для блокирования процесса продажи объекта, сданного в аренду.*/

============================================================================================================
/*INSERT INTO "Contracts"("id_employee","id_object","id_client","id_owner","StartDate","FinishDate","ContractType","Price") VALUES
	(2, 9, 4, 3, '01.10.2016', '02.11.2017', 'Sale', 85500);*/

CREATE OR REPLACE FUNCTION lockSale_F ()
	RETURNS  TRIGGER
	AS $$
	DECLARE
	"FDate" DATE;
	BEGIN
		SELECT MAX(C."FinishDate") INTO "FDate"
		FROM "Contracts" C
		WHERE C."id_object" = NEW."id_object";

		IF (NEW."StartDate" < "FDate") THEN 
			RAISE EXCEPTION 'The object is rented';
		END IF;
			
		RETURN NEW;
	END; 
$$ LANGUAGE plpgsql;

CREATE TRIGGER lockSale_TG
BEFORE INSERT ON "Contracts"
FOR EACH ROW EXECUTE PROCEDURE lockSale_F();