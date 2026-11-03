---

### **1. Docker Image Creation & Docker Hub Workflow**

When you modify a running container, those changes remain isolated inside that container. To distribute or reuse these modifications, you can capture the container's state as a new Docker Image and push it to a registry like Docker Hub.

```mermaid
graph LR
    A[Running Container] -- "docker commit" --> B[Local Docker Image]
    B -- "docker tag" --> C[Tagged Image]
    C -- "docker push" --> D[Docker Hub]
    D -- "docker pull" --> E[Remote Server / New Container]
```

#### **Step-by-Step Commands:**
1. **Run a base container and make modifications**:
   ```bash
   docker run -itd --name myubuntu ubuntu
   docker exec -it myubuntu bash
   # Inside container: create or update files
   echo "welcome to Docker" > /root/test
   cat /root/test
   exit
   ```
2. **Commit changes to create a new local image**:
   ```bash
   docker commit myubuntu myubuntu:v1
   docker images
   ```
3. **Tag the image for Docker Hub**:
   ```bash
   docker tag myubuntu:v1 skillopstech/myubuntu:v1
   ```
4. **Log in to Docker Hub**:
   ```bash
   docker login
   ```
   *(Presents a web-based login URL like `[suspicious link removed]` and a one-time device code).*
5. **Push the image to Docker Hub**:
   ```bash
   docker push skillopstech/myubuntu:v1
   ```
6. **Pull and run the image on another host**:
   ```bash
   docker pull skillopstech/myubuntu:v1
   docker run -it skillopstech/myubuntu:v1
   ```

---

### **2. Docker Storage Types Overview**

Containers are ephemeral by default; deleting a container destroys all data created inside its writeable layer. Docker provides four primary storage mechanisms to handle persistent and temporary data:

1. **Docker Volume:** Managed entirely by Docker within `/var/lib/docker/volumes/`. Recommended for database persistence.
2. **Bind Mount:** Maps a specific directory on the host machine directly into the container. Ideal for development environments and serving static web assets.
3. **tmpfs Mount:** Stored entirely in host system memory (RAM). Non-persistent and suitable for sensitive temporary files or high-speed caching.
4. **Anonymous Volume:** Managed by Docker without a user-assigned name.

#### **Storage Comparison Matrix**

| Feature | Volume | Bind Mount | tmpfs Mount |
| :--- | :--- | :--- | :--- |
| **Storage Location** | Docker-managed (`/var/lib/docker/volumes/`) | User-specified host directory | Host System RAM |
| **Persistence** | **Yes** (persists after container deletion) | **Yes** (persists on host) | **No** (cleared when container stops) |
| **Host Path Access** | Managed by Docker daemon | Directly accessible by host user | Stored in Memory |
| **Primary Use Case** | Databases (e.g., MySQL) | Development, Nginx host files | Temporary data, caches, temp files |

---

### **3. Managing Docker Volumes**

Docker Volumes are the preferred mechanism for persisting container data.

#### **Step-by-Step Volume Operations:**
1. **Create and inspect a named volume**:
   ```bash
   docker volume create myvolume
   docker volume ls
   docker volume inspect myvolume
   ```
   *(Inspecting reveals the host mountpoint at `/var/lib/docker/volumes/myvolume/_data`).*
2. **Attach a volume to an interactive container**:
   ```bash
   docker run -it --name test-container -v myvolume:/data ubuntu
   ```
3. **Mount a volume to a web server (NGINX)**:
   ```bash
   docker run -d --name webserver -p 8080:80 -v webvolume:/usr/share/nginx/html nginx
   ```
4. **Modify web content inside the container**:
   ```bash
   docker exec -it webserver bash
   cd /usr/share/nginx/html
   echo "<h1>Welcome to Docker Volume</h1>" > index.html
   exit
   ```
5. **Delete volumes when no longer needed**:
   ```bash
   docker volume rm myvolume
   ```

---

### **4. Hands-On Practical: Database Persistence with MySQL**

This practical demonstrates how attaching a Docker volume ensures data survives complete container destruction.

#### **Step-by-Step Commands:**

**Step 1: Create a volume and launch MySQL**
```bash
docker volume create mysql_data

docker run -d \
  --name mysql-server \
  -e MYSQL_ROOT_PASSWORD=Admin@123 \
  -e MYSQL_DATABASE=company \
  -v mysql_data:/var/lib/mysql \
  -p 3306:3306 \
  mysql:8.0
```

**Step 2: Connect to MySQL and populate sample data**
```bash
docker exec -it mysql-server mysql -uroot -pAdmin@123
```
Inside the MySQL prompt:
```sql
USE company;

CREATE TABLE employees (
    id INT,
    name VARCHAR(50),
    salary INT
);

INSERT INTO employees VALUES 
(1, 'Rahul', 30000), 
(2, 'Amit', 40000), 
(3, 'John', 50000);

SELECT * FROM employees;
exit;
```

**Step 3: Delete the MySQL container to simulate failure/removal**
```bash
docker rm -f mysql-server
```

**Step 4: Launch a NEW MySQL container attached to the SAME volume**
```bash
docker run -d \
  --name mysql-server2 \
  -e MYSQL_ROOT_PASSWORD=Admin@123 \
  -v mysql_data:/var/lib/mysql \
  -p 3306:3306 \
  mysql:8.0
```

**Step 5: Verify that all data remains intact**
```bash
docker exec -it mysql-server2 mysql -uroot -pAdmin@123
```
Inside the MySQL prompt:
```sql
USE company;
SELECT * FROM employees;
```
*(The `employees` table and all 3 records are fully preserved).*

---

### **5. Container Orchestration with Docker Compose**

Docker Compose allows you to define multi-container applications and storage resources in a single YAML file.

#### **Configuration (`docker-compose.yml`)**:
```yaml
services:
  mysql:
    image: mysql:8.0
    container_name: mysql-db
    environment:
      MYSQL_ROOT_PASSWORD: Admin@123
      MYSQL_DATABASE: company
    ports:
      - "3306:3306"
    volumes:
      - mysql_data:/var/lib/mysql

volumes:
  mysql_data:
```

#### **Step-by-Step Commands:**
1. **Validate configuration**:
   ```bash
   docker compose config
   ```
2. **Start the application in detached mode**:
   ```bash
   docker compose up -d
   ```
3. **Check container status**:
   ```bash
   docker compose ps
   ```
4. **Stop and remove containers**:
   ```bash
   docker compose down
   ```
5. **Permanently remove containers AND associated volumes**:
   ```bash
   docker compose down -v
   ```
   *(Note: Using `-v` permanently deletes volume data).*

---

### **6. Bind Mounts Hands-On**

Bind mounts map a specific directory on your host filesystem directly into a container directory.

#### **Step-by-Step Commands:**
1. **Create host directory and run container with bind mount**:
   ```bash
   mkdir -p /opt/dockerdata
   docker run -it --name bind-container -v /opt/dockerdata:/data ubuntu
   ```
2. **Create a file inside the container**:
   ```bash
   # Inside container
   echo "hello world" > /data/test
   exit
   ```
3. **Verify file existence directly on the host machine**:
   ```bash
   cat /opt/dockerdata/test
   # Output: hello world
   ```

---

### **7. tmpfs Mounts Hands-On**

`tmpfs` mounts write data directly to host RAM rather than the disk.

#### **Step-by-Step Commands:**
1. **Run container with a `tmpfs` mount**:
   ```bash
   docker run -it --name test-tmpfs --tmpfs /data:rw,size=100m ubuntu bash
   ```
2. **Verify mount inside container**:
   ```bash
   cd /data
   echo "welcome to docker" > test
   cat test
   df -h
   ```
   *(The `df -h` output confirms `/data` is mounted as a 100MB `tmpfs` filesystem in RAM).*

---

### **8. Comprehensive Command Quick Reference**

| Task | Command | Source |
| :--- | :--- | :--- |
| **Commit Image** | `docker commit <container_name> <image_name:tag>` | |
| **Tag Image** | `docker tag <source_image> <username/repository:tag>` | |
| **Docker Hub Login** | `docker login` | |
| **Push Image** | `docker push <username/repository:tag>` | |
| **Create Volume** | `docker volume create <volume_name>` | |
| **Inspect Volume** | `docker volume inspect <volume_name>` | |
| **Run with Volume** | `docker run -v <volume_name>:<container_path> <image>` | |
| **Run with Bind Mount**| `docker run -v <host_path>:<container_path> <image>` | |
| **Run with tmpfs** | `docker run --tmpfs <container_path>:rw,size=<size> <image>` | |
| **Start Compose** | `docker compose up -d` | |
| **Destroy Compose + Volumes** | `docker compose down -v` | |
