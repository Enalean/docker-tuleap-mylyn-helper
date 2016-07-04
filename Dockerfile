FROM alpine:3.4

RUN echo '@testing http://dl-cdn.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories
RUN apk add --no-cache maven@testing x11vnc@testing xvfb gtk+

RUN mkdir ~/.vnc \
        && x11vnc -storepasswd 1234 ~/.vnc/passwd

COPY run.sh /run.sh

VOLUME ["/tuleap-mylyn-src"]
ENTRYPOINT ["/run.sh"]
CMD ["--test"]
