# 🛜Network Traffic Analysis & Protocol Inspection

A hands-on network security project focused on capturing live network traffic, filtering for specific protocols (HTTP, DNS, TCP), inspecting raw packet payloads, and evaluating potential security risks associated with unencrypted data transfer.

---

## 🚨Technical Overview

* **Packet Sniffer/Analyzer:** Wireshark
* **Network Interface:** Virtual Machine Interface(eth0)
* **Protocols Inspected:** HTTP, DNS, TCP
* **Environment:** Tested on Kali Linux

---

## ⚙️🚧Setup & Installation

Wireshark came pre-installed on my Kali Linux machine
But common setup or installation would go as follows:

**Step 1: Update Package Lists**

```sudo apt update && sudo apt upgrade -y  ```

**Step 2: Install Wireshark**  

```sudo apt install wireshark -y  ```

**Step 3: Configure Non-Root Capture Permissions**
During installation, a prompt asks if non-superusers should be allowed to capture packets.  

 >Selecting Yes would be a better option. Running Wireshark with a root is not recommended as the software is massive, complex, and parses hundreds of untrusted network protocols. A single bug or memory flaw in a protocol dissector could allow malicious network traffic to execute code with full root system access. 

**Step 4: Add Your User to the Wireshark Group**  

Add your standard Kali username to the wireshark group so you can capture traffic without needing sudo every time:  

```sudo usermod -aG wireshark $USER  ```

<br>




## 🗄️📄 Protocol Analysis & Evidence

### 1. HTTP Traffic Filtering
* Display Filter applied: `http`
* *Findings:* Filtered active web browsing traffic to locate unencrypted GET/POST requests.

<img src="screenshots\httpnewpic.png" alt="My Image" style="width: 80%; height: auto;">

### 2. DNS Resolution Inspection
* Display Filter applied: `dns`
* *Findings:* Inspected UDP-based domain name queries and responses, identifying target domain names and resolved IP addresses.

<img src="screenshots\dnsnew.png" alt="My Image" style="width: 80%; height: auto;">

### 3. TCP 3-Way Handshake Analysis
* Display Filter applied: `tcp.flags.syn == 1 || (tcp.flags.syn == 1 && tcp.flags.ack == 1) || (tcp.flags.ack == 1 && tcp.flags.syn == 0)`
* *Handshake Sequence:*
  1. **SYN:** Client sends initial sequence number to request a connection.
  2. **SYN-ACK:** Server acknowledges request and responds with its own sequence number.
  3. **ACK:** Client acknowledges server response; connection established.

<img src="screenshots\tcpnew.png" alt="My Image" style="width: 80%; height: auto;">

---

## 🕵️‍♂️ Security Observations & Payload Inspection <!-- change name -->

### Cleartext Data Exposure
During the capture inspection of an HTTP request, the following  information was visible

```
The Cleartext Request:

GET /css/style.min.css HTTP/1.1
Host: www.httpforever.co.uk
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:140.0) Gecko/20100101 Firefox/140.0
Accept: text/css,*/*;q=0.1
Accept-Language: en-US,en;q=0.5
Accept-Encoding: gzip, deflate
Connection: keep-alive
Referer: http://www.httpforever.co.uk/
If-Modified-Since: Sat, 02 Nov 2019 18:55:59 GMT
If-None-Match: "1770888ec0ace39f8100fe29081761b8"
Priority: u=2

The Cleartext Response:

HTTP/1.1 304 Not Modified
Content-Type: text/css
X-GUploader-UploadID: AJjja9Z8LPnJLPPySh2JJwLhdLYR9YtxUcF93c9pXZ7qRvIvI4kcJW3Cwaw8tlgp4k7B07saznfHK1Y
Expires: Sun, 23 Aug 2026 11:02:17 GMT
Date: Sun, 23 Aug 2026 10:02:17 GMT
Cache-Control: public, max-age=3600
Last-Modified: Sat, 02 Nov 2019 18:55:59 GMT
ETag: "1770888ec0ace39f8100fe29081761b8"
Content-Length: 0
Server: UploadServer
```





<br> 

## The Risk of Unencrypted HTTP

**HTTP does not encrypt the information being sent between a user and a website.** This means that if someone is able to monitor the network, such as on an unsecured public Wi-Fi network, they may be able to see the data being transmitted.

An attacker could use packet capture tools to monitor this traffic and potentially obtain sensitive information such as **login details, session cookies, or personal information**. This is one of the reasons why using HTTPS is important, especially when entering sensitive information online.

## How HTTPS Helps Protect Data

**HTTPS** is the secure version of HTTP. It uses **TLS (Transport Layer Security)** to encrypt communication between the user and the website.

TLS provides several important security benefits:

- **Confidentiality:** The data sent between the user and the website is encrypted, making it difficult for someone monitoring the network to read it.
- **Integrity:** TLS helps make sure that the data has not been changed or tampered with while it is being transmitted.
- **Authentication:** Digital certificates help confirm that the user is communicating with the correct website rather than an attacker pretending to be that website.

Overall, HTTPS makes web communication much safer than standard HTTP by protecting data from being easily read or modified while it is travelling across a network.

---

## 📜 Glossary

- **Packet:** A small unit of data sent across a network. It contains information such as the source and destination addresses, along with the actual data being transmitted.

- **Protocol:** A set of rules that devices follow when communicating with each other over a network. Examples include HTTP, HTTPS, TCP, and DNS.

- **Port:** A number used to identify a specific service or application running on a device. For example, **port 80** is commonly used for HTTP, while **port 443** is commonly used for HTTPS.

- **Payload:** The actual data being carried inside a packet. This is the information being transmitted, separate from the headers used to deliver the packet.

- **Handshake:** The process where two devices or systems communicate with each other to establish a connection and agree on the settings they will use before exchanging data.


<br>

<br>


---
