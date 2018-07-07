FROM debian:testing-slim

RUN export DEBIAN_FRONTEND=noninteractive && apt-get update && apt-get install -q -y --no-install-recommends sslh

ENTRYPOINT ["sslh", "-v", "-f"]
CMD []

