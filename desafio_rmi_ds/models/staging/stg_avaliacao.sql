WITH source AS (
    SELECT *
        FROM {{ source('raw', 'avaliacao') }}
)

SELECT id_aluno,
        CAST(id_turma AS INTEGER) AS id_turma,
        SAFE_CAST(frequencia AS FLOAT64) AS frequencia,
        CAST(bimestre AS INTEGER) AS bimestre,
        SAFE_CAST(disciplina_1 AS FLOAT64) AS disciplina_1,
        SAFE_CAST(disciplina_2 AS FLOAT64) AS disciplina_2,
        SAFE_CAST(disciplina_3 AS FLOAT64) AS disciplina_3,
        SAFE_CAST(disciplina_4 AS FLOAT64) AS disciplina_4
    FROM source
    WHERE id_aluno IS NOT NULL
        AND id_turma IS NOT NULL
        AND frequencia IS NOT NULL