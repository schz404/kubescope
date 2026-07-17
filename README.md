# Forensic Analysis of Distroless Kubernetes Workloads

## Overview
This repository contains the Proof of Concept (PoC) for my Master's Thesis titled: **"Using ephemeral containers (debug containers) for troubleshooting."** 

The project investigates the challenge of debugging and performing incident response on distroless container images—which lack standard shells and debugging utilities—without compromising the live state of the production environment.

## Architecture
This PoC utilizes:
1.  **Victim Workload:** A minimal, distroless Go application.
2.  **Forensic Agent:** A custom-built, hardened debug image (`kube-scope`) containing industry-standard tools like `strace`, `tshark`, `lsof`, and `gdb`.
3.  **Namespace Sharing:** Leveraging the Kubernetes `kubectl debug --target` mechanism to achieve cross-container process inspection.

## Quick Start

### 1. Build the Forensic Tool
We use a `Makefile` to automate the build and deployment process.
```bash
make build
