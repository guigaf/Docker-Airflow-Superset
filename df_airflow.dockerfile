FROM apache/airflow:2.8.0
RUN pip install --upgrade pip
RUN pip install pandas cryptography matplotlib plotly openpyxl pyarrow requests seaborn scikit-learn pymongo unidecode spacy wordcloud
RUN python -m spacy download pt_core_news_sm
RUN pip install fastparquet
USER root
RUN apt-get update && apt-get install -y --no-install-recommends \
        gnupg \
        unixodbc \
        unixodbc-dev \
        && curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - \
        && curl https://packages.microsoft.com/config/debian/10/prod.list > /etc/apt/sources.list.d/mssql-release.list \
        && apt-get update \
        && ACCEPT_EULA=Y apt-get install -y --no-install-recommends msodbcsql17 \
        && apt-get clean \
        && rm -rf /var/lib/apt/lists/*
USER airflow
RUN pip install apache-airflow-providers-microsoft-mssql