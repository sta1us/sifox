FROM centos

RUN yum update -y
RUN yum install -y epel-release openssh-server openssh-clients sudo createrepo nano python3 pinentry
RUN yum install -y inotify-tools
RUN useradd sta1us
RUN echo 'sta1us:admin' | chpasswd
RUN echo "sta1us ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
RUN mkdir -p /home/sta1us/.ssh
RUN touch /home/sta1us/.ssh/known_hosts
ADD ssh_keys/id_rsa.pub /home/sta1us/.ssh/authorized_keys
RUN touch /home/sta1us/.ssh/environment
RUN chown -R sta1us /home/sta1us/.ssh/
RUN chmod 400 -R /home/sta1us/.ssh/*
RUN chmod 700 -R /home/sta1us/.ssh/known_hosts
RUN chmod 700 /home/sta1us/.ssh/environment
RUN chmod 600 /home/sta1us/.ssh/authorized_keys
RUN sed -i 's/UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config
RUN sed -i 's/RSAAuthentication no/RSAAuthentication yes/g' /etc/ssh/sshd_config
ADD start.sh /home/sta1us/start.sh
ADD update_repo.sh /home/sta1us/update_repo.sh
ADD inotify.sh /home/sta1us/inotify.sh
RUN chmod +x /home/sta1us/*.sh

RUN ssh-keygen -q -N "" -t rsa -f /etc/ssh/ssh_host_rsa_key

EXPOSE 22
EXPOSE 80

CMD ["/home/sta1us/start.sh"]
