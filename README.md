Sample Java Web Application
This repository contains a simple Java web application packaged as a WAR file, running on Apache Tomcat 11 (Java 17). We use Renovate to keep our Docker base image (and other dependencies) up to date automatically, and we rely on DockerHub Automated Builds to rebuild and publish the image whenever we merge changes.

Features
Minimal Java 17 WAR demonstrating a basic “Hello World” or JSP/Servlet setup.
Tomcat 11 pinned in Dockerfile for reproducible builds, automatically updated by Renovate when new patch versions are released.
DockerHub Automated Builds: This repo is linked to DockerHub, so each push (including merges from Renovate) triggers a new build, updating the DockerHub repository.
Simple performance testing instructions.

Generating Load (Performance Testing)
curl -v http://localhost:8080/sampletest/
