## 安裝vim

- 克隆项目`git clone https://github.com/330079598/StoneConfig.git`
- 将vim目录复制到`~/.vim`中
- 创建`~/.vimrc`里面写入一句话:

```shell
source ~/.vim/vim/init.vim
```

- 启动vim,运行`:PlugInstall` 安装插件

> 每次你修改或者调试了单个 .vim 配置文件后，命令行输入 `:so %` 即可重新载入，so 是 `source` 的简写，意思是加载脚本，`%` 代表当前正在编辑脚本的名字。

---
## Oh-my-zsh

使用文档:[文档地址](https://github.com/330079598/StoneConfig/blob/master/oh-my-zsh/zsh.md)

---
## tmux

我是根据[.tmux](https://github.com/gpakosz/.tmux/tree/master)这个开源项目进行改进的,具体改动如下:[文档地址](https://github.com/gpakosz/.tmux/tree/master/tmux/.tmux/README.md)
---

## todo

- - [x] vim配置
- - [x] tmux配置
- - [x] oh-my-zsh配置

