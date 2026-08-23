# 🔥🚧Firewall Configuration with Uncomplicated Firewall(UFW)

## 💡OBJECTIVE

Set up and configure a basic firewall on a Linux system using UFW (Uncomplicated Firewall), applying rules to allow and deny specific types  of traffic.

## 🚨Technical Overview

* **Firewall:** Uncomplicated Firewall(UFW)
* **Protocol configured:** HTTP, HTTPS,SSH,TELNET,
* **Environment:** Kali Linux, Windows

<br>


---

<br>

## 🔥🧱What is a firewall?  
A firewall is physical device or software that controls incoming and outgoing network traffic based on predefined rules.  
 
Firewalls can be used to:

* Allow trusted network connections
* Block unwanted traffic
* Restrict access to specific ports
* Prevent unauthorized network connections
* Reduce the attack surface of a system
* Used as a layered defense mechanism

In our project we're going to configure UFW which stands for Uncomplicated Firewall and it is a Linux based firewall. 

## ⚙️🚧Setup & Installation

Update the package list:  

```sudo apt update ```

Install UFW:  
```sudo apt install ufw ```

Verify that UFW is installed:

```ufw version ```


## Best Practice before Configuring rules

Setting default rules that will deny incoming connections while allowing outgoing connections:

``` sudo ufw default deny incoming ```  

````sudo ufw default allow outgoing ````

The reason why we configure these default rules is to ensure there's no unwanted traffic coming into our workstation unless allowed to, but allowing outbound traffic so we're able to connect to services and perfrom normal network activities from the internet. Configuring default rules will make our configuration secure.


<br>

## 2️⃣2️⃣Allowing SSH 

**Allow SSH connections on port 22:**

``` sudo ufw allow ssh ```

OR

```sudo ufw allow 22/tcp ```

***RATIONALE***

We want administrators to be able to access and manage our machine remotly.
With this they're able to troubleshoot or configure network issues, see logs, and perform other important operational functions.

## 🔓🛜Blocking HTTP

**Block HTTP traffic on port 80:**

```sudo ufw deny http ```

OR:

```sudo ufw deny 80/tcp ```

<br>

***RATIONALE***  


Http is not secure because it transmits data as plain text so denying this is vital because threat actors might intercept our data and could do malicious things.


## 🔏🛜Allow HTTPS

**Allow HTTPS traffic on port 443:**

```sudo ufw allow https ```

OR:

```sudo ufw allow 443/tcp ```

***RATIONALE***    

Https is more secure protocol than http since data through this protocol is encrytpted. Allowing port 443 allows services on the machine to receive HTTPS connections.



<br>

## ❌🛜Deny Telnet

**Deny Telnet traffic:**

```sudo ufw deny telnet ```

OR:

```sudo ufw deny 23/tcp ```

***RATIONALE***  

Telnet is an insecure protocol used for remote access. It transmits data, including credentials, in plaintext, making it vulnerable to interception and attacks.

Blocking port 23 helps ensure that only secure protocols like SSH are used for remote administration.


## Enabling UFW
After configuring our rules, its time to enable our Uncomplicated firewall using:    

```sudo ufw enable ```

After that we're going to check the status: 


```sudo ufw status verbose ```

<img src="Screenshots\ufw.png" alt="My Image" style="width: 80%; height: auto;">



## Checking http connection 

Since we configured our firewall to deny any http connection, I went over to check if any http connection can be established.

**What I did:**

I set up an nginx web server to test if http connection can be established. I set it on my Kali linux where I configured my ufw rules then went ahead on my Windows machine to try to connect to the temporary webserver.

**Here's the result:**

<img src="Screenshots\web.png" alt="My Image" style="width: 80%; height: auto;">

<br>

<img src="Screenshots\http.png" alt="My Image" style="width: 80%; height: auto;">

<br>

## Checking SSH access

Since I allowed ssh, I tested if I could be able to access my machine remotly. I used my Windows machine to access my Kali Linux where the ufw rules are configured. 

<br>


<img src="Screenshots\ssh.png" alt="My Image" style="width: 80%; height: auto;">


## 📃⚙️Creating a Configuration Script

We're going to create a simple script which is going to automatically execute ufw rules 

We're going to name the script file ufw_configuration.sh

Here's how to script file looks like

```
#!/bin/bash  

 # UFW Firewall Configuration Script 
 # Purpose: Configure a basic Linux firewall using UFW   

 echo "Starting UFW firewall configuration..."    

# Set default policies   
 sudo ufw default deny incoming 
 sudo ufw default allow outgoing  

# Allow SSH  
sudo ufw allow 22/tcp  

# Deny HTTP  
sudo ufw deny 80/tcp  

# Allow HTTPS  
sudo ufw allow 443/tcp  

# Deny telnet  
sudo ufw deny 23/tcp

# Enable UFW 
sudo ufw --force enable  

# Display firewall status  
sudo ufw status verbose

echo "UFW configuration completed."

```

<br>  

**Then i'm going to make the script executable by giving it permissions:**  

> chmod +x ufw_configuration.sh

After that i'm going to run the script with:

> ./ufw_configuration.sh

<img src="Screenshots\script.png" alt="My Image" style="width: 80%; height: auto;">

<br>

## 📏 Why These Rules Were Chosen

<br>

| Rule | Action | Purpose |
|---|---|---|
| **SSH / 22** | **Allow** | Allows remote administration through SSH |
| **HTTP / 80** | **Deny** | Prevents unencrypted HTTP connections |
| **HTTPS / 443** | **Allow** | Allows encrypted HTTPS connections |
| **Telnet / 23** | **Deny** | Denies unsecure administration



The configuration follows the **principle of least privilege** by blocking incoming traffic by default and only allowing the services that are required.

<br>


---
