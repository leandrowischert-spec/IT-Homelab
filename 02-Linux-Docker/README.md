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
