FROM buts26/terraform-docker AS tf-bundle

WORKDIR /tf
COPY ./bundle.hcl .
RUN apk add bash curl git openssl jq openssh && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/*
RUN terraform-bundle package -os=linux -arch=amd64 ./bundle.hcl && unzip -x *.zip && rm -f *.zip
RUN addgroup -g 1000 terraform && adduser -u 1000 -G terraform -D -h /tf/ -H terraform && chown -R terraform:terraform /tf && chmod 755 /tf
