WITH source AS (
    SELECT *
        FROM {{ source('raw', 'turma') }}
)

SELECT CAST(ano       AS INTEGER) AS ano,
        CAST(id_turma AS INTEGER) AS id_turma,
        CAST(id_aluno AS STRING)  AS id_aluno
    FROM source
    WHERE id_turma IS NOT NULL
        AND id_aluno IS NOT NULL