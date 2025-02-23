FROM ubuntu:latest

# Install Python 3.10, pip, and git
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    git

# Ensure Python 3.10 is used as default
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.10 1

# Upgrade pip to avoid potential issues
RUN python3 -m pip install --upgrade pip

# Install PyYAML using python3
RUN python3 -m pip install PyYAML

COPY feed.py /user/bin/feed.py

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]