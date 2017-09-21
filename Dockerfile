FROM alpine

ENV GAP_VERSION 2.2
ENV GO_VERSION 1.8.1
ENV MD5_SUM 654afe667c0ad6074330710c5d8b7b22

ENV EMAIL_LIST **None**

RUN apk add --update-cache curl tar

RUN curl -sL https://github.com/bitly/oauth2_proxy/releases/download/v${GAP_VERSION}/oauth2_proxy-${GAP_VERSION}.linux-amd64.go${GO_VERSION}.tar.gz -o /google_auth_proxy.tar.gz
RUN echo "${MD5_SUM}  google_auth_proxy.tar.gz" > google_auth_proxy.md5
RUN md5sum google_auth_proxy.tar.gz
RUN md5sum -c google_auth_proxy.md5
RUN tar --strip-components=1 -zxf google_auth_proxy.tar.gz

COPY run.sh /run.sh

ENTRYPOINT ["/run.sh"]
CMD ["-help"]
