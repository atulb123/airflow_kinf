FROM apache/airflow:2.4.1
RUN pip install 'apache-airflow[amazon]'
RUN pip install 'apache-airflow[s3]'
RUN pip install boto3
COPY airflow.cfg ${AIRFLOW_HOME}/airflow.cfg
RUN airflow db init
RUN airflow connections add 's3_conn' --conn-json '{"conn_type": "aws","login": "AKIAUEX4HUD5N5B4LOUV","password": "3TY1Rxj9lgwxia1S87isRGDanLbKe/oBKPgwGaEi","host": "","port": null,"schema": "","extra": ""}'
COPY dags/ ${AIRFLOW_HOME}/dags
CMD ["airflow", "webserver", "-p", "8080"]
