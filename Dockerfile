ARG LINUXSERVER_TVHEADEND_VERSION=latest

FROM linuxserver/tvheadend:amd64-${LINUXSERVER_TVHEADEND_VERSION}

ARG LINUXSERVER_TVHEADEND_VERSION
ARG TV_GRAB_FR_TELERAMA_VERSION=master

RUN \
	apk add --no-cache perl-digest-hmac perl-lwp-protocol-https \
	&& cd /usr/bin \
	&& wget -q https://raw.githubusercontent.com/zubrick/tv_grab_fr_telerama/${TV_GRAB_FR_TELERAMA_VERSION}/tv_grab_fr_telerama \
	&& chmod 755 tv_grab_fr_telerama

COPY /fr-Mulhouse /usr/share/tvheadend/data/dvb-scan/dvb-t/

RUN wget -q https://upload.wikimedia.org/wikipedia/fr/d/dc/Alsace_20_logo_2017.png -O /picons/alsace20.png
