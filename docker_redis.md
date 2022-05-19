# Docker 下 redis 集群部署

## Docker 基础知识

### Docker 架构
![docker 架构](/pics/docker_struct.png)

### Docker 和 虚拟机的区别
![Docker vs vm](/pics/docker_vs_vm.png)

## Docker 命令

### docker 命令图谱

![docker 命令图谱](/pics/cmd1.png)

### docker 命令大全

![docker cmd 1](/pics/cmd2-1.jpg)
![docker cmd 2](/pics/cmd2-2.jpg)

## 安装 docker
1. 更新 debian 源
```bash
sudo apt-get update
```

2. 移除旧的 docker，假如有的话
```bash
sudo apt-get remove docker docker-engine docker.io containerd runc
```

3. 一键安装 docker
```bash
sudo curl -fsSL https://get.docker.com | bash -s docker --mirror Aliyun
```
> 备用连接 ：
>
> `curl -sSL https://get.daocloud.io/docker | sh`

## 测试 docker 安装结果

1. wsl 下 debian 的一些设置

```bash
# for wsl debian 2

sudo touch /etc/fstab
sudo update-alternatives --set iptables /usr/sbin/iptables-legacy
sudo update-alternatives --set ip6tables /usr/sbin/ip6tables-legacy
```

2. 启动 docker
```bash
sudo service docker start/restart
```

3. 查看 docker 状态
```bash
sudo service docker status
```

4. 运行并安装 hello-world 进行测试
```bash
sudo docker run hello-world
```

## Docker redis 集群

### 安装指定版本 redis
```bash
sudo docker pull redis:6.0.15
```

### 新建 redis 集群

#### 新建 redis

##### 新建目录
```bash
sudo mkdir -p /usr/local/app/redis/data
sudo touch /usr/local/app/redis/redis.conf
```

##### 运行 redis
```bash
sudo docker run --name redis -p 1001:6379 \
-v /usr/local/app/redis/redis.conf:/etc/redis/redis.conf \
-v /usr/local/app/redis/data:/data \
-d --restart=always redis:6.0.15 redis-server /etc/redis/redis.conf \
--appendonly yes \
--requirepass "root"
```

##### 测试 redis

3.1 进入容器
```bash
docker exec -it redis bash
```
3.2 连接
```bash
redis-cli
```
3.3 登录
```bash
auth root
```
3.4 redis 操作
```bash
get name
set name redis
get name
```

#### 新建 redis1

##### 新建目录
```bash
sudo mkdir -p /usr/local/app/redis1/data
sudo touch /usr/local/app/redis1/redis.conf
```

##### 运行 redis1
```bash
sudo docker run --name redis1 -p 1002:6379 \
-v /usr/local/app/redis1/redis.conf:/etc/redis/redis.conf \
-v /usr/local/app/redis1/data:/data \
-d --restart=always redis:6.0.15 redis-server /etc/redis/redis.conf \
--appendonly yes \
--requirepass "root"
```

##### 测试 redis1
1. 进入容器
```bash
docker exec -it redis1 bash


2. 连接
```bash
redis-cli
```

3. 登录
```bash
auth root
```

4. redis 操作
```bash
get name
set name redis1
get name
```

## 其他命令
### 查看容器
```bash
sudo docker ps -a
```
结果如下
```bash
CONTAINER ID   IMAGE          COMMAND                  CREATED         STATUS                   PORTS                                       NAMES
6a84d19b010e   redis:6.0.15   "docker-entrypoint.s…"   2 minutes ago   Up 2 minutes             0.0.0.0:1002->6379/tcp, :::1002->6379/tcp   redis1
c8aae828055f   redis:6.0.15   "docker-entrypoint.s…"   3 minutes ago   Up 3 minutes             0.0.0.0:1001->6379/tcp, :::1001->6379/tcp   redis
f41f61ac2ea4   hello-world    "/hello"                 2 hours ago     Exited (0) 2 hours ago                                               kind_hamilton
```
### 停止运行
```bash
sudo docker stop 6a84d19b010e
```
### 删除容器
```bash
sudo docker rm 6a84d19b010e
```
### 查看镜像
```bash
sudo docker images -a
```

## python2 连接 redis

### 安装 redis
```bash
pip install redis

pip2 install redis
```

## 测试连接，代码如下：
```python
import redis
r = redis.StrictRedis(host="localhost", port=1001, db=0, password="root")
print(r.get("name"))
r = redis.StrictRedis(host="localhost", port=6378, db=0, password="root")
print(r.get("name"))
```
