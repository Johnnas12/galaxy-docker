FROM python:3.10-slim

# Set environment variables
ENV GALAXY_ROOT=/galaxy \
    GALAXY_CONFIG_FILE=/galaxy/config/galaxy.yml
ENV NODE_OPTIONS=--max-old-space-size=9216

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    gcc \
    make \
    g++ \
    curl \
    libpq-dev \
    libffi-dev \
    libssl-dev \
    libbz2-dev \
    liblzma-dev \
    && rm -rf /var/lib/apt/lists/*

# Create galaxy user
RUN useradd -ms /bin/bash galaxy

WORKDIR $GALAXY_ROOT

# Clone Galaxy
RUN git clone --depth 1 -b release_25.0 https://github.com/galaxyproject/galaxy.git /galaxy

# Give full permissions to Galaxy folder
RUN chown -R galaxy:galaxy $GALAXY_ROOT
RUN chown -R galaxy:galaxy /galaxy/database

# Copy custom config
COPY config/galaxy.yml $GALAXY_ROOT/config/galaxy.yml
RUN chown galaxy:galaxy $GALAXY_ROOT/config/galaxy.yml

# Switch to galaxy user
USER galaxy

EXPOSE 8080

CMD ["sh", "-c", "sh run.sh && tail -f /galaxy/database/gravity/log/*.log"]