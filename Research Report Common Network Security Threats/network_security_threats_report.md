# 🚨 **Network Security Threats Report**


## *Introduction*
<p style="font-family: Arial, sans-serif;">

Network security threats are now a major concern for people, companies, and organizations all over the world in today's increasingly interconnected digital environment. Threat actors actively take advantage of network vulnerabilities to obtain unauthorized access, steal confidential data, disrupt critical services, and damage a company's reputation along with financial loss. The potential attack surface for organizations has increased due to the growing use of cloud services, remote work, mobile devices, and integrated systems. Therefore, protecting important business operations, securinng critical data, and guaranteeing the confidentiality, integrity, and availability of vital systems is dependant on cybersecurity professionals to have knowledge of common network security threats and putting effective security measures in place. In this report we'll be looking at network threats such as DOS/DDOS attack, Man-in-The-Middle Attack, IP Spoofing and DNS Spoofing/Poisoning, we'll also see how these threats have an impact on organisations and what are some of the mitigations strategies we can perform to alleviate impact. 
</p>

Here are some of the network security threats we'll cover in this report:

## 🖥️⚡DOS/DDOS ATTACK

A Denial-of-Service (DoS) attack is when an attacker tries to make a system or service unavailable to legitimate users by overwhelming it with traffic or requests that it cannot handle.
A Distributed Denial-of-Service (DDoS) attack works in a similar way, but the traffic comes from many different devices instead of just one. These devices are often part of a botnet, which is a network of compromised/infected computers or IoT devices controlled by an attacker.They use these bots to carry out attacks to mostly to disrupt services.

### 🌍Real world Example

**GitHub :February 2018**
A large DDoS attack in 2018 targeted GitHub — the popular online code management service used by millions of developers. This attack reached 1.3 Tbps, sending packets at a rate of 126.9 million per second.

The GitHub attack did not involve botnets. Instead it was a memcached DDoS attack: The attackers leveraged the amplification effect of a popular database caching system known as memcached. By flooding memcached servers with spoofed requests, the attackers were able to amplify their attack by a magnitude of about 50,000 times.

Luckily, GitHub was using a DDoS protection service, which was automatically alerted within 10 minutes of the start of the attack. This alert triggered the process of mitigation and GitHub was able to stop the attack quickly. The massive DDoS attack only lasted about 20 minutes.

Source:Cloudfare. (n.d.). https://www.cloudflare.com/learning/ddos/famous-ddos-attacks/

### ⚙️Impact

A successful DDoS attack can have treamendous consequences such as:

- Websites or applications may become unavailable.
- Customers may not be able to access online services.
- Businesses can lose revenue.
- IT teams may need to spend time responding to the attack.
- Organisations can suffer reputational damage.
- Critical services can be disrupted.

### 🔧Mitagations
1. Use content delivery networks (CDNs):
CDNs distribute traffic across multiple global servers, which helps absorb large traffic spikes and reduces the load on the origin server during an attack.

2. Implement traffic monitoring and alerting:
Network monitoring tools can detect unusual traffic patterns early. Alerts allow administrators to respond quickly before the attack causes major disruption.

3. Use rate limiting and traffic filtering:
Firewalls, load balancers, and web application firewalls can be configured to limit abnormal amounts of traffic and block suspicious requests.


## Ⓜ🕵️‍♂️💻Man In The Middle Attack(MiMT)

A Man-in-the-Middle (MiTM) attack is when an attacker secretly positions themselves between two devices that are communicating, without either side realising it. 
For example if a user is trying to access a website, as we know the connection should normally go directly between the user and the website but in a MiTM attack, the attacker intercepts this communication and acts as a middle point:

#### How does it work?

The attacker may be able to observe, copy, or even alter the material being delivered because all communication flows through them. This implies that private information, including login credentials and passwords, may be compromised.These attacks can occur through a variety of methods, including DNS manipulation, ARP spoofing on local networks, fake or unprotected Wi-Fi networks, and hacked network segments.

Some types of MiTM Attack :
-  ARP spoofing – the attacker spoofs the mapping of an IP address to a MAC address using the address resolution protocol (ARP) to redirect packets on a local network.
- IP spoofing (IP address spoofing) – the attacker transmits internet protocol packets that appear to originate from a different endpoint.
- DNS spoofing (DNS cache poisoning) – the attacker injects false information into DNS server caches, causing clients to connect to the domain of an attacker-controlled server instead of the original server.
- HTTPS spoofing (IDN homograph attack) – the attacker uses similar-looking digits and letters in a domain name delivered via phishing to make the client connect to a fake website controlled by the attacker.
- SSL hijacking – the attacker provides the victim’s web browser with a false certification authority (CA) and is able to generate fake SSL/TLS certificates that are recognized by the browser as legitimate.
- SSL stripping – the attacker forces the victim to drop an encrypted connection to a secure website and attempt an unsecured HTTP connection instead.

### 🌍Real world Example

**Lenovo Superfish: 2015**

In 2015, Lenovo was involved in a major security incident involving software called Superfish. The software was pre-installed on some Lenovo consumer laptops and used a trusted root certificate to intercept HTTPS traffic. This effectively placed the software between the user's browser and the websites they were visiting. The traffic could be decrypted, inspected, and then re-encrypted before being sent to its destination. The problem became much more serious when researchers discovered weaknesses in the certificate implementation that could allow attackers to perform their own MITM attacks. The incident demonstrated that encrypted HTTPS traffic is only as trustworthy as the certificate infrastructure used to verify it.

### ⚙️Impact

MITM attacks can lead to:

- Stolen usernames and passwords.
- Theft of session cookies.
- Exposure of private information.
- Manipulation of communications.
- Financial fraud.
- Unauthorised access to accounts.
- Phishing and malware delivery.

### 🔧Mitagations

1. Use HTTPS and TLS: Websites and applications should use properly configured HTTPS/TLS to encrypt communications between users and servers.
Sensitive services should never rely on unencrypted protocols such as port 80 were attackers can easily capture traffic.
2. Validate certificates:                                                                  Users and applications should not ignore certificate warnings.
Applications should properly validate certificates to make sure that the server they are communicating with is actually trusted.

3. Secure wireless networks:Organisations should use strong wireless security such as WPA2 or WPA3 and avoid connecting sensitive systems to unknown or suspicious Wi-Fi networks.
A VPN can also provide an additional layer of protection when using an untrusted network.


## 🛜 IP Spoofing

IP Spoofing is another type of Middle-in-the-Middle attack where an attacker changes the source IP address of a network packet so that it appears to come from another computer or network.For example, an attacker may send a packet that actually comes from their computer but make it appear as though it came from a trusted source. Attackers can use this to mimic or impersonate another devices logical address and then use it to for their own malicious intent. However IP spoofing doesnt necessarily give an attacker access to the system whose address they copied. The main purpose is usually to hide the true source of traffic or make malicious traffic appear more trustworthy.

### 🌍Real world Example

One early and well-known example involved Panix, an Internet service provider in New York.

In 1996, Panix was targeted by a TCP SYN flood attack. The attacker used spoofed source IP addresses as part of the attack.

The large number of connection requests caused the target system to use its available connection resources, making it difficult for legitimate users to connect.

The incident helped demonstrate how IP spoofing could be combined with denial-of-service techniques.

Source: Ferguson, P., & Senie, D. (2000). Network Ingress Filtering: Defeating Denial of Service Attacks which employ IP Source Address Spoofing. https://doi.org/10.17487/rfc2827


### ⚙️Impact


IP spoofing can be used to:

-  Hide the real source of malicious traffic.
- Support DoS attacks.
-  Perform reflection or amplification attacks.
-   Bypass weak IP-based access controls.
-   Make incident investigations more difficult.
-   Cause innocent systems to receive unwanted traffic.

### 🔧Mitagations

 1. Use network segmentation:
Dividing a network into smaller segments (subnets/VLANs) limits the spread of spoofed traffic and reduces the attack surface, making it easier to isolate and contain suspicious activity.

2.  Enable logging and real-time alerting:
Comprehensive logging of network traffic combined with real-time alerts helps administrators quickly detect anomalies such as duplicate IPs, unexpected geolocations, or abnormal connection patterns.

3. Use ingress and egress filtering:
Routers and firewalls can be configured to reject packets with source addresses that should not originate from a particular network.


## 🥧🚨 DNS SPOOFING/POISONING

 DNS spoofing, or DNS cache poisoning is a network attack that involves corrupting Domain Name.The name server returns an incorrect result record, such as an IP address, when system data is added to the DNS resolver's cache. As a result, traffic is redirected to the attacker's preferred computer. To put it simply, an attacker modifies the IP address linked to the domain name in the DNS server so that the device appears to be connected to the selected website but, in fact, it is routed to a different website.

### 🌍Real world Example

A notable example occurred in April 2018, when a major BGP routing hijack misdirected traffic intended for several large internet services, including Google, Cloudflare, and Amazon Web Services (AWS).

In this incident, incorrect BGP announcements from an upstream provider caused internet traffic to be routed through networks controlled by a third party. This created the potential for a man-in-the-middle scenario, where sensitive data could be intercepted or monitored as it passed through the misrouted infrastructure.

Although the hijack was relatively short-lived, it demonstrated how vulnerabilities in global routing infrastructure can expose large-scale services to interception risks.

Source: https://blog.cloudflare.com/how-verizon-and-a-bgp-optimizer-knocked-large-parts-of-the-internet-offline/


### ⚙️Impact

DNS poisoning can result in:

-   Users being redirected to fake websites.
-   Theft of usernames and passwords.
-   Phishing attacks.
-   Malware infections.
-   Financial losses.
-   Interception of traffic.
-   Loss of trust in online services.

### 🔧Mitagations



1. Use DNSSEC: DNS Security Extensions (DNSSEC) provide cryptographic verification for DNS records
This helps DNS resolvers determine whether DNS information has been modified or came from an unauthorised source.

2. Secure DNS infrastructure:
DNS servers should be regularly patched and securely configured.
Administrative access should also be restricted to authorised users.

3. Monitor DNS activity:
Security teams should monitor DNS requests and records for unusual changes.
Unexpected changes to DNS records, name servers, or IP addresses should be investigated.

## Comparison of Network Security Threats

| Threat | Attack Vector | Who Is at Risk? | Difficulty to Execute | Ease of Mitigation |
|---|---|---|---|---|
| **DoS/DDoS** | Flooding a server, network, or application with traffic | Websites, businesses, cloud services, online platforms | Medium to High | Medium |
| **MITM** | Intercepting communication between two parties | Users, businesses, Wi-Fi networks, applications | Medium to High | Medium to High |
| **IP Spoofing** | Forging the source IP address of network packets | Networks, servers, organisations, internet users | Medium | Medium |
| **DNS Poisoning/Spoofing** | Manipulating DNS responses or DNS infrastructure | Websites, businesses, DNS users, online services | Medium to High | Medium to High |    


<br>
<br>
 


---
<br>

In closing here are some important lessons that network administrators should keep in mind.  


1. Use multiple layers of security:
  No single security tool can protect a network from every type of attack. Firewalls, encryption, authentication, monitoring, IDS/IPS, DNS security, and access controls should all work together.

2. Monitor the network:
Preventing attacks is important, but administrators also need to know what is happening on their networks. Monitoring logs, DNS activity, network traffic, authentication attempts, and unusual behaviour can help identify attacks early.

3. Keep systems secure and up to date:
Regular patching, secure configurations, strong passwords, MFA, network segmentation, and proper access controls can significantly reduce the attack surface.


<br>

## REFERENCES

Cybersecurity and Infrastructure Security Agency (CISA).
Understanding and Responding to Distributed Denial-of-Service Attacks.
https://www.cisa.gov/

Cloudflare.
Cloudfare. (n.d.). https://www.cloudflare.com/learning/ddos/famous-ddos-attacks/

Cloudflare https://blog.cloudflare.com/how-verizon-and-a-bgp-optimizer-knocked-large-parts-of-the-internet-offline/

Lindemulder, G., & Kosinski, M. (2025, November 17). Man in the Middle. https://www.ibm.com/think/topics/man-in-the-middle


Lenovo Settles FTC Charges it Harmed Consumers With Preinstalled Software on its Laptops that Compromised Online Security. (2025, April 22). Federal Trade Commission. https://www.ftc.gov/news-events/news/press-releases/2017/09/lenovo-settles-ftc-charges-it-harmed-consumers-preinstalled-software-its-laptops-compromised-online?utm_source=chatgpt.com

Wikipedia contributors. (2026, February 21). DNS spoofing. Wikipedia. https://en.wikipedia.org/wiki/DNS_spoofing

Ferguson, P., & Senie, D. (2000). Network Ingress Filtering: Defeating Denial of Service Attacks which employ IP Source Address Spoofing. https://doi.org/10.17487/rfc2827

Man-in-the-Middle Attacks (MITM). (n.d.). https://www.invicti.com/learn/man-in-the-middle-attacks-mitm

Glossary | CSRC. (n.d.). https://csrc.nist.gov/glossary

<br>
<br>

---