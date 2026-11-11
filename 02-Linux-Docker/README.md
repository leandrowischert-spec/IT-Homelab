# Linux Server & Docker Homelab

## Project Overview
Installation and configuration of Ubuntu Server and Docker Engine in a Microsoft Hyper-V environment.

**Goal:** Gain hands-on experience in Linux administration, containerization, and DevOps.

## Lab Environment
- Host: Windows 11 Pro
- Hypervisor: Microsoft Hyper-V
- Virtual Machine: LINUX01
- Operating System: Ubuntu Server 24.04.5 LTS
- RAM: 4 GB
- Virtual Disk: 40 GB
- Network: Hyper-V Default Switch
- Remote Access: SSH
- Container Platform: Docker Engine

## Completed Tasks
- Installed Ubuntu Server 24.04.5 LTS
- Configured the Linux administrator account
- Updated system packages
- Configured SSH remote access
- Connected from Windows PowerShell via SSH
- Installed Docker Engine
- Verified that the Docker service is active
- Successfully executed the hello-world container

## Docker Verification

Command:
```bash
sudo docker run hello-world
```

Verified output:
```text
Hello from Docker!
This message shows that your installation appears to be working correctly.
```

**Result: PASS**

## Skills Practiced
Linux CLI, package management, SSH, Hyper-V, Docker Engine, container images and container execution.

## Next Steps
- Inspect containers and images
- Deploy an Nginx web server
- Configure port mapping
- Learn Docker Compose
- Explore Kubernetes

## References
- [Ubuntu Server Documentation](https://documentation.ubuntu.com/server/)
- [Docker Documentation](https://docs.docker.com/)


## Project: NGINX Web Server with Docker

### Objective
Deploy a custom HTML website using Docker and NGINX on an Ubuntu Server virtual machine.

### Lab Environment
- **Hypervisor:** Microsoft Hyper-V
- **Operating System:** Ubuntu Server 24.04 LTS
- **Container Platform:** Docker Engine
- **Web Server:** NGINX
- **Remote Administration:** SSH via Windows PowerShell

### Implementation

**1. Created a custom HTML website**

Created an `index.html` file in the `~/meine-website` directory.

**2. Deployed an NGINX container**

```bash
sudo docker run -d --name webserver -p 8080:80 nginx:stable
```

**3. Configured a bind mount**

Mounted the local website directory into the NGINX container to serve custom HTML content.

**4. Created a Dockerfile**

```dockerfile
FROM nginx:stable
COPY index.html /usr/share/nginx/html/index.html
```

**5. Built a custom Docker image**

```bash
cd ~/meine-website
sudo docker build -t mein-webserver:v1 .
```

**Build result:**

```text
Successfully built c59c65303066
Successfully tagged mein-webserver:v1
```

### Skills Demonstrated

- Linux server administration via SSH
- Docker container lifecycle management
- Container networking and port mapping
- Docker bind mounts
- Creating Dockerfiles
- Building and tagging custom Docker images
- Hosting a static website using NGINX

### Next Steps

- Run and verify a container from the custom image
- Deploy multiple containers from the same image
- Learn Docker Compose
- Monitor container logs and resource usage
- Explore Kubernetes fundamentals
