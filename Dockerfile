FROM gcr.io/tensorflow/tensorflow:latest-devel-py3

RUN apt-get update \
  && apt-get install -y openssh-server \
  && mkdir /var/run/sshd \
  && echo 'root:root' | chpasswd \
  && sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# For emacs tramp mode
EXPOSE 22

WORKDIR /app
COPY . .

CMD /usr/sbin/sshd ; /run_jupyter.sh --allow-root
