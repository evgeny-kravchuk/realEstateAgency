INSERT INTO "Positions" VALUES
	('Director',7500),
	('Manager',5840),
	('Realtor',4300);
INSERT INTO "Staff"("Name","PhoneNumber","Sex","DateOfBirth","Position") VALUES
	('("Kravchuk","Yevhenii","Ihorovych")', '+380 99 984 0486', 'Male', '20.11.1996', 'Director'),
	('("Moskovchuk","Olena","Sergiivna")', '+380 50 034 2045', 'Female', '20.11.1996', 'Manager'),
	('("Yakovyna","Dmytro","Havrylovych")', '+380 64 785 0558', 'Male', '12.10.1995', 'Manager'),
	('("Kurnosyk","Dmytro","Ihorovych")', '+380 50 896 1445', 'Male', '10.01.1989', 'Manager'),
	('("Salivonchyk","Olena","Serhiivna")', '+380 66 856 4589', 'Female', '15.05.1991', 'Realtor'),
	('("Hlasiuk","Olha","Serhiivna")', '+380 98 874 7412', 'Female', '18.03.1992', 'Realtor'),
	('("Lutsyk","Taras","Fedorovych")', '+380 67 132 1203', 'Male', '25.07.1990', 'Realtor'),
	('("Kozhumiaka","Tetiana","Andriivna")', '+380 67 988 1214', 'Female', '07.04.1989', 'Realtor'),
	('("Shtanko","Ivana","Artemivna")', '+380 96 125 7853', 'Female', '08.11.1988', 'Realtor'),
	('("Vasylkiv","Mykola","Pylypovych")', '+380 66 745 0778', 'Male', '20.12.1987', 'Realtor'),
	('("Osnova","Olha","Vasylivna")', '+380 99 784 5589', 'Female', '03.04.1989', 'Realtor'),
	('("Halushko","Ihor","Petrovych")', '+380 98 120 4589', 'Male', '15.02.1990', 'Realtor'),
	('("Kartuz","Anzhela","Mykolaivna")', '+380 50 977 1203', 'Female', '05.11.1994', 'Realtor'),
	('("Shteinshnaider","Mykyta","Andronovych")', '+380 50 745 1455', 'Male', '08.06.1992', 'Realtor');
INSERT INTO "Clients"("Name","PhoneNumber") VALUES
	('("Radionov","Havrylo","Fedorovych")', '+380 66 785 2153'),
	('("Fedorov","Maksym","Ivanovych")', '+380 50 152 3566'),
	('("Kurlyk","Karina","Maksymivna")', '+380 96 548 3215'),
	('("Maksymenko","Karina","Oleksiivna")', '+380 97 785 6446'),
	('("Kosmach","Marko","Pylypovych")', '+380 97 846 6546'),
	('("Dutka","Olha","Vasylivna")', '+380 98 789 2456'),
	('("Marchuk","Kateryna","Oleksandrivna")', '+380 99 788 4566'),
	('("Oles","Mykola","Hurovych")', '+380 66 152 1254'),
	('("Tihipko","Oleksandr","Serhiiovych")', '+380 68 136 7855'),
	('("Myla","Alona","Mykolaivna")', '+380 50 215 4586'),
	('("I","will","die")', '+380 66 666 6666');
	
INSERT INTO "Flat"("id_owner","Address","Hood","Type","Area","Room","Floor","Status","Price") VALUES
	(3, '(68420,"Odesa","Pastera",12,33)', 'Prymorskui', 'Flat', 65, 2, 3, 'WithRepair', 78500),
	(5, '(68000,"Odesa","Serednyofontanska",34,78)', 'Prymorskui', 'Flat', 42, 2, 5, 'WithoutRepair', 34000),
	(9, '(68024,"Odesa","Dvoryanska",6,4)', 'Prymorskui', 'Flat', 128, 4, 2, 'Good', 210500),
	(4, '(68654,"Odesa","Genuezska",3,178)', 'Kyivskyi', 'Flat', 95, 3, 14, 'WithRepair', 185000),
	(3, '(68220,"Odesa","Rishelevska",74,12)', 'Malinovskyi', 'Flat', 24, 1, 1, 'WithoutRepair', 20000),
	(3, '(68220,"Odesa","Rishelevska",74,11)', 'Suvorovskyi', 'Flat', 25, 1, 1, 'Good', 24300);
INSERT INTO "House"("id_owner","Address","Hood","Type","Area","Room","NumberOfStoreys","Status","Price") VALUES
	(7, '(66523,"Odesa","Abrykosova",40,)', 'Kyivskyi', 'House', 120, 3, 2, 'WithRepair', 263500),
	(1, '(66000,"Odesa","Vyshneva",22,)', 'Malinovskyi', 'House', 98, 2, 1, 'WithoutRepair', 340000),
	(3, '(66024,"Odesa","Biloruska",7,)', 'Kyivskyi', 'House', 248, 5, 3, 'Good', 785500),
	(4, '(66654,"Odesa","Kvitkova",15,)', 'Suvorovskyi', 'House', 175, 3, 2, 'WithRepair', 185000),
	(1, '(66220,"Odesa","Sonyachna",14,)', 'Malinovskyi', 'House', 123, 3, 1, 'WithoutRepair', 258000),
	(2, '(66220,"Odesa","Sonyachna",15,)', 'Suvorovskyi', 'House', 86, 2, 1, 'Good', 243300);
INSERT INTO "Plot"("id_owner","Address","Hood","Type","Area","Status","Price") VALUES
	(2, '(67523,"Odesa","Prykordona",41,)', 'Suvorovskyi', 'Plot', 4, 'WithBuildings', 63500),
	(4, '(64000,"Odesa","Zlagody",28,)', 'Malinovskyi', 'Plot', 5, 'Clean', 340000),
	(6, '(55024,"Odesa","Svitla",45,)', 'Kyivskyi', 'Plot', 10, 'WithBuildings', 785500),
	(6, '(67645,"Odesa","Parkova",178,)', 'Suvorovskyi', 'Plot', 3, 'WithBuildings', 185000),
	(8, '(67420,"Odesa","Dacha Kovalevskogo",11,)', 'Kyivskyi', 'Plot', 5, 'Clean', 58000),
	(9, '(67220,"Odesa","Dacha Kovalevskogo",17,)', 'Malinovskyi', 'Plot', 6, 'Clean', 43300);
INSERT INTO "Objects"("id_object","id_owner","Address","Hood","Type","Price") VALUES
	(1, 3, '(68420,Odesa,Pastera,12,33)', 'Prymorskui', 'Flat', 78500),
	(2, 5, '(68000,Odesa,Serednyofontanska,34,78)', 'Prymorskui', 'Flat', 34000),
	(3, 9, '(68024,Odesa,Dvoryanska,6,4)', 'Prymorskui', 'Flat', 210500),
	(4, 4, '(68654,Odesa,Genuezska,3,178)', 'Kyivskyi', 'Flat', 185000),
	(5, 3, '(68220,Odesa,Rishelevska,74,12)', 'Malinovskyi', 'Flat', 20000),
	(6, 3, '(68220,Odesa,Rishelevska,74,11)', 'Suvorovskyi', 'Flat', 24300),
	(7, 7, '(66523,Odesa,Abrykosova,40,)', 'Kyivskyi', 'House', 263500),
	(8, 1, '(66000,Odesa,Vyshneva,22,)', 'Malinovskyi', 'House', 340000),
	(9, 3, '(66024,Odesa,Biloruska,7,)', 'Kyivskyi', 'House', 785500),
	(10, 4, '(66654,Odesa,Kvitkova,15,)', 'Suvorovskyi', 'House', 185000),
	(11, 1, '(66220,Odesa,Sonyachna,14,)', 'Malinovskyi', 'House', 258000),
	(12, 2, '(66220,Odesa,Sonyachna,15,)', 'Suvorovskyi', 'House', 243300),
	(13, 2, '(67523,Odesa,Prykordona,41,)', 'Suvorovskyi', 'Plot', 63500),
	(14, 4, '(64000,Odesa,Zlagody,28,)', 'Malinovskyi', 'Plot', 340000),
	(15, 6, '(55024,Odesa,Svitla,45,)', 'Kyivskyi', 'Plot', 785500),
	(16, 6, '(67645,Odesa,Parkova,178,)', 'Suvorovskyi', 'Plot', 185000),
	(17, 8, '(67420,Odesa,"Dacha Kovalevskogo",11,)', 'Kyivskyi', 'Plot', 58000),
	(18, 9, '(67220,Odesa,"Dacha Kovalevskogo",17,)', 'Malinovskyi', 'Plot', 43300);
	
INSERT INTO "DesiredFlat"("id_client","City","Hood","Street","Type","Area","Room","Floor","Status","Price") VALUES
	(3,'Odesa', 'Prymorskui', NULL, 'Flat', NULL, 2, NULL, 'WithRepair', NULL),
	(5,'Odesa', NULL, NULL, 'Flat', 60, NULL, NULL, 'WithoutRepair', 20000);
INSERT INTO "DesiredHouse"("id_client","City","Hood","Street","Type","Area","Room","NumberOfStoreys","Status","Price") VALUES
	(6,'Odesa', 'Malinovskyi', NULL, 'House', 120, NULL, NULL, 'WithRepair', 263500),
	(9,'Odesa', 'Kyivskyi', NULL, 'House', NULL, NULL, 3, 'WithoutRepair', NULL);
INSERT INTO "DesiredPlot"("id_client","City","Hood","Street","Type","Area","Status","Price") VALUES
	(4,'Odesa', 'Malinovskyi', 'Parkova', 'Plot', 3, 'WithBuildings', NULL),
	(4,'Odesa', 'Suvorovskyi', 'Svitla', 'Plot', 5, 'Clean', 340000);
INSERT INTO "DesiredObjects"("id_desiredObject","id_client","City","Hood","Street","Type","Price") VALUES
	(1, 3, 'Odesa', 'Prymorskui', NULL, 'Flat', NULL),
	(2, 5, 'Odesa', NULL, NULL, 'Flat', 20000),
	(3, 6, 'Odesa', 'Malinovskyi', NULL, 'House', 263500),
	(4, 9, 'Odesa', 'Kyivskyi', NULL, 'House', NULL),
	(5, 4, 'Odesa', 'Malinovskyi', 'Parkova', 'Plot', NULL),
	(6, 4, 'Odesa', 'Suvorovskyi', 'Svitla', 'Plot', 340000);
INSERT INTO "Contracts"("id_employee","id_object","id_client","id_owner","StartDate","FinishDate","ContractType","Price") VALUES
	(1, 2, 2, 3, '04.10.2016', '04.10.2016', 'Sale', 34000),
	(3, 6, 8, 3, '01.09.2016', NULL, 'Rent', 24300),
	(7, 17, 1, 8, '20.07.2015', '20.07.2015', 'Sale', 58000),
	(11, 10, 7, 4, '01.05.2016', '01.09.2016', 'Rent', 185000),
	(9, 4, 3, 4, '30.10.2016', '01.11.2016', 'Sale', 185000),
	(4, 9, 1, 3, '01.02.2016', '02.04.2016', 'Rent', 650000),
	(9, 5, 2, 3, '28.04.2012', '30.04.2012', 'Sale', 20000),
	(12, 9, 2, 3, '01.05.2016', '02.11.2016', 'Rent', 785500);