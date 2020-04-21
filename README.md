# CloudInit Project

## Overview
This project is the configuration tracking for the rebuild of my home automation using a cheap Intel fanless quad-core machine.

## Objective

Run a number of systems to support my home network:
1) Authenticate Wifi users, and assign network addresses, name resolution configuration etc. 
2) Run a copy of the DNS root servers to improve performance and reduce network snooping
3) Run a DNS blacklister for common adware, malware etc.
4) Enable code development on my IP through the Code Server project.
5) Learn more about the state-of-the-art container OS's currently being developed.

## Tasks

To achieve the objectives, I've set out to build a configured machine that looks like:
- RancherOS - container OS
- PiHole - DNS Blacklisting System.
- Unbound - Root DNS Lookup Service.
- OpenVPN - VPN breakout.
- FreeRADIUS - RADIUS, LDAP Daemon.
- Code Server - Visual Studio Code in a browser.