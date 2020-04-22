FROM alpine:latest
RUN apk update
RUN set -x \
  && adduser -u 1000 -g 1000 -D azureuser

RUN apk -v --update --no-cache add \
  chromium \
  npm \
  freetype \
  freetype-dev \
  harfbuzz \
  ca-certificates \
  ttf-freefont \
  nodejs \
  yarn \
  curl

ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true \
    PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser
RUN yarn add puppeteer@1.19.0
RUN rm -rvf /var/cache/apk/*
RUN npm install -g aws-azure-login --unsafe-perm
RUN curl -o /usr/local/bin/aws-iam-authenticator https://amazon-eks.s3.us-west-2.amazonaws.com/1.15.10/2020-02-22/bin/linux/amd64/aws-iam-authenticator
RUN chmod +x /usr/local/bin/aws-iam-authenticator

USER azureuser
WORKDIR /home/azureuser

COPY ./entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
