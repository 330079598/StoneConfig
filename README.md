## 安裝vim

- 克隆项目`git clone https://github.com/330079598/StoneConfig.git`
- 将vim目录复制到`~/.vim`中
- 创建`~/.vimrc`里面写入一句话:

```shell
source ~/.vim/vim/init.vim
```

- 启动vim,运行`:PlugInstall` 安装插件

> 每次你修改或者调试了单个 .vim 配置文件后，命令行输入 `:so %` 即可重新载入，so 是 `source` 的简写，意思是加载脚本，`%` 代表当前正在编辑脚本的名字。

## todo

- - [x] vim配置
- - [ ] tmux配置
- - [ ] oh-my-zsh配置

