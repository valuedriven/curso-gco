FROM  jenkinsci/blueocean:1.4.2

ENV JAVA_OPTS "-Djenkins.install.runSetupWizard=false"

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt && \
    echo 2.0 > /usr/share/jenkins/ref/jenkins.install.UpgradeWizard.state

EXPOSE 8082


