FROM alpine:3.7

RUN mkdir -p /nexus-data/data && \
    chown -R 200:200 /nexus-data && \    
    mkdir -p /var/jenkins_home && \
    chmod -R 777 /var/jenkins_home && \
    mkdir -p /root/.m2 && \        
    chmod g+rwx -R /root/.m2

