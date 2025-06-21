
WITH filtered as (
	SELECT 
		COALESCE("Categoria", 'Montadora') as categoria,
		COUNT(*) as qtde
	FROM {{ source('bronze', 'google_sheets_Worksheet')}} -- "google_sheets_Worksheet" gsw
	GROUP BY "Categoria" 
	ORDER BY "Categoria" 
)

SELECT * FROM filtered