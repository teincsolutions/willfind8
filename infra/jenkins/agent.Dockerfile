# infra/jenkins/agent.Dockerfile

# Start from official Jenkins agent image (already includes Java + JNLP support)
FROM jenkins/inbound-agent:latest-jdk17

USER root

# Install Node.js 20 and npm
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install -y nodejs && \
    npm install -g npm && \
    npm cache clean --force

# Optional: clean up to reduce size
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

USER jenkins
