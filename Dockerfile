FROM debian
COPY . .
WORKDIR /
RUN apt update && apt -y install openssh-server && apt -y install vim
RUN mkdir -p /root/.ssh
ADD id_rsa /root/.ssh/id_rsa
RUN chmod 700 /root/.ssh/id_rsa
RUN touch /root/.ssh/config
CMD [ "echo "Host $(/sbin/ip route|awk '/default/ { print $3 }')\n\tStrictHostKeyChecking no\n" >> /root/.ssh/config" ]
