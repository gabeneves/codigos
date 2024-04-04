FROM python:3.10
ADD . /code
COPY . /code
WORKDIR /code
RUN pip install -r requirements.txt
expose 8090
CMD [ "python", "-u", "app.py"]