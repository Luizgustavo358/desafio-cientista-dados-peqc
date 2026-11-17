WITH source AS (
    SELECT *
        FROM {{ source('raw', 'escola') }}
)

SELECT CAST(id_escola AS INTEGER) AS id_escola,
        CAST(bairro AS INTEGER) AS bairro
    from source
    WHERE id_escola IS NOT NULL
        AND bairro IS NOT NULL