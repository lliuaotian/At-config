# 分享我的各种配置文件
如果是nvim配置的话，[请点此跳转链接](https://github.com/lliuaotian/LNeovim)

## 安装插件
- zsh-autosuggestions #根据命令智能补全建议插件
安装方式，下载文件后在.zshrc文件中添加以下内容，如果你使用的我的配置文件就不需要在添加了
```shell
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
plugins=( 
    # other plugins...
    zsh-autosuggestions
)
```
- zsh-syntax-highlighting #会将命令高亮，很容易看出自己命令是否打错
```shell
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
plugins=( 
    # other plugins...
    zsh-syntax-highlighting
)
```
