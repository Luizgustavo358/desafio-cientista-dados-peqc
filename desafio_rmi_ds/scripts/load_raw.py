from pathlib import Path
from google.cloud import bigquery

PROJECT_ID = "desafio-rmi-ds-515012"
DATASET = "raw"
LOCATION = "southamerica-east1"
DATA_DIR = Path("./data")
TABLES = ['aluno', 'escola', 'turma', 'frequencia', 'avaliacao']

client = bigquery.Client(project=PROJECT_ID)

# creates dataset if it doesn't exist
dataset = bigquery.Dataset(f"{PROJECT_ID}.{DATASET}")
dataset.location = LOCATION
client.create_dataset(dataset, exists_ok=True)

job_config = bigquery.LoadJobConfig(
    source_format=bigquery.SourceFormat.PARQUET,
    write_disposition=bigquery.WriteDisposition.WRITE_TRUNCATE
)

for table in TABLES:
    path = DATA_DIR / f"{table}"
    table_id = f"{PROJECT_ID}.{DATASET}.{table}"

    with open(path, "rb") as f:
        job = client.load_table_from_file(f, table_id, job_config=job_config)

    job.result()
    
    print(f"{table}: {client.get_table(table_id).num_rows} rows loaded to {table_id}.")