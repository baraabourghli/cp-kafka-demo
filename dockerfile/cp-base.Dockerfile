FROM mlaccetti/docker-oracle-java8-ubuntu-16.04
MAINTAINER nicholedean

# Install confluent to /opt
COPY confluent-3.1.2 /opt/confluent-3.1.2
RUN ln -s confluent-3.1.2 /opt/confluent

CMD /bin/bash