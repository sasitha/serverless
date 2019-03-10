FROM ubuntu:18.04

# RUN adduser --system --shell /bin/bash --group --disabled-password --home /home/sls sls
# RUN usermod -aG sudo sls
# USER sls
# RUN grep sls /etc/passwd
# RUN usermod --shell /bin/bash sls
# RUN grep sls /etc/passwd
RUN apt-get update
RUN apt-get install -y software-properties-common vim
RUN add-apt-repository ppa:jonathonf/python-3.6
RUN apt-get update

RUN apt-get install -y build-essential python3.6 python3.6-dev python3-pip python3.6-venv
RUN apt-get install -y git

# update pip
RUN python3.6 -m pip install pip --upgrade
RUN python3.6 -m pip install wheel

RUN pip install awscli --upgrade --user

#RUN ln -s bash /bin/sh.bash
#RUN mv /bin/sh.bash /bin/sh
# installing node
RUN apt-get install curl -y
RUN curl -sL https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
ENV NVM_DIR=/root/.nvm
ENV SHIPPABLE_NODE_VERSION=v8.10
RUN . $HOME/.nvm/nvm.sh && nvm install $SHIPPABLE_NODE_VERSION && nvm alias default $SHIPPABLE_NODE_VERSION && nvm use default && \
 node -v && npm config set user 0 && npm config set unsafe-perm true && npm install -g serverless
#ENV PATH="/root/.local/bin:$PATH"
#CMD ["npm", "install -g serverless"]
#CMD ["serverless", "--version"]