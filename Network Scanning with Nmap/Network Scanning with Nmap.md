# 🔎 Nmap Network Scanning 

## 🎯 Objective

Use **Nmap (Network Mapper)** to perform basic network reconnaissance, identify open ports and running services, detect the target operating system, and document the security implications of the findings.

> ⚠️ **Ethical Use:** Only scanned systems that only belong to me to test. 


## 🚨🎯What is Nmap?

Nmap (Network Mapper) is a free, open-source tool used for network discovery and security auditing. It sends raw IP packets to a network to find active devices, see what services and software versions they run, detect operating systems, and check for security flaws or open ports. This tool can be used by attackers for reconnaissance.

## 🔏Why is it important?

Network scanning helps security professionals understand what is exposed on a network.

It can help identify:

- Unexpected open ports  
- Unnecessary services  
- Outdated software  
- Potential attack surfaces  
- Misconfigured systems  

It is important to understand the attack surface, this will allow administrators to reduce unnecessary exposure and improve security controls and configurations.

<br>

## 📕Ethical use guidelines:

I understand that network scanning should be responsible and used appropiately. Network scanning is not explicitly illegal by itself but it can be if acted upon on the very systems. Hence it is advisable to:

- Scan systems I own      
- Scan systems where I have explicit authorization  
- Use isolated lab environments for practice    
- Document your activities     
- Protect information discovered during testing 


## 🛠️ Tools & Technologies

- **Nmap**
- **Kali Linux / Windows**
- **Bash Terminal**
- **Vs Code**
- **GitHub**

## ⚙️Nmap Set-up/Installation

Kali Linux came pre-installed with Nmap 

But with normal installation :  

`sudo apt update ` 

`sudo apt install nmap `

## My Target

I'm going to be using my Windows 11 as a target for this task. It has a ip address of:

`192.168.18.218 `


## 🔍 Basic Nmap Scan

`nmap [target IP]`

<img src="Screenshoots\basic.png" alt="My Image" style="width: 80%; height: auto;">
 
<br> 

**Purpose**

A basic Nmap scan identifies commonly used TCP ports and reports whether they are:

- Open  
- Closed  
- Filtered

## ℹ️Service Version Scan

`nmap -sV [target IP] `

<img src="Screenshoots\service.png" alt="My Image" style="width: 80%; height: auto;">

<br>
 
**The -sV flag attempts to determine:**

- The service that is running on the port  
- The application name  
- The service version  


## 🖥️Operating System Scan 

`sudo nmap -O [target IP] `

<img src="Screenshoots\operating.png" alt="My Image" style="width: 80%; height: auto;">  

  
  <br>

The -O flag attempts to identify the operating system of the target based on characteristics of its network responses.  

<br>

| PORT | STATE | SERVICE | What the service does | Security Risk |
|---|---|---|---|---|
| 135/tcp | open | msrpc | **Microsoft RPC (Remote Procedure Call)** allows Windows systems and applications to communicate with remote services and perform network-based operations. | **Medium–High:** Can expose Windows RPC services to remote attacks if not properly secured or patched. |
| 139/tcp | open | netbios-ssn | **NetBIOS Session Service** supports older Windows file and printer sharing and network communication. | **Medium–High:** Can expose information about the system and network and may be abused for unauthorized access or enumeration. |
| 445/tcp | open | microsoft-ds | **SMB (Server Message Block)** is used for Windows file and printer sharing, as well as other network resources. | **High:** A common target for attackers. Vulnerable SMB configurations can allow unauthorized access, data theft, or remote code execution. |
| 3306/tcp | open | mysql | **MySQL** is a database service that allows applications and users to store, retrieve, and manage data. | **Medium–High:** Exposing MySQL directly to a network can allow brute-force attacks or exploitation of vulnerable configurations and software. |

### 🕵️‍♂️📄Security Assessment

The most significant security concerns are **TCP 445 (SMB)** and **TCP 135 (RPC)** because they are commonly associated with Windows network attacks. **TCP 3306 (MySQL)** should generally not be publicly exposed unless there is a specific requirement and strong access controls are in place.

<br>

___





















