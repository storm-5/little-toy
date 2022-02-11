# 简介
使用AriaNg + Nginx 实现的aria2下载工具，主要用于远程控制下载

# 用法方法
- 克隆本分支
	
	`git clone --branch alpine-aria2 --single-branch <remote-repo-url>` 将`<remote-repo-url>`替换为真实仓库地址

- 转到工作目录

	`cd little-toy/container/alpine-aria2`

- 创建容器

	`sh build.sh`

- 启动容器

	启动之前，按需修改`start.sh`里面的常量，然后执行`sh start.sh`。  
	启动后打开`http://<domain>/ariang/`即可访问下载器(需要在页面配置aria rcp参数: http://<domain>/aria2/ ，其它参数值可从start.sh常量中取得)

- 创建systemd单元（可选）

	```sh
	cd /etc/systemd/system/
	podman generate systemd --name alpine-aria2 --new -f  # 无意外会在当前目录创建单元文件
	systemctl daemon-reload
	systemctl enable <生成的单元文件名称>
	

