FROM hashicorp/terraform AS tf-full
WORKDIR /go/src/github.com/hashicorp/terraform/tools/terraform-bundle
RUN go build

FROM alpine:latest AS tf-bundle
WORKDIR /tf
COPY ./bundle.hcl .
COPY --from=tf-full /go/src/github.com/hashicorp/terraform/tools/terraform-bundle/terraform-bundle ./
RUN apk add bash curl git openssl jq openssh && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/*
RUN ./terraform-bundle package -os=linux -arch=amd64 ./bundle.hcl && unzip -x *.zip && rm -f *.zip
RUN addgroup -g 1000 terraform && adduser -u 1000 -G terraform -D -h /tf/ -H terraform && chown -R terraform:terraform /tf && chmod 755 /tf
