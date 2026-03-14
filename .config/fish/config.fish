if status is-interactive
    # Commands to run in interactive sessions can go here

# Set up fzf key bindings
fzf --fish | source

abbr !! --position anywhere --function last_history_item
abbr sudo "sudo"
abbr ls "ls --color=auto"
abbr grep "grep --color=auto"
abbr yup "ya pack -u"
abbr reb "xfce4-session-logout -r"
abbr off "xfce4-session-logout -h"

abbr cleanall "nix-collect-garbage -d"
abbr nrs "nix-channel --update && nix-env -u '*'"
abbr yay "sudo xbps-install -Su"
abbr in "sudo xbps-install -S"
abbr se "xbps-query -Rs"
abbr rem "sudo xbps-remove -R"
abbr clean "sudo xbps-remove -Oo"

abbr cfg "git --git-dir=$HOME/.cfg.git/ --work-tree=$HOME"
abbr ga "git --git-dir=$HOME/.cfg.git/ --work-tree=$HOME add"
abbr gc --set-cursor -- "git --git-dir $HOME/.cfg.git/ --work-tree=$HOME commit -a -m \"%\""
abbr ppp "git --git-dir=$HOME/.cfg.git/ --work-tree=$HOME push -u github main"
abbr gs "git --git-dir=$HOME/.cfg.git/ --work-tree=$HOME status"
abbr str "git --git-dir=/home/libor/.cfg.git/ --work-tree=/home/libor log --pretty=format: --name-only --diff-filter=A "
abbr untrack "git --git-dir=$HOME/.cfg.git/ --work-tree=$HOME update-index --skip-worktree"

end

