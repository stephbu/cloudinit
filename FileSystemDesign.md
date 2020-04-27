# File System Design

## Why?
There are a number of artifacts that I want to persist outside of each container - enabling easy editing, long-term storage, and backup, sharing of artifacts across containers.

## What?
These include:

1. AWS Secrets. Secrets used to update AWS Route53
2. Certificates. Mounting certificates in a single point on the persistent storage enables services to share the certificates.
3. Storage for LDAP
4. Service Logging - console output from services running on the machine.
5. Storage for Prometheus
6. Local Storage for Code Server

Each of these artifacts will be mapped into one or more systems and services through volume mounts in each container.


## AWS Secrets


## Certificates
Let's encrypt CertBot should mount and map
```/etc/ssl/certs``` and ```/etc/ssl/private``` for read/write.

## LDAP Storage