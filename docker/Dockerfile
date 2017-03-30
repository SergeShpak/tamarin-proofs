FROM ubuntu:latest

RUN apt-get update && apt install -y openssh-server
RUN mkdir /var/run/sshd
RUN echo root:root | chpasswd
RUN touch /etc/ssh sshd_config
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' \
    /etc/ssh/sshd_config
RUN echo 'PermitTunnel yes' >> /etc/ssh/sshd_config

RUN sed 's@session/s*required/s*pam_loginuid.so@session optional \
    pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

RUN apt install -y make
RUN apt install -y graphviz
RUN apt install -y maude
RUN apt install -y curl
RUN curl -sSL https://get.haskellstack.org/ | sh
RUN apt install -y git
RUN git clone https://github.com/tamarin-prover/tamarin-prover.git
RUN cd tamarin-prover && make default

#ENV PATH "/root/.local/bin:$PATH"
RUN echo "PATH=/root/.local/bin:$PATH" >> /root/.profile

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
