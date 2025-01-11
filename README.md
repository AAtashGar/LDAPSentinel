# LDAPSentinel

![LDAPSentinel Logo](https://github.com/AliAtashGar7/LDAPSentinel/blob/main/image/LDPSENTINEL.webp) 



## Repository Structure

```plaintext
LDAPSentinel/
├── .github/
│   ├── ISSUE_TEMPLATE/
│   │   └── bug_report.md
|   |   └── feature_request.md
|── image/POC.png
├── LICENSE
├── README.md
├── CONTRIBUTING.md
├── zkg.meta
├── CHANGELOG.md
├── scripts/
│   ├── __load__.zeek
│   └── main.zeek
├── tests/
│   ├── basic.test
│   └── sample_ldap_traffic.pcap
```

## README

# LDAPDetection - LDAPSentinel

## Overview

LDAPDetection, also known as "LDAPSentinel," is a Zeek script designed to enhance LDAP traffic analysis by identifying potentially suspicious queries. It leverages the spicy-ldap package to parse LDAP traffic for versions of Zeek that do not natively support LDAP.

## Key Features

- Detects LDAP traffic using spicy-ldap for versions of Zeek prior to 6.1.
- Identifies suspicious LDAP queries based on predefined filters.
- Provides detailed logging to aid in security investigations.

## Compatibility

This project is tailored for users running Zeek versions **below 6.1**, as these versions lack built-in support for the LDAP protocol in the `base/protocols/` directory. Starting from Zeek version 6.1, native support for LDAP exists, and this script may require adaptation to integrate seamlessly.

## Installation

1. **Install Dependencies**
   
   - Ensure you have Zeek installed.
   
   - Install spicy-ldap:
     
     ```bash
     zkg install spicy-ldap
     ```

2. **Clone Repository**
   
   ```bash
   git clone https://github.com/AliAtashGar7/LDAPSentinel.git
   mkdir /opt/zeek/share/zeek/site/LDAPSentinel
   cd LDAPSentinel/scripts
   cp -r . /opt/zeek/share/zeek/site/LDAPSentinel
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

## Proof of Concept (PoC)

![alt text](https://github.com/AliAtashGar7/LDAPSentinel/blob/main/image/POC.png)

In this section, we'll walk you through the output of the `LDAPSentinel` script step by step, demonstrating how it identifies suspicious LDAP queries. For this demonstration, we’ll use a sample LDAP traffic capture file.

### 1. **Sample Traffic**

To simulate an LDAP attack, you can use the sample LDAP traffic file included in the repository: `tests/sample_ldap_traffic.pcap`. This file contains example traffic that will be analyzed by `LDAPSentinel`.

### 2. **Running the Script**

Once you've installed and deployed the script, you can run Zeek to analyze the traffic. Here's an example command to run Zeek with your traffic:

```bash
zeek -r tests/sample_ldap_traffic.pcap
```

##### 3. **Output Example**

After processing the traffic, Zeek will produce logs with detailed information. The logs will include LDAP query patterns, any suspicious activity detected by the script, and more. Below is an example of what the output might look like:

```plaintext
# Example Output: Suspicious LDAP Query Detected
2025-01-11T03:56:15-03:00  ldap_query   suspicious_ldap_query    192.168.1.100    dc=example,dc=com  "(&(objectClass=user)(userPassword=*))"

```

### 4. **Explaining the Output**

- **Timestamp**: The time the query was logged.
- **Event Type**: This shows that the event is an `ldap_query`.
- **Detection**: The specific query that was flagged as suspicious, in this case, one that searches for `userPassword`, a common indicator of an attack.
- **Source IP**: The IP address of the machine making the query.
- **LDAP Query**: The actual LDAP query that was flagged.

### 5. **What to Look For**

The key indicator in this output is the LDAP query itself. The query `(&(objectClass=user)(userPassword=*))` is an example of a query that searches for user passwords, which is typically a suspicious action. The script flags queries that match patterns like this, helping security teams identify potential LDAP-based attacks.

By following these steps, you can use `LDAPSentinel` to monitor LDAP traffic in your network and quickly spot suspicious activity.



## Contributing

We welcome contributions! Please see the [CONTRIBUTING.md](CONTRIBUTING.md) file for guidelines on how to contribute to this project.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Changelog

All changes to this project are documented in the [CHANGELOG.md](CHANGELOG.md) file.
