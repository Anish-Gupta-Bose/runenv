FROM ubuntu:19.10

ENV LC_ALL="C.UTF-8" LANG="C.UTF-8"
ARG TF_VER=0.11.14 
ARG PK_VER=1.5.1


COPY ./requirements.txt /requirements.txt

RUN apt update \
    && apt install -y build-essential python3 python3-pip git wget zip \
    && pip3 install -r requirements.txt \
    && echo "alias python=python3" >> /root/.bashrc

RUN wget -O /tmp/terraform.zip https://releases.hashicorp.com/terraform/$TF_VER/terraform_${TF_VER}_linux_amd64.zip \
    && unzip /tmp/terraform.zip \
    && chmod +x terraform \
    && mv terraform /usr/bin \
    && rm -f /tmp/terraform.zip

RUN wget -O /tmp/packer.zip https://releases.hashicorp.com/packer/$PK_VER/packer_${PK_VER}_linux_amd64.zip \
    && unzip /tmp/packer.zip \
    && chmod +x packer \
    && mv packer /usr/bin \
    && rm -f /tmp/packer.zip

ENTRYPOINT [ "/bin/bash" ]