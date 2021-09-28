FROM alpine
COPY . .
WORKDIR /
ARG pass
RUN apk update && apk add openssh-server && apk add openrc && \
	ssh-keygen -A && \
	adduser --disabled-password izaitsev && echo -e "$pass\n$pass\n" | passwd izaitsev && \
	mkdir /home/izaitsev/.ssh && chown izaitsev:izaitsev /home/izaitsev/.ssh && chmod 700 /home/izaitsev/.ssh && \
	cat /id_rsa.pub >> /home/izaitsev/.ssh/authorized_keys && chmod 0600 /home/izaitsev/.ssh/authorized_keys && chown izaitsev:izaitsev /home/izaitsev/.ssh/authorized_keys && \
	cp /id_rsa.pub /home/izaitsev/.ssh/ && chmod 600 /home/izaitsev/.ssh/id_rsa.pub && chown izaitsev:izaitsev /home/izaitsev/.ssh/id_rsa.pub && \
	echo "PasswordAuthentication no" >> /etc/ssh/sshd_config && \
	echo "PermitRootLogin yes" >> /etc/ssh/sshd_config && \
	echo "PubkeyAuthentication yes" >> /etc/ssh/sshd_config && \
	touch /password && echo $pass > /password
ENTRYPOINT /usr/sbin/sshd && /bin/ash
