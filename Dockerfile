# Use the official Jenkins LTS base image
FROM jenkins/jenkins:lts

# Switch to root to install Maven
USER root

# Update package lists and install Maven
RUN apt-get update && apt-get install -y maven

# Clean up apt cache for smaller image
RUN rm -rf /var/lib/apt/lists/*

# Switch back to the default Jenkins user
USER jenkins

# Optionally, set default Maven and JAVA_HOME environment variables
ENV MAVEN_HOME=/usr/share/maven \
    JAVA_HOME=/usr/local/openjdk-17

# (Optional) Pre-install common plugins or tools here
# COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
# RUN jenkins-plugin-cli --verbose --plugin-file /usr/share/jenkins/ref/plugins.txt

# The container will launch Jenkins by default
