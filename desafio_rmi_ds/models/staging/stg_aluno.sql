WITH source AS (
    SELECT *
        FROM {{ source('raw', 'aluno') }}
)

SELECT id_aluno, 
        CAST(id_turma AS INTEGER) AS id_turma, 
        CAST(faixa_etaria AS STRING) AS faixa_etaria, 
        CAST(bairro AS INTEGER) AS bairro
    FROM source
    WHERE id_aluno IS NOT NULL
        AND id_turma IS NOT NULL