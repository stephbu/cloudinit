# CloudInit Project

## Overview
This project is the configuration tracking for the rebuild of my home automation using a cheap Intel fanless quad-core machine.




## Objective

Run a number of systems to support my home network:
1) Authenticate Wifi users, and assign network addresses, name resolution configuration etc. 
2) Run a copy of the DNS root servers to improve performance and reduce network snooping
3) Run a DNS blacklister for common adware, malware etc.
4) Enable code development on my IPad through the Code Server project.
5) Secure the platform using industry-standard x509 mTLS certs
6) Learn more about the state-of-the-art container OS's currently being developed.

## Tasks

To achieve the objectives, I've set out to build a configured machine as follows:
1. [x] stephbu.org Domain Name hosted in AWS Route 53 ([Creating Domains](CreatingDomains.md))
2. [ ] K3OS - container OS
3. [ ] LetsEncrypt TLS - Certbot to get TLS certificates bound to stephbu.org
3. [ ] File System Design ([File System Design](FileSystemDesign.md)) 
4. [ ] OpenLDAP - user profiles source
5. [ ] FreeRADIUS - DHCP, RADIUS, LDAP Daemon.
6. [ ] Nginx Web Proxy - TLS offload for Pihole, Code Server etc.
7. [ ] PiHole - DNS Blacklisting System.
8. [ ] Unbound - Root DNS Lookup Service.
9. [ ] OpenVPN - VPN breakout
10. [ ] R53 Update Service - Route 53 Dynamic DNS Updater
11. [ ] Prometheus - Monitoring/alerting for VPN, LDAP, Wifi etc.
12. [ ] Code Server - Visual Studio Code in a browser.



## Journal

##### Tuesday April 21
- while investigating tasks around Flatcar vs. RancherOS, and the cloud-init to ignition mess discovered [k3os](https://k3os.io)  While I originally intended to express the complex interplay between applications through pure Docker/volume mounts etc. This seems attractive if it is light enough.
- investigating certbot and LetsEncrypt, figure I need to actually think about persistent storage on the underlying host more deliberately, created a task dedicated to that.
- registered stephbu.org, went looking for a decent DynDNS replacement for R53 found https://github.com/crazy-max/ddns-route53/
- reading the K3os quickstart, figure I'll model this first in a VM to get a feel for the cloud-init required to bootstrap it.  https://github.com/rancher/k3os#quick-start
- really slick feature of RancherOS's cloud-init is the "use a github account's accepted public keys for SSH" e.g. my accepted public keys.  https://github.com/stephbu.keys

##### Sunday April 26
- Bought a Kodlix GD41, and waited for that to arrive from Amazon.  Turned out to be a lemon, trouble getting a stable 4K video stream, and SATA not working.  
- I ordered a Zotac CI660 Nano instead.  After a hiatus waiting for my Zotac PC.  I've restarted my quest, using K3OS.
- Installed 16Gb of RAM, and a Samsung EVO-860 256gb SSD.  Blazingly fast.  
- First I tried v0.10, with no success at getting a good working image.  USB LiveCD Install failed, I even burned a LiveCD for the first time in possibly a decade - took a while to even find my portable CD and some CD-Rs.
- Went back to v0.9, working better. LiveCD installed like a charm.  Switched back to writing cloud-init configurations.
- The Zotac CI660 is absolutely silent.
- Need to write cloud-init FSTAB config to move /var/logs etc. to TMPFS
- Starting to customize and write workload declarations for Kubernetes.

##### Monday April 27
- Researching the best way to share volumes between Kubernetes pod instances, as well as the best way to store data from pods.  While the old-school for this single-node approach would be just mount volumes in the pod description, I'm interested in using Persistent Volumes, so I'm going to take that approach instead.
- Probably the worst thing working with Kubernetes features is the number of stale examples and documents. Persistent volumes have gone through loads of revisions, and most of the syntax has changed.

##### Thursday April 30
- Getting my developer console set up.  Went looking for the generate static credentials for K3os.  It's hidden pretty well, but K3os installs its kubeconfig in ```/etc/rancher/k3s/k3s.yaml```
- Installed VSCode extensions for issues and Kubernetes.  The Kube extension is actually pretty neat once you figure out that you need to set the server/namespace context in the experience.

##### Friday May 1
- Got PiHole Pod, and configuration checked in.  
    - Persistent volumes for storage pi-hole and DNSMasq. 
    - Secrets for passwords.
    - Load-Balancer to punch the DNS into the host network.
    - Initial goal is deprecate my RPi4 running Unbound and PiHole, then grab back a network port and cable.
- Created a static DHCP address for my server to enable me to start using DNS to address it.  Starting to think about TLS certificates and other infrastructure that really needs DNS to function effectively.
- Created internal and external DNS zones in AWS, 
    - A rec's for the base server internal and external addresses, to be CNAMEd for various services.  Simplifies managing my server and points of presence - just two records to update, as well as giving me the option to split services later on.
    - To be followed by CNAMEs for various services
    - DNS Zone design here [TODO]

##### Tuesday May 5
- Created ingress controllers 
    - Code Server into ```code.internal.stephbu.org```
    - PiHole into  ```pihole.internal.stephbu.org```
- Small reorganization of storageClass, pv, pvc, pod, svc, ingress into single files.
- Started work on AWS credentials, and automatic DNS Updater.
- fixed up code-server persistent volume to UID1000 (```sudo chown 1000 /opt/project```)