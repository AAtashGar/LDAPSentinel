# LDAPSentinel

![alt text]((https://github.com/AAtashGar/LDAPSentinel/tree/main/POC/LDAPSentinel.png) "Optional Title")

## README

## Overview

**LDAPSentinel** is a Zeek script designed to improve LDAP traffic analysis by identifying potentially suspicious queries. This project is designed for 2 versions of Zeek. As you know, Zeek did not support the LDAP protocol by default in versions 6.1 and below, so a separate solution is provided for those who use these versions to identify suspicious queries. From version 6.1 and above, LDAP is supported by Zeek by default, so a separate solution is provided for those who use these versions.

## Compatibility

This project is designed for both users using Zeek versions **below 6.1** and users using Zeek versions **above 6.1**. For versions **below 6.1**, there is no default analyzer for the LDAP protocol in the `base/protocols/` directory, so we recommend using the **spicy-ldap** package for these versions. The installation procedure for both versions is explained below.

## Installation_below 6.1

1. **Install Dependencies**
   
   - Ensure you have Zeek installed.
   
   - Install spicy-ldap:
     
     ```bash
     zkg install spicy-ldap
     ```

2. **Clone Repository**
   
   ```bash
   git clone https://github.com/AliAtashGar7/LDAPSentinel.git
   cd LDAPSentinel/scripts/zeek6.1
   cp -r . "PATH TO ZEEK"/zeek/share/zeek/site/
   ```

3. **Load the Script**
   Add the following to your `local.zeek` configuration file:
   
   ```zeek
   @load LDAPSentinel
   ```

4. **Deploy the Configuration**
   
   ```bash
   zeekctl deploy
   ```

## Installation_above 6.1

1.   **Clone Repository**

```bash
git clone https://github.com/AliAtashGar7/LDAPSentinel.git
cd LDAPSentinel/scripts/zeek7.1
cp -r . "PATH TO ZEEK"/zeek/share/zeek/site/
```

- **Load the Script** Add the following to your `local.zeek` configuration file:
  
  ```zeek
  @load LDAPSentinel
  ```

- **Deploy the Configuration**
  
  ```bash
  zeekctl deploy
  ```

## Proof of Concept (PoC)

![alt text](URL_to_image "Optional Title")

In this section, we'll walk you through the output of the `LDAPSentinel` script step by step, demonstrating how it identifies suspicious LDAP queries. For this demonstration, we’ll use a sample LDAP traffic capture file.

### 1. **Sample Traffic**

To simulate an LDAP attack, you can use the sample LDAP traffic file included in the repository: `tests/sample_ldap_traffic.pcap`. This file contains example traffic that will be analyzed by `LDAPSentinel`.

### 2. **Running the Script**

Once you've installed and deployed the script, you can run Zeek to analyze the traffic. Here's an example command to run Zeek with your traffic:

```bash
 zeek -C -r tests/sample_ldap_traffic.pcap /opt/zeek/share/zeek/site/LDAPSentinel/main.zeek "LogAscii::use_json=T"
```

##### 3. **Output Example**

After processing the traffic, Zeek will produce logs with detailed information. The logs will include LDAP query patterns, any suspicious activity detected by the script, and more. Below is an example of what the output might look like:

```plaintext
# Example Output: 
Suspicious LDAP query detected: (&(&(objectCategory=person)(!(userAccountControl:1.2.840.113556.1.4.803:=2)))(servicePrincipalName=*)), [orig_h=192.168.31.129, orig_p=54014/tcp, resp_h=192.168.31.128, resp_p=389/tcp, proto=6]
```

### 4. **What to Look For**

The key indicator in this output is the LDAP query itself. The query `(&(&(objectCategory=person)(!(userAccountControl:1.2.840.113556.1.4.803:=2)))(servicePrincipalName=*))` is an example of a query that searches for all enabled user accounts that have a servicePrincipalName attribute set.
https://www.dannymoran.com/ldap-cheat-sheet/

which is typically a suspicious action and may be used for attacks like kerberoasting. The script flags queries that match patterns like this, helping security teams identify potential LDAP-based attacks.

By following these steps, you can use `LDAPSentinel` to monitor LDAP traffic in your network and quickly spot suspicious activity.

## Contributing

We welcome contributions! Please see the [CONTRIBUTING.md](CONTRIBUTING.md) file for guidelines on how to contribute to this project.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 
