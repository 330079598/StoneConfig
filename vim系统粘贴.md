- 先看一下支持`+clipboard`

```shell
vim --version | grep clipboard
```

- 如果支持`+clipboard`那样就可以直接使用系统粘贴板
  - 用`**"+y**` 代替`y`将选中的内容复制到系统剪贴板，效果和`ctrl-c`一致。
  - 用**`"+p`**代替`p`将剪贴板内容复制到指定位置，也可以用`ctrl-v`。
  - `d`，`x`，`c`，`s`也一样，用之前前面加`**"+**`。
- 如果想偷懒用`y`直接把内容复制到系统剪贴板，需要到vim配置文件`.vimrc`里加一行属性。用下面命令开始配置，

```shell
vim ~/.vimrc
```

然后加入下面这行：

```shell
set clipboard=unnamed
```

现在你的`y`，`d`，`x`，`p`已经能和 `ctrl-c`和`ctrl-v` 一个效果，并且能互相混用。

- 如果开头是：`-clipboard`，说明不支持系统剪切板，可以从新安装一种vim版本

```shell
#不同的系统安装不同的版本
#arch
sudo pacman -S gvim
#其他linux
sudo apt install vim-gtk
```

- 下面是解释的内容：

首先，vim里`y`，`d`，`x`，`c`复制，剪切下来的内容临时存放在一个叫**vim寄存器（Register）**的地方。而且寄存器有好几个。下面vim命令可以看到寄存器列表，

```bash
:reg
```

作者：胖君
链接：https://www.zhihu.com/question/19863631/answer/442180294
来源：知乎
著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。



最常用的默认寄存器`""`叫 **未命名寄存器（unnamed register）**。最近一次删除，修改，复制内容统统暂存这里（会覆盖，只保留最近一次任意操作）。感兴趣的同学可以看下表，其他寄存器都是干什么的。

```text
""      // 默认unnamed寄存器，最近一次"d","c","s","x","y"复制，删除，修改内容

"0      // 最近一次"y"复制内容

"1      // 最近一次"d","c","s","x"删除，修改内容
"2     //  上一次"d","c","s","x"删除，修改内容
"3     // 上上次"d","c","s","x"删除，修改内容
...     
"9      // [1-9]数字以此类推


"a     // 字母寄存器，供用户指定使用，比如"ay就是复制到"a寄存器
"b
...
"z


"-      // 少于一行的"d","c","x"删除内容

".      // 只读寄存器
":      // 只读寄存器
"%     // 只读寄存器
"#     // 只读寄存器

"+      // 映射系统剪贴板 (有的默认设置不支持)
"*      // 映射系统剪贴板 (有的默认设置不支持)
```



而`ctrl-c`以及`ctrl-v`用到的是**系统剪贴板（system clipboard）**。**vim寄存器和系统剪贴板不是一个东西**。顾名思义，vim寄存器的数据作用域仅限于vim本地，甚至如果开多个vim窗口，每个窗口都有一套自己完整的寄存器，互相不影响。而系统剪贴板作为系统级别的全局变量，两边当然不能混用。

**所以vim专门提供了`"+`寄存器作为对系统剪贴板的映射**。可以理解成自动把`"+`寄存器的内容再复制一份到系统剪贴板，前提是你得把`clipboard`属性设置成打开。有些版本（比如MacOS自带的vim）就不支持这个映射。重装vim就是为了打开这个开关。（如果有简便的直接改设置方法，请纠正我）。打开以后用`"+y`命令把内容复制到和系统剪贴板关联的寄存器`"+`上。而`y`只是复制到默认无名寄存器`""`上。 

最后`set clipboard=unnamed`就是把默认无名寄存器`""` 和系统剪贴板也关联上。 就是用`y`也可以备份到系统剪贴板。缺点是破坏了默认寄存器`""`的本地性。因为`p`操作也会被等同于`"+p`处理，粘贴的是`"+`寄存器的内容， 粘贴的时候`""`默认寄存器内容就会被覆盖。 表现出来的就是复制一次，到任意vim窗口都可以粘贴。但这个特性恰恰是很多人想要的。

还有个细节，大部分系统上`"+`和`"*`是等价的。但在有的系统上不等价，比如Linux，

- `"+`：对应`ctrl-c`和`ctrl-v`用到的系统剪贴板：desktop clipboard (`XA_SECONDARY`)
- `"*`：对应图形界面中鼠标框选的内容（可以用鼠标中键黏贴）：X11 primary selection (`XA_PRIMARY`)

所以看到`"*`也不要慌，试试看用`"*y`和`"*p`能不能复制粘贴。可以的话就说明是混用的，不行就老老实实用`"+`。 



以上。遇到此坑的同学了解一下。



参考文献：

- 【[Vim documentation: change](https://link.zhihu.com/?target=http%3A//vimdoc.sourceforge.net/htmldoc/change.html%23quotequote)】
- 【[How to copy to clipboard in Vim?](https://link.zhihu.com/?target=https%3A//stackoverflow.com/questions/3961859/how-to-copy-to-clipboard-in-vim)】
- 【[如何将 Vim 剪贴板里面的东西粘贴到 Vim 之外的地方？](https://www.zhihu.com/question/19863631)】
- 【[Accessing the system clipboard](https://link.zhihu.com/?target=http%3A//vim.wikia.com/wiki/Accessing_the_system_clipboard)】
- 【[Macbook终端vim使用系统剪切板](https://link.zhihu.com/?target=https%3A//www.jianshu.com/p/270a5013808b)】

---

源地址：

如何将 Vim 剪贴板里面的东西粘贴到 Vim 之外的地方？ - 胖君的回答 - 知乎 https://www.zhihu.com/question/19863631/answer/442180294