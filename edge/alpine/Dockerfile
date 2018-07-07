FROM golang:1.10.3-alpine3.7 AS build

ARG MANAEL_REF_SHA1=5e3effb361a062ad0f4f21e1a0cf0e61b96bb339

WORKDIR /go/src/manael.org/x/

RUN set -ex \
	&& apk --update-cache add --virtual .build-deps \
		gcc \
		git \
		libwebp-dev \
		musl-dev \
	&& mkdir -p /tmp/src \
	&& wget -O manael.tar.gz https://github.com/manaelproxy/manael/archive/$MANAEL_REF_SHA1.tar.gz \
	&& tar -xzf manael.tar.gz -C /tmp/src \
	&& rm manael.tar.gz \
	&& mv /tmp/src/manael-${MANAEL_REF_SHA1} /go/src/manael.org/x/manael \
	&& cd ./manael \
	&& go get -v ./... \
	&& go install -ldflags '-s -w'

FROM alpine:3.7

COPY --from=build /go/bin/manael /usr/local/bin/manael

RUN set -ex \
	&& apk --update-cache add ca-certificates libwebp

CMD ["manael"]
