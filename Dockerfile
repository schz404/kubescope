# Ephemeral container: debugging container
# with custom forensic/ analysis tools
# Meant to be injected inside a compromised distroless compromised

# Built from a lightweight and slim distro
FROM debian:12-slim

# For the entrypoint .sh file:
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

# Installation of tools needed for analysis/ debugging
# **** (WILL CHANGE DEPENDING ON THE TOOLS NEEDED FOR THE ANALYSIS) ****
RUN apt-get update && apt-get install -y --no-install-recommends \
    # Network
    tcpdump tshark ngrep lsof net-tools iproute2 \
    # System & Process
    strace procps htop ltrace \
    # Binary & Analysis
    binutils gdb file \
    # Misc
    tree vim-tiny \
    && rm -rf /var/lib/apt/lists/*

# For security policy, setting a non-root user (comment this line if needed)
# USER 1000:1000

# Default command to start a shell
CMD ["/bin/bash"]
