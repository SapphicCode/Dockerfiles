FROM debian:testing-slim

RUN apt-get update && apt-get install -y sslh

ENTRYPOINT ["sslh", "-v", "-f"]
CMD []

