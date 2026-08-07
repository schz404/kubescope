# Forensic Analysis of Distroless Kubernetes Workloads

## Overview
This repository contains the Proof of Concept (PoC) for my Master's Thesis titled: **"Using ephemeral containers (debug containers) for troubleshooting."** 

The project investigates the potential use of ephemeral containers not just for debugging, but also to perform incident response/ forensic analysis on distroless container images—which lack standard shells and debugging utilities—without compromising the live state of the production environment.

## Architecture
This PoC utilizes:
1.  **Victim Pod:** A minimal, distroless Go application.
2.  **Forensic Agent:** A custom-built, forensic image (`kubescope`) containing multiple tools (listed below).

## Tools installed in the forensic image
    procps
    lsof
    net-tools
    iproute2
    iputils-ping
    strace
    gdb
    htop
    tree
    file
    tcpdump
    tshark
    e2fsprogs
    util-linux

## Quick Start

```bash
make build
kubectl debug -it <pod> --image=ghcr.io/schz404/kubescope:latest --target=<container>
