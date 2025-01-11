
# LDAPSentinel

# LDAPSentinel Repository Structure and README

## Repository Structure

```
LDAPSentinel/
├── .github/
│   ├── ISSUE_TEMPLATE/
│   │   └── bug_report.md
│   └── workflows/
│       └── ci.yml
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
   git clone https://github.com/yourusername/LDAPSentinel.git
   cd LDAPSentinel
   ```

3. **Load the Script**
   Add the following to your `local.zeek` configuration file:
   
   ```zeek
   @load LDAPDetection
   ```

4. **Deploy the Configuration**
   
   ```bash
   zeekctl deploy
   ```

## Usage

Once deployed, the script will analyze LDAP traffic and identify queries matching the suspicious filter set. Logs will provide details of the source, destination, and detected queries.

For more usage details, refer to the [usage documentation](docs/usage.md).

## Contributing

We welcome contributions! Please see the [CONTRIBUTING.md](CONTRIBUTING.md) file for guidelines on how to contribute to this project.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Changelog

All changes to this project are documented in the [CHANGELOG.md](CHANGELOG.md) file.

