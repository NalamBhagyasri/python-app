FROM alpine:3.19.0

RUN apk add python3

copy requirements.txt .

RUN apk --update add py-pip

RUN pip3 install -r requirements.txt --break-system-packages

COPY app.py .

EXPOSE 5000

ENTRYPOINT ["python3","app.py"]
