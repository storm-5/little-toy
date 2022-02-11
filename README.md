# 简介
使用certbot + gost实现的https正向代理

# 使用方法
- 克隆本分支
	
	`git clone --branch alpine-gost-certbot --single-branch <remote-repo-url>` 将`<remote-repo-url>`替换为真实仓库地址

- 转到工作目录

	`cd little-toy/container/alpine-gost-certbot`

- 创建容器

	`sh build.sh`

- 启动容器

	启动之前，按需修改`start.sh`里面的常量，然后执行`sh start.sh`。  
	启动后即可使用https正向代理`https://<domain>:443`(默认无需认证，开启了探测防护，某些情况需要先访问google.com)

- 创建systemd单元（可选）

	```sh
	cd /etc/systemd/system/
	podman generate systemd --name alpine-gost-certbot --new -f  # 无意外会在当前目录创建单元文件
	systemctl daemon-reload
	systemctl enable <生成的单元文件名称>
	```