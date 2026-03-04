### <div align="center"> 💻 My NixOS config 💻 </div>


##### ✌ Welcome to my repo. Feel free to look inside for an inspiration or just for fun. 
This is still work in progress.  
My focus here is Void linux Xfce4.

## ⚙️ Init a git bare repo
```
git init --bare $HOME/.cfg.git
```

💬 Define an alias or add it to .bashrc:
```
alias cfg='git --git-dir=$HOME/.cfg.git --work-tree=$HOME'
```

👍 And that’s it! You can add all kinds of files and directories in your repository.
```
cfg status
cfg commit -m "Some info"
```
## 📥 Restore your config
   

💬 Gitignore your git repo:

```
echo ".cfg.git" >> .gitignore
```

💬 Clone your dotfiles into the git repo:

```
git clone --bare https://github.com/lrestj/void.git $HOME/.cfg.git

```

💬 Checkout the contents of your bare repository to your $HOME directory:

```
git --git-dir=$HOME/.cfg.git/ --work-tree=$HOME checkout -f
```

👍 Your set up is now complete again.

<div align="center"> 🔔&nbsp🔔&nbsp🔔&nbsp🔔&nbsp🔔 </div>
<div align="center"> 🇪 🇴 🇫 </div>
