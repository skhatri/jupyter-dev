FROM python:3.8.5

RUN pip install --upgrade pip && pip install setuptools psycopg2-binary sqlalchemy pyhive elasticsearch-dbapi ibm_db_sa jupyter pandas numpy sklearn scipy s3 graphviz jupyter_http_over_ws

RUN mkdir /root/.jupyter && echo '{"NotebookApp": {"nbserver_extensions": {"jupyter_http_over_ws": true},"password": "sha1:92cf1ff5134d:eecd093c46b3b5b98285ab0238ebe929e640b2a8"}}' |tee /root/.jupyter/jupyter_notebook_config.json

EXPOSE 8888

WORKDIR /opt/app

CMD ["jupyter", "notebook", "--notebook-dir=/opt/app", "--ip", "0.0.0.0", "--no-browser", "--allow-root"]


