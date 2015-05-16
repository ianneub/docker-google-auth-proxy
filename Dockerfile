FROM alpine

ENV GAP_VERSION 1.1.1
ENV GO_VERSION 1.4.2
ENV MD5_SUM cef17d55b5ea1c301d3713b4903dd980

ENV EMAIL_LIST **None**

RUN apk add --update-cache curl tar

RUN curl -sL https://github.com/bitly/google_auth_proxy/releases/download/v${GAP_VERSION}/google_auth_proxy-${GAP_VERSION}.linux-amd64.go${GO_VERSION}.tar.gz -o /google_auth_proxy.tar.gz
RUN echo "${MD5_SUM}  google_auth_proxy.tar.gz" > google_auth_proxy.md5
RUN md5sum -c google_auth_proxy.md5
RUN tar --strip-components=1 -zxf google_auth_proxy.tar.gz

COPY run.sh /run.sh

ENTRYPOINT ["/run.sh"]
CMD ["-help"]
