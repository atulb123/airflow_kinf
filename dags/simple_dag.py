from datetime import datetime

from airflow import DAG
from airflow.operators.bash import BashOperator

with DAG('parallel_dag', start_date=datetime(2022, 1, 1),
         schedule_interval='@daily', catchup=False) as dag:
    task_1 = BashOperator(
        task_id='task_1',
        bash_command='echo task_1'
    )
    task_2 = BashOperator(
        task_id='task_2',
        bash_command='echo task_2'
    )

task_1 >> task_2
