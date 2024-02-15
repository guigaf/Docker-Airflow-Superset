FROM apache/superset:3.1.0
USER root
RUN pip install --upgrade pip
RUN pip install psycopg2-binary
# COPY ./superset_mount_files/a.ico /app/superset/static/assets/images/favicon.ico
# COPY ./superset_mount_files/logo-footer.png /app/superset/static/assets/images/superset-logo-horiz.png
COPY ./docker/config.py /app/superset/config.py
ENV SUPERSET_SECRET_KEY=qwertyuioplkjhgfdsazxcvbnm
ENV SUPERSET_ENV=production
ENV SUPERSET_LOAD_EXAMPLES=no
ENV CYPRESS_CONFIG=false
ENV FLASK_APP=superset
USER superset