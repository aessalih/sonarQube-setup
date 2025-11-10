
# SonarQube-setup

## What is SonarQube

SonarQube is a powerful code quality analysis tool designed to inspect software source code comprehensively. It performs a full scanning of the entire codebase, identifying key issues such as bugs, security vulnerabilities, security hotspots, code smells (maintainability issues), and code duplications.

The tool then generates a detailed analysis report on a centralized SonarQube server, providing developers and teams with deep insights into the quality, reliability, and security of their code.

## Why we should use it

+ **Improved Code Quality**: SonarQube automatically detects and highlights bugs and vulnerabilities using static analysis.

+ **Enhanced Code Maintainability**: The platform identifies Code Smells (design flaws, unnecessary complexity, and violation of coding standards) and Code Duplications.

+ **Improved Security**: SonarQube functions as a Static Application Security Testing (SAST) tool, scanning for security vulnerabilities like SQL injection and Cross-Site Scripting (XSS).

+ **Increased Productivity**: By automating code reviews, SonarQube provides instant, actionable feedback to developers, often directly in the IDE (via SonarLint).

+ **Enhanced Collaboration**: SonarQube establishes a single source of truth for code quality metrics across all teams and projects.

+ **Compliance Adherence**: The tool allows organizations to track and prove adherence to internal coding standards as well as industry and regulatory standards (like OWASP Top 10 or security frameworks), providing clear reporting for auditors and compliance teams.

## SonarQube setup instructions:

First, clone this repository using the following command:

```
git clone https://github.com/aessalih/sonarQube-setup.git
```

### Docker Compose Management (using Makefile):

+ make up:	Build & Start Stack

+ make down: Stop & Remove Containers

+ make clean:	Remove All Artifacts

+ make fclean:	Full Cleanup (Remove Volumes)

+ make re:	Rebuild and Restart

### Install and Configure SonarScanner

To interact with the SonarQube server and analyze your code, you need to install the SonarScanner CLI tool. The following steps are for a Linux environment using the Zsh shell (the .zshrc file is used for configuration):

1- Download the SonarScanner CLI archive:
```
sudo wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.8.0.2856-linux.zip
```

2- Install the unzip tool (if not already installed):
```
sudo apt install unzip
```
3- Unzip the downloaded file:
```
sudo unzip sonar-scanner-cli-4.8.0.2856-linux.zip
```
4- Move the tool to the standard /opt directory and rename it for simplicity:
```
sudo mv sonar-scanner-4.8.0.2856-linux /opt/sonar-scanner
```
5- Export the SONAR_SCANNER_HOME variable:
```
echo "export SONAR_SCANNER_HOME=/opt/sonar-scanner" >> ~/.zshrc
```
6- Add the binary directory to your system PATH:
```
echo "export PATH=$PATH:$SONAR_SCANNER_HOME/bin" >> ~/.zshrc
```
7- Apply the changes to your current terminal session:
```
source ~/.zshrc
```

### Run Code Analysis

Once SonarQube is running and the SonarScanner is installed, navigate to the root directory of the code you wish to analyze (e.g., your Java project) and run the following command:

```
sonar-scanner \
  -Dsonar.projectKey=HelloWorld \
  -Dsonar.sources=. \
  -Dsonar.host.url=http://localhost:9000 \
  -Dsonar.login=admin \
  -Dsonar.password=admin1
```

+ **Dsonar.projectKey**: Mandatory Unique identifier for your project within the SonarQube server. Replace HelloWorld with your actual project name.

+ **Dsonar.sources**: Mandatory Specifies the path to the source code files to be analyzed. . means the scanner will analyze all files in the current directory and its subdirectories.

+ **Dsonar.host.url**: Mandatory The URL where your SonarQube server is running. Since you set up the stack using Docker Compose, http://localhost:9000 is the correct address.

+ **Dsonar.login**: Mandatory for Security The authentication credential. Highly recommended to use a User Token generated from your SonarQube user profile instead of a username/password.

+ **Dsonar.password**: Not Recommended Using the admin password directly is a security risk. If you use a user token for -Dsonar.login, this option is not required.

