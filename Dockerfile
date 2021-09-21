FROM debian
COPY . .
WORKDIR /
RUN apt update && apt -y install openssh-server && apt -y install vim
RUN useradd -m izaitsev
RUN mkdir -p /home/izaitsev/.ssh
#RUN cp /id_rsa_pub /home/izaitsev/.ssh/
RUN chown -R izaitsev:izaitsev /home/izaitsev/.ssh
RUN echo "Host izaitsev\n\tStrictHostKeyChecking no\n" >> /home/izaitsev/.ssh/config
