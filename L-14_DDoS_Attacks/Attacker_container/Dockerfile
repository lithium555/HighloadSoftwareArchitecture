
FROM kalilinux/kali-rolling

RUN apt update && \
    apt install hping3 fping slowhttptest siege -y && \
    mkdir /attacks

WORKDIR /attacks

COPY ./http-flood.sh /attacks/
COPY ./icmp-flood.sh /attacks/
COPY ./ping-of-death.sh /attacks/
COPY ./slowloris.sh /attacks/
COPY ./syn-flood.sh /attacks/
COPY ./udp-flood.sh /attacks/

COPY ./set-env-variables.sh /attacks/