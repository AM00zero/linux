## 无人值守Linux安装镜像制作
### 实验目的与要求
+ 如何配置无人值守安装iso并在Virtualbox中完成自动化安装。  
+ Virtualbox安装完Ubuntu之后新添加的网卡如何实现系统开机自动启用和自动获取IP？  
+ 如何使用sftp在虚拟机和宿主机之间传输文件？  

### 实验准备  
+ 实验环境及工具：  
	+ Ubuntu 16.04 Server 64bit     
	+ VirtualBox  
	+ PuTTY  
	+ PsFTP   
  
### 实验过程  
+ 配置网卡  
+ 挂载镜像并创建工作目录  
+ 编辑Ubuntu安装引导界面增加一个新菜单项入口  
+ 将定制好的seed文件移入虚拟机的cd/preseed文件夹中
+ 重新生成md5sum.txt文件
+ 封闭改动后的目录到.iso
+ 将生成的镜像custom.iso由虚拟机导入宿主机
+ 实验安装  

### 实验结果
+ 由于没有配置isolinux/isolinux.cfg，安装时需手动选择Auto Install Ubuntu Server。  
+ 选择后即可无人值守自动安装。
