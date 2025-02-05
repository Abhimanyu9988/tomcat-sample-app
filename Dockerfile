# Pin to a known version so we have reproducibility & pass CIS checks
FROM tomcat:11.0.2-jdk17-temurin-jammy

# Optional: Switch to root only for installation, then drop privileges
USER root
RUN apt-get update -y && \
    apt-get install -y --no-install-recommends curl vim procps && \
    rm -rf /var/lib/apt/lists/*

# Create a non-root user (tomcat). It's often already there, but let's be explicit
RUN groupadd -r tomcat && useradd -r -g tomcat -d /usr/local/tomcat tomcat

# Switch to the Tomcat user
USER tomcat

# Set the working directory
WORKDIR /usr/local/tomcat

# Copy the WAR from the build context into Tomcat's webapps directory
COPY target/my-sample-app.war /usr/local/tomcat/webapps/

# Default command to run Tomcat
CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]

