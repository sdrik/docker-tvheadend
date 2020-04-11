FROM linuxserver/tvheadend

RUN \
	apk add --no-cache perl-digest-hmac perl-lwp-protocol-https \
	&& cd /usr/bin \
	&& wget -q https://raw.githubusercontent.com/zubrick/tv_grab_fr_telerama/master/tv_grab_fr_telerama \
	&& chmod 755 tv_grab_fr_telerama

COPY /fr-Mulhouse /usr/share/tvheadend/data/dvb-scan/dvb-t/

RUN wget -q https://upload.wikimedia.org/wikipedia/fr/d/dc/Alsace_20_logo_2017.png -O /picons/alsace20.png
