CREATE OR REPLACE FUNCTION desiredObjects_F()
	RETURNS  TRIGGER
	AS $$
	BEGIN
		INSERT INTO "DesiredObjects"("id_desiredObject","id_client","City","Hood","Street","Type","Price") VALUES
		(NEW."id_desiredObject",NEW."id_client",NEW."City",NEW."Hood",NEW."Street",NEW."Type",NEW."Price");
			
		RETURN NEW;
	END; 
$$ LANGUAGE plpgsql;

CREATE TRIGGER TR_desiredFlat
BEFORE INSERT ON "DesiredFlat"
FOR EACH ROW EXECUTE PROCEDURE desiredObjects_F();

CREATE TRIGGER TR_desiredHouse
BEFORE INSERT ON "DesiredHouse"
FOR EACH ROW EXECUTE PROCEDURE desiredObjects_F();

CREATE TRIGGER TR_desiredPlot
BEFORE INSERT ON "DesiredPlot"
FOR EACH ROW EXECUTE PROCEDURE desiredObjects_F();

CREATE OR REPLACE FUNCTION Objects_F()
	RETURNS  TRIGGER
	AS $$
	BEGIN
		INSERT INTO "Objects"("id_object","id_owner","Address","Hood","Type","Price") VALUES
		(NEW."id_object",NEW."id_owner",NEW."Address",NEW."Hood",NEW."Type",NEW."Price");
			
		RETURN NEW;
	END; 
$$ LANGUAGE plpgsql;

CREATE TRIGGER TR_Flat
BEFORE INSERT ON "Flat"
FOR EACH ROW EXECUTE PROCEDURE Objects_F();

CREATE TRIGGER TR_House
BEFORE INSERT ON "House"
FOR EACH ROW EXECUTE PROCEDURE Objects_F();

CREATE TRIGGER TR_Plot
BEFORE INSERT ON "Plot"
FOR EACH ROW EXECUTE PROCEDURE Objects_F();