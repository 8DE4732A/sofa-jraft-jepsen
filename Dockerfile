FROM ubuntu:18.04
LABEL Description="This image is used to test jepsen for jraft"
WORKDIR /root
RUN apt update && \
	apt install -y sudo && \
	apt install -y openssh-server && \
	apt install -y openjdk-8-jre && \
	apt install -y curl && \
	apt install -y iptables && \
	apt install -y gnuplot && \ 
	apt install -y psmisc
RUN	curl -O https://download.clojure.org/install/linux-install-1.10.1.727.sh &&\
	chmod +x linux-install-1.10.1.727.sh && \
	./linux-install-1.10.1.727.sh && \
	useradd -d /home/admin -g root -s /bin/bash -m admin && \
	echo "admin ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && \
	mkdir /home/admin/.ssh 
COPY --chown=admin:root authorized_keys /home/admin/.ssh/authorized_keys
COPY --chown=root:root id_rsa /root/.ssh/
COPY --chown=root:root id_rsa.pub /root/.ssh/
COPY sofa-jraft-jepsen-master/ /root/
COPY /bin /usr/bin
ENTRYPOINT service ssh start && \
	tail -f /var/log/dpkg.log
CMD ["bash"]
