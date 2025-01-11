# Contributing to LDAPSentinel

Thank you for your interest in contributing to **LDAPSentinel**! We welcome contributions of all kinds, including bug reports, feature requests, code contributions, documentation improvements, and more. Your involvement helps make this project better for everyone.

## Code of Conduct

Please note that this project is governed by a [Code of Conduct](https://www.contributor-covenant.org/version/2/1/code_of_conduct/). By participating, you agree to abide by its terms. Be respectful, considerate, and constructive in all interactions.

## How to Contribute

### Reporting Issues

If you encounter any problems or have suggestions for improvement, please create an issue in the [GitHub Issues](https://github.com/your-username/LDAPSentinel/issues) section. Include as much detail as possible:

- Steps to reproduce the issue
- Expected behavior
- Actual behavior
- Any relevant logs or screenshots

### Contributing Code

We welcome code contributions, whether it’s fixing bugs, adding features, or improving existing functionality. To contribute code:

1. **Fork the repository**: Click the "Fork" button on the repository page to create your own copy.
2. **Clone your fork**: Use `git clone` to clone your fork to your local machine.
   
   ```bash
   git clone https://github.com/your-username/LDAPSentinel.git
   ```
3. **Create a new branch**: Create a branch for your changes.
   
   ```bash
   git checkout -b feature-or-bugfix-description
   ```
4. **Make your changes**: Modify the code or documentation as needed.
5. **Run tests**: Ensure your changes pass all existing tests and add new ones if necessary.
6. **Commit your changes**: Write a clear and descriptive commit message.
   
   ```bash
   git commit -m "Brief description of your changes"
   ```
7. **Push your branch**: Push your branch to your forked repository.
   
   ```bash
   git push origin feature-or-bugfix-description
   ```
8. **Submit a pull request**: Go to the original repository and create a pull request. Describe your changes in detail and link to any relevant issues.

### Setting Up the Environment

To set up the development environment for **LDAPSentinel**:

1. Ensure you have [Zeek](https://zeek.org) installed (version 6.0 or earlier).
2. Install the [spicy-ldap](https://github.com/zeek/spicy-analyzers) package for parsing LDAP traffic.
3. Clone this repository and navigate to the project directory.
4. Load the `main.zeek` script into your Zeek instance for testing.

### Testing

Tests are located in the `tests/` directory. To run the tests:

1. Use the provided `.pcap` files to simulate LDAP traffic.
2. Run Zeek with the test configuration:
   
   ```bash
   zeek -r tests/sample_ldap_traffic.pcap scripts/__load__.zeek
   ```
3. Verify the output matches expected results in the `tests/basic.test` file.

### Submitting Contributions

Before submitting your contributions, ensure the following:

- Your code adheres to the project’s style guidelines.
- Your changes are well-documented.
- All tests pass, and new tests have been added for new functionality.

### Style Guidelines

- Follow Zeek scripting conventions for clarity and maintainability.
- Use meaningful variable and function names.
- Write concise and descriptive comments where necessary.
- Keep commit messages clear and concise.

---

Thank you for contributing to **LDAPSentinel**! Your support and collaboration are greatly appreciated.
