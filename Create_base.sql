CREATE TYPE "address" AS (
	"PostCode"	CHAR(5),
	"City"		VARCHAR,
	"Street"	VARCHAR,
	"HouseNumber"	SMALLINT,
	"FlatNumber"	SMALLINT
	);
CREATE TYPE "name" AS (
	"LastName"	TEXT,
	"FirstName"	TEXT,
	"Patronymic"	TEXT
	);

	
CREATE DOMAIN "type" AS TEXT
	CHECK (VALUE IN ('Flat','House','Plot'));
CREATE DOMAIN "sex" AS TEXT
	CHECK (VALUE IN ('Male','Female'));
CREATE DOMAIN "staff_position" AS TEXT
	CHECK (VALUE IN ('Director','Manager','Realtor'));
CREATE DOMAIN "contract_type" AS TEXT
	CHECK (VALUE IN ('Rent','Sale'));
CREATE DOMAIN "home_status" AS TEXT
	CHECK (VALUE IN ('WithRepair','Good','WithoutRepair','Под снос'));
CREATE DOMAIN "plot_status" AS TEXT
	CHECK (VALUE IN ('Clean','WithBuildings','Под снос'));
CREATE DOMAIN "hood" AS TEXT
	CHECK (VALUE IN ('Prymorskui','Kyivskyi','Malinovskyi','Suvorovskyi'));

CREATE TABLE "Clients" (
	"id_client"	SERIAL		NOT NULL	PRIMARY KEY,
	"Name"		name		NOT NULL,
	"PhoneNumber"	CHAR(16)	NOT NULL	CHECK ("PhoneNumber" SIMILAR TO '\+380 {1}[0-9]{2} {1}[0-9]{3} {1}[0-9]{4}')
	);
CREATE TABLE "Objects" (
	"id_object"	SERIAL		NOT NULL	PRIMARY KEY,
	"id_owner"	SMALLINT	NOT NULL	REFERENCES "Clients",
	"Address"	address		NOT NULL,
	"Hood"		hood		NOT NULL,
	"Type"		type		NOT NULL,
	"Price"		FLOAT		NOT NULL	CHECK ("Price" > 0)
	);
CREATE TABLE "Positions" (
	"Position"	staff_position	NOT NULL	PRIMARY KEY,
	"Salary"	FLOAT		NOT NULL
	);
CREATE TABLE "Staff" (
	"id_employee"	SERIAL		NOT NULL	PRIMARY KEY,
	"Name"		name		NOT NULL,
	"PhoneNumber"	CHAR(16)	NOT NULL	CHECK ("PhoneNumber" SIMILAR TO '\+380 {1}[0-9]{2} {1}[0-9]{3} {1}[0-9]{4}'),
	"Sex"		sex		NOT NULL,
	"DateOfBirth"	DATE		NOT NULL,
	"Position"	TEXT		NOT NULL	REFERENCES "Positions"
	);
CREATE TABLE "Contracts" (
	"id_contract"	SERIAL		NOT NULL	PRIMARY KEY,
	"id_employee"	SMALLINT	NOT NULL	REFERENCES "Staff",
	"id_object"	SMALLINT	NOT NULL	REFERENCES "Objects",
	"id_client"	SMALLINT	NOT NULL	REFERENCES "Clients",
	"id_owner"	SMALLINT	NOT NULL	REFERENCES "Clients",
	"StartDate"	DATE		NOT NULL,
	"FinishDate"	DATE,
	"ContractType"	contract_type	NOT NULL,
	"Price"		FLOAT		NOT NULL,
	CHECK ("StartDate" <= "FinishDate"),
	UNIQUE ("id_employee","id_object","id_client","id_owner","StartDate")
	);
CREATE TABLE "DesiredObjects" (
	"id_desiredObject"	SERIAL		NOT NULL	PRIMARY KEY,
	"id_client"		SMALLINT	NOT NULL	REFERENCES "Clients",
	"City"			VARCHAR,
	"Hood"			hood,
	"Street"		VARCHAR,
	"Type"			type		NOT NULL,
	"Price"			FLOAT		CHECK ("Price" > 0)
	);

	
CREATE TABLE "Flat" (
	"Area"		INT		NOT NULL,
	"Room"		SMALLINT	NOT NULL	CHECK ("Room" > 0 AND "Room" <= 10),
	"Floor"		SMALLINT	NOT NULL	CHECK ("Floor" > 0 AND "Floor" <= 162),
	"Status"	home_status	NOT NULL
	)  
	INHERITS ("Objects");
CREATE TABLE "House" (
	"Area"			INT		NOT NULL,
	"Room"			SMALLINT	NOT NULL	CHECK ("Room" > 0 AND "Room" <= 10),
	"NumberOfStoreys"	SMALLINT	NOT NULL	CHECK ("NumberOfStoreys" > 0 AND "NumberOfStoreys" <= 5),
	"Status"		home_status	NOT NULL
	)  
	INHERITS ("Objects");
CREATE TABLE "Plot" (
	"Area"			INT		NOT NULL,
	"Status"		plot_status	NOT NULL
	)  
	INHERITS ("Objects");

	
CREATE TABLE "DesiredFlat" (
	"Area"		INT,
	"Room"		SMALLINT	CHECK ("Room" > 0 AND "Room" <= 10),
	"Floor"		SMALLINT	CHECK ("Floor" > 0 AND "Floor" <= 162),
	"Status"	home_status
	)  
	INHERITS ("DesiredObjects");
CREATE TABLE "DesiredHouse" (
	"Area"			INT,
	"Room"			SMALLINT	CHECK ("Room" > 0 AND "Room" <= 10),
	"NumberOfStoreys"	SMALLINT	CHECK ("NumberOfStoreys" > 0 AND "NumberOfStoreys" <= 5),
	"Status"		home_status
	)  
	INHERITS ("DesiredObjects");
CREATE TABLE "DesiredPlot" (
	"Area"			INT,
	"Status"		plot_status
	)  
	INHERITS ("DesiredObjects");