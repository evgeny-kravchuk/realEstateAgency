UPDATE "Flat" SET "Status" = 'Под снос'
WHERE ("Flat"."Address")."Street" = 'Dacha Kovalevskogo' AND ("Flat"."Address")."HouseNumber" = 11;
UPDATE "House" SET "Status" = 'Под снос'
WHERE ("House"."Address")."Street" = 'Dacha Kovalevskogo' AND ("House"."Address")."HouseNumber" = 11;
UPDATE "Plot" SET "Status" = 'Под снос'
WHERE ("Plot"."Address")."Street" = 'Dacha Kovalevskogo' AND ("Plot"."Address")."HouseNumber" = 11