FROM ubuntu:latest

# Install required packages
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    git \
    && apt-get clean

# Ensure pip is up to date
RUN python3 -m pip install --upgrade pip

# Install PyYAML
RUN python3 -m pip install PyYAML

COPY feed.py /user/bin/feed.py

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]