# Ephemeral container: forensic container with custom analysis tools
# Meant to be injected inside a compromised distroless Pod

FROM debian:12-slim
ENV DEBIAN_FRONTEND=noninteractive

# Install essential DFIR and diagnostic utilities
RUN apt-get update && apt-get install -y --no-install-recommends \
    procps \
    lsof \
    net-tools \
    iproute2 \
    iputils-ping \
    strace \
    gdb \
    htop \
    tree \
    file \
    tcpdump \
    tshark \
    e2fsprogs \
    util-linux \
    && rm -rf /var/lib/apt/lists/*

# Default command to start a shell
CMD ["/bin/bash"]
