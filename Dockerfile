FROM ubuntu-debootstrap:14.04.2
ADD ZeusTM_100r1_Linux-x86_64.tgz /tmp/
COPY zinstall.txt /tmp/
RUN /tmp/Zeus*/zinstall --replay-from=/tmp/zinstall.txt --noninteractive
RUN rm -rf /tmp/*
COPY zconfig.txt /usr/local/zeus/
COPY runzeus.sh /usr/local/zeus/
ENV ZEUS_EULA=
ENV ZEUS_LIC=
ENV ZEUS_PASS=RANDOM
ENV ZEUS_DOM=
CMD [ "/usr/local/zeus/runzeus.sh" ]
EXPOSE 9070 9080 9090 80 443

