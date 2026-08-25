# Ephemeral container: forensic container with custom analysis tools
# Meant to be injected inside a compromised distroless Pod to perform a forensic analysis in a Kubernetes application

FROM debian:12-slim
ENV DEBIAN_FRONTEND=noninteractive

# Install utilities
RUN apt-get update && apt-get install -y --no-install-recommends \
    procps \
    lsof \
    iproute2 \
    iputils-ping \
    strace \
    htop \
    tree \
    file \
    jq \
    yara \
    curl \
    tcpdump \
    tshark \
    e2fsprogs \
    util-linux \
    && rm -rf /var/lib/apt/lists/*

CMD ["/bin/bash"]
