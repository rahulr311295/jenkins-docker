FROM jenkins/jenkins:lts

ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"
USER root

RUN groupmod -g 1000 jenkins
RUN usermod -u 1000 -g 1000 jenkins
RUN chown -R 1000:1000 /var/jenkins_home

USER jenkins

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
COPY job1.xml /usr/share/jenkins/ref/jobs/job1/config.xml

VOLUME /var/jenkins_home
