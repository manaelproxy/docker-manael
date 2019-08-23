FROM alpine:3.7

ARG MANAEL_VERSION=1.1.1

RUN set -ex \
	&& apk --update-cache add ca-certificates \
	&& mkdir -p /tmp/src/manael-v${MANAEL_VERSION} \
	&& cd /tmp/src \
	&& wget -O manael.tar.gz https://github.com/manaelproxy/manael/releases/download/v${MANAEL_VERSION}/manael_${MANAEL_VERSION}_Linux_x86_64.tar.gz \
	&& tar -xzf manael.tar.gz -C /tmp/src/manael-v${MANAEL_VERSION} \
	&& mv /tmp/src/manael-v${MANAEL_VERSION}/manael /usr/local/bin \
	&& cd \
	&& rm -rf /tmp/src

CMD ["manael"]
