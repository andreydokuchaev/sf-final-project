FROM python:3.11.3-bullseye
RUN apt update
RUN apt install -y p7zip-full
RUN pip install wheel setuptools pip --upgrade
RUN mkdir -p /usr/src/app/model
WORKDIR /usr/src/app
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
COPY model/model.7z ./model/
RUN 7z e model/model.7z -omodel/
COPY server.py ./
EXPOSE 5000
CMD [ "python", "server.py" ]