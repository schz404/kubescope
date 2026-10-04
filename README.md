# Forensic Analysis of Distroless Kubernetes Workloads

## Overview
Kubescope is a forensic image containing multiple tools to perform forensic analysis inside a Kubernetes cluster, specifically for distroless images that lack a standard shell and debugging utilities. The forensic image can be injected as an ephemeral container using the `kubectl debug` command. The specific command can be found below in the Quick Start section.

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
kubectl debug -it <pod> --image=ghcr.io/schz404/kubescope:latest --target=<container> --profile=sysadmin
```

## Compatability
The forensic image has been tested and currently works on minikube (local) and Google Kubernetes Engine or GKE (cloud). The forensic toolkit should work on any other Kubernetes environment though, as ephemeral containers are native to Kubernetes. 

## Notes
The `profile` flag can be skipped, but some of the tools that require this flag may not be able to work properly if skipped.

Ephemeral containers can introduce vulnerabilities into a Kubernetes cluster. RBAC configuration for the specific `/ephemeralcontainers` subresource is recommended, as the use of ephemeral containers is allowed by default when creating a cluster. Make sure to configure and grant ephemeral containers privileges/permissions only to the roles/actors needed (e.g. security analyst role).

ALWAYS terminate the ephemeral container session (`exit`) after the analysis is concluded, as leaving it open not only defeats the purpose of using a distroless image, but also leaves the perfect attack vector to take advantage of, if ever found by an adversary.

This repository was created as a Proof of Concept (PoC) for my Master's Thesis titled: **"Using ephemeral containers (debug containers) for troubleshooting."** 
The project investigates the potential use of ephemeral containers not just for debugging, but also to perform incident response/ forensic analysis on distroless container images—which lack standard shells and debugging utilities—without compromising the live state of the production environment.
