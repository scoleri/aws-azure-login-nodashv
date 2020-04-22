FROM centos:7
RUN set -x \
  && groupadd -g 1000 cloudcustodian \
  && useradd -u 1000 -g 1000 cloudcustodian

RUN yum -y install epel-release
RUN yum -y install \
  chromium \
  python36-pip 

RUN pip3 install npm
RUN curl --silent --location https://rpm.nodesource.com/setup_8.x | bash -
RUN yum install -y yarn nodejs
RUN npm install -g aws-azure-login --unsafe-perm
RUN yum clean all
RUN mkdir -p /usr/local/bin
RUN curl -o /usr/local/bin/aws-iam-authenticator https://amazon-eks.s3-us-west-2.amazonaws.com/1.11.5/2018-12-06/bin/linux/amd64/aws-iam-authenticator
RUN chmod +x /usr/local/bin/aws-iam-authenticator

USER cloudcustodian
WORKDIR /home/cloudcustodian

COPY ./docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
