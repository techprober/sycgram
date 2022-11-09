ARG FUNCTION_DIR=/app

# =============================== #
FROM python:3.9-bullseye
LABEL maintainer=techprober@yqlbu

ARG FUNCTION_DIR

WORKDIR ${FUNCTION_DIR}

RUN mkdir -p {FUNCTION_DIR}/data

COPY requirements.txt .
RUN pip install -r requirements.txt --no-cache-dir

# Clean cache
RUN pip3 cache purge

# Copy source code
COPY . .

CMD ["python3", "main.py"]
