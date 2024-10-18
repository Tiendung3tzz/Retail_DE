FROM quay.io/astronomer/astro-runtime:12.1.1

USER root
RUN apt-get update && apt-get install -y gcc g++
# Tạo môi trường ảo và cài đặt các gói Python
# Tạo môi trường ảo và cài đặt các gói Python
RUN python -m venv soda_venv && source soda_venv/bin/activate && \
    pip install --no-cache-dir setuptools && \
    pip install --no-cache-dir pendulum && \
    pip install --no-cache-dir apache-airflow==2.10.2 && \
    pip install --no-cache-dir soda-core-bigquery==3.3.22 &&\
    pip install --no-cache-dir soda-core-scientific==3.3.22 && deactivate

RUN python -m venv dbt_venv && source dbt_venv/bin/activate && \
    pip install --no-cache-dir dbt-bigquery==1.9.0b1 && deactivate