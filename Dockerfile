FROM centos
RUN sudo apt-get update
RUN sudo apt-get install python
RUN pip install awscli --upgrade --user
ENV PATH="/root/.local/bin:$PATH"