FROM hasable/a3-exile:latest
LABEL maintainer='hasable'

# Server user
ARG USER_NAME=steamu

USER root

WORKDIR /opt/arma3
COPY resources/@ExileServer @ExileServer
COPY resources/@A3XAI @A3XAI
COPY resources/@AdvancedRappelling @AdvancedRappelling
COPY resources/@AdvancedServerScripts @AdvancedServerScripts
COPY resources/@AdminToolkitServer @AdminToolkitServer
COPY resources/@AdvancedTowing @AdvancedTowing
COPY resources/@AdvancedUrbanRappelling @AdvancedUrbanRappelling
COPY resources/@ExAd @ExAd
COPY resources/@ExileServer @ExileServer
COPY resources/mpmissions/* mpmissions/
COPY resources/keys/* keys/

RUN chown -R ${USER_NAME}:${USER_NAME} @* keys mpmissions

USER ${USER_NAME}

CMD ["\"-config=conf/exile.cfg\"", \
	"\"-servermod=@ExileServer;@A3XAI;@AdvancedTowing;@AdvancedServerScripts;@AdminToolkitServer;@ExAd\"", \
	"\"-mod=@Exile;expansion;heli;jets;mark\"", \
	"-bepath=/opt/arma3/battleye", \
		"-world=empty", \
		"-autoinit"]
