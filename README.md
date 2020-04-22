# CloudInit Project

## Overview
This project is the configuration tracking for the rebuild of my home automation using a cheap Intel fanless quad-core machine.

## Objective

Run a number of systems to support my home network:
1) Authenticate Wifi users, and assign network addresses, name resolution configuration etc. 
2) Run a copy of the DNS root servers to improve performance and reduce network snooping
3) Run a DNS blacklister for common adware, malware etc.
4) Enable code development on my IPad through the Code Server project.
5) Learn more about the state-of-the-art container OS's currently being developed.

## Tasks

To achieve the objectives, I've set out to build a configured machine as follows:
1. stephbu.org Domain Name hosted in AWS Route 53 [Creating Domains](CreatingDomains.md)
2. RancherOS - container OS
3. LetsEncrypt TLS - SSL Certs bound to stephbu.org
4. OpenLDAP - user profiles source
5. FreeRADIUS - DHCP, RADIUS, LDAP Daemon.
6. Nginx Web Proxy - TLS offload for Pihole, Code Server etc.
7. PiHole - DNS Blacklisting System.
8. Unbound - Root DNS Lookup Service.
9. OpenVPN - VPN breakout
10. R53 Update Service - Route 53 Dynamic DNS Updater
11. Prometheus - Monitoring/alerting for VPN, LDAP, Wifi etc.
12. Code Server - Visual Studio Code in a browser.

