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


## Lab Experiment: Docker Bind Mount vs. Custom Image

### Objective
Understand how file changes behave differently when using Docker bind mounts compared to files copied into a Docker image.

### Test Environment

| Container | Image | Port | Configuration |
|---|---|---|---|
| webserver | nginx:stable | 8080 | Bind mount |
| meine-app | mein-webserver:v1 | 8081 | Custom Docker image |

### Procedure

1. Modified the local `index.html` file on the Ubuntu server.
2. Updated the heading to `Meine Website wurde aktualisiert!`.
3. Verified the file inside the running container using:

```bash
sudo docker exec webserver cat /usr/share/nginx/html/index.html
```

4. Tested the web server using:

```bash
curl http://localhost:8080
```

5. Opened both websites in Microsoft Edge and compared their content.

### Results

**Port 8080 – Bind Mount**

The updated HTML page was displayed without rebuilding the Docker image or restarting the container.

**Port 8081 – Custom Image**

The website continued displaying the original HTML content because the file had been copied into the image during the build process.

**Browser Cache**

Initially, Microsoft Edge displayed an outdated version of the website. A forced refresh using `Ctrl + F5` resolved the issue.

### Key Learnings

- Bind mounts allow containers to access files directly from the host filesystem.
- Docker images contain files captured during the image build.
- Updating files on the host does not automatically modify an existing image.
- Browser caching can affect troubleshooting and testing.
- `docker exec` and `curl` are useful tools for verifying container behavior.

### Conclusion

Successfully demonstrated the difference between host-mounted files and files embedded in a Docker image. Both NGINX containers were tested and their different update behaviors were confirmed.






## Project: Managing Multiple Containers with Docker Compose

### Objective

Learn how to deploy and manage multiple Docker containers using a single YAML configuration file.

### Lab Environment

- **Hypervisor:** Microsoft Hyper-V
- **Operating System:** Ubuntu Server 24.04 LTS
- **Container Platform:** Docker Engine
- **Docker Compose:** v2.40.3
- **Web Server:** NGINX
- **Custom Image:** `mein-webserver:v1`

### Implementation

**1. Installed Docker Compose**

```bash
sudo apt update
sudo apt install docker-compose-v2
sudo docker compose version
```

**2. Created a project directory**

```bash
mkdir -p ~/compose-projekt
cd ~/compose-projekt
```

**3. Created a `compose.yaml` file**

```yaml
services:
  web:
    image: mein-webserver:v1
    ports:
      - "8082:80"

  web2:
    image: mein-webserver:v1
    ports:
      - "8083:80"
```

Both services use the same custom Docker image but run as independent containers.

**4. Validated the configuration**

```bash
sudo docker compose config
```

The YAML configuration was successfully validated.

**5. Deployed the containers**

```bash
sudo docker compose up -d
```

Docker Compose created a dedicated project network and started both containers.

**6. Verified container status**

```bash
sudo docker compose ps
```

| Container | Image | Port | Result |
|---|---|---|---|
| compose-projekt-web-1 | mein-webserver:v1 | 8082 | Running |
| compose-projekt-web2-1 | mein-webserver:v1 | 8083 | Running |

**7. Tested container lifecycle management**

```bash
sudo docker compose stop
sudo docker compose start
sudo docker compose stop
sudo docker compose ps -a
```

Both containers were successfully stopped, restarted, and stopped again.

Final status:

```text
compose-projekt-web-1    Exited (0)
compose-projekt-web2-1   Exited (0)
```

### Key Learnings

- Writing and validating YAML configuration files
- Managing multiple services with Docker Compose
- Deploying multiple containers from the same image
- Understanding container port mappings
- Understanding Compose project networks
- Starting and stopping multiple containers with a single command
- Checking running and stopped containers
- Understanding the difference between Docker Compose and individual `docker run` commands

### Results

Successfully deployed and managed two independent NGINX containers using Docker Compose.

Both containers were created from the same custom Docker image and configured with separate host ports.

The containers were successfully stopped and restarted using Docker Compose commands.

### Next Steps

- Inspect container logs
- Monitor container resource usage
- Learn Docker volumes and persistent storage
- Explore multi-service applications
- Begin Kubernetes fundamentals
