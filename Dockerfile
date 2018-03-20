FROM gcr.io/tensorflow/tensorflow:latest-devel-py3

WORKDIR /app
COPY . .

CMD ["ipython", "src/runner.py"]
