ARG FRM='testdasi/pihole-dot-doh'
ARG TAG='latest'

FROM ${FRM}:${TAG}
ARG FRM
ARG TAG

ADD stuff /temp

ADD web /var/www/html/pihole

RUN /bin/bash /temp/install.sh && \
    rm -f /temp/install.sh  && \
    cp /temp/lighttpd.conf /etc/lighttpd/lighttpd.conf

VOLUME ["/config"]

RUN echo "$(date "+%d.%m.%Y %T") Built from ${FRM} with tag ${TAG}" >> /build_date.info
