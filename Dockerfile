FROM python:3.8-slim-buster

RUN apt-get update && apt-get install -y --no-install-recommends apt-utils

# Add debugging output
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    unzip \
    ca-certificates \
    gnupg \
    lsb-release || cat /var/log/apt/term.log

WORKDIR /app
