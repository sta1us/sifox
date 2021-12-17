FROM centos

# install apps
RUN yum update -y 
RUN yum install -y sudo  openssh-server openssh-clients
# install our repo
ADD sta1us.repo /etc/yum.repos.d/sta1us.repo
# add user
RUN useradd sta1us
RUN echo 'sta1us:admin' | chpasswd
RUN echo "sta1us  ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
# ssh key
RUN mkdir -p /home/sta1us/.ssh 
RUN touch /home/sta1us/.ssh/known_hosts
ADD ssh_keys/id_rsa.pub /home/sta1us/.ssh/authorized_keys
RUN touch /home/sta1us/.ssh/environment
RUN chown -R sta1us /home/sta1us/.ssh/ 
RUN chmod 400 -R  /home/sta1us/.ssh/*
RUN chmod 700 -R  /home/sta1us/.ssh/known_hosts
RUN chmod 700  /home/sta1us/.ssh/environment
RUN chmod 600 /home/sta1us/.ssh/authorized_keys
RUN sed -i 's/UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config
RUN sed -i 's/RSAAuthentication no/RSAAuthentication yes/g' /etc/ssh/sshd_config
RUN ssh-keygen -q -N "" -t rsa -f /etc/ssh/ssh_host_rsa_key
# ports
EXPOSE  22

CMD ["sh","-c","/usr/sbin/sshd -D;sleep 1"]



