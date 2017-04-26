FROM ubuntu:16.04

MAINTAINER Glenn Tamkin

RUN apt-get update && apt-get install -y iputils-ping vim openjdk-8-jdk
#RUN mkdir /home/root/hw
#RUN mkdir /home/root/hw/bin
#ENV OUTHOME ${HOME}
ENV OUTUSER ${USER:-unk}
ARG stuff=whadup?

COPY src /home/root/hw/src
WORKDIR /home/root/hw
RUN mkdir bin
RUN javac -d bin src/HelloGlenn.java

ENTRYPOINT ["java", "-cp", "bin", "HelloGlenn"]

#CMD ["ping", "127.0.0.1", "-c", "30"]
#CMD ["127.0.0.1"]
#ENTRYPOINT ["ping", "-c", "3"]

