FROM  jenkinsci/blueocean:1.4.2

ENV JAVA_OPTS "-Djenkins.install.runSetupWizard=false"

COPY maven-installer.groovy /usr/share/jenkins/ref/init.groovy.d/

COPY set-git-global-config.groovy /usr/share/jenkins/ref/init.groovy.d/

COPY criacao-jobs.groovy /usr/share/jenkins/ref/init.groovy.d/

COPY criacao-jobs-pipeline.groovy /usr/share/jenkins/ref/init.groovy.d/

COPY jobs.groovy /usr/share/jenkins/ref/

COPY jobs-pipeline.groovy /usr/share/jenkins/ref/

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt

RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt && \
    echo 2.0 > /usr/share/jenkins/ref/jenkins.install.UpgradeWizard.state

EXPOSE 8082
