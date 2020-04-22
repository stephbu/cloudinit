# Creating A Domain

## Why?
I want to use SSL to secure interactions with my domain server.  I could have used self-signed certificates, but that would require installation of certificate chains on all devices that needed to interact with the network, sites and services.

# Approach
I've opted to register a public domain ```stephbu.org``` in AWS, here I'll host domain names and CNAMEs to enable segmentation of the services, with a view to perhaps dividing them out into distinct servers in the future.

Registration of domain names is really easy, [AWS Registrar](https://registrar.amazon.com) charges $12/year for .org addresses.  I'll also run a simple service to update my public DNS records with my dynamically allocated ISP IP address, enabling me to run inbound VPN connections.