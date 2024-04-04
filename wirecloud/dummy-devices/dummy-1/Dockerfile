FROM python:3.10
ADD . /code
COPY . /code
WORKDIR /code
RUN pip install -r requirements.txt
expose 8070
CMD [ "python", "-u", "app.py"]