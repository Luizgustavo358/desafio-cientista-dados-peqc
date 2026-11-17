WITH source AS (
    SELECT *
        FROM {{ source('raw', 'frequencia') }}
)

SELECT CAST(id_escola AS INTEGER) AS id_escola, 
        id_aluno, 
        CAST(id_turma AS INTEGER) AS id_turma, 
        CAST(data_inicio AS STRING) AS data_inicio, 
        CAST(data_fim AS STRING) AS data_fim,
        CAST(disciplina AS STRING) AS disciplina, 
        SAFE_CAST(frequencia AS FLOAT64) AS frequencia
    FROM source
    WHERE id_escola IS NOT NULL
        AND id_aluno IS NOT NULL
        AND id_turma IS NOT NULL
        AND data_inicio IS NOT NULL
        AND data_fim IS NOT NULL
        AND disciplina IS NOT NULL
        AND frequencia IS NOT NULL