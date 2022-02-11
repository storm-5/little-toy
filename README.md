# 简介
使用caddy + gost实现的web server + reverse proxy + forward proxy服务

# 使用方法
- 克隆本分支
	
	`git clone --branch alpine-caddy-gost --single-branch <remote-repo-url>` 将`<remote-repo-url>`替换为真实仓库地址

- 转到工作目录

	`cd little-toy/container/alpine-caddy-gost`

- 创建容器

	`sh build.sh`

- 启动容器

	启动之前，按需修改`start.sh`里面的常量，然后执行`sh start.sh`。  
	启动后即可使用https正向代理`https://<domain>:443`(默认无需认证，开启了探测防护，某些情况需要先访问google.com)，同时也可使用websocket`https://<domain>:443/stream(开启了探测防护，某些情况需要先访问google.com)`

- 创建systemd单元（可选）

	```sh
	cd /etc/systemd/system/
	podman generate systemd --name alpine-caddy-gost --new -f  # 无意外会在当前目录创建单元文件
	systemctl daemon-reload
	systemctl enable <生成的单元文件名称>
	```

- 添加反向代理 

	修改files/caddy/Caddyfile，修改方法可参考里面的例子。重启容器。
