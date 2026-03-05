FROM cassandra:latest

RUN apt-get update && apt-get install -y openssh-server iproute2 iputils-ping && \
    mkdir /var/run/sshd

RUN echo 'root:root' | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

EXPOSE 22 9042

CMD ["sh", "-c", "service ssh start && docker-entrypoint.sh cassandra -f -R"]