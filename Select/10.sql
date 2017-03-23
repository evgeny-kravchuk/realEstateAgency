SELECT f.*
FROM "DesiredFlat" df, "Flat" f
WHERE df."id_client" = 3
	AND df."City" = (f."Address")."City"
	AND (df."Hood" = f."Hood" OR df."Hood" IS NULL)
	AND (df."Street" = (f."Address")."Street" OR df."Street" IS NULL)
	AND (df."Type" = f."Type"OR df."Type" IS NULL)
	AND (df."Area" = f."Area" OR df."Area" IS NULL)
	AND (df."Room" = f."Room" OR df."Room" IS NULL)
	AND (df."Floor" = f."Floor" OR df."Floor" IS NULL)
	AND (df."Status" = f."Status" OR df."Status" IS NULL)
	AND (df."Price" = f."Price" OR df."Price" IS NULL)