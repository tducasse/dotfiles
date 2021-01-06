# dotfiles


## Dependencies

- fzf
- fd
- ripgrep
- vim plug
- neovim
- a proper font (MesloLGS NF)
- git
- zsh
- oh my zsh
- powerlevel10k

## Neovim
### Keys

- leader is space
- :PlugInstall to install
- :PlugClean to clean
- :PlugUpdate to update
- :PlugUpgrade to upgrade
- C-b is nerdtree
  - navigate with j-k
  - CR to open
  - s to vsplit
  - t to tab
  - cd to change pwd
  - CD to root to pwd
  - o to toggle
  - O to cascade open
  - X to cascade close
- C-j is terminal
- C-p to FZF
- C-g to global search
- :GF? to FZF Gstatus
- leader d to revision diff
  - n and N to move
- leader c space to toggle comment
- C-n is visual multi
- :Test__ for the test commands
- :G for git status
  - X to discard
  - s to add
  - u to unstange
  - dv vdiffsplit
- :Gvd for vdiffsplit
- :Gblame for git blame
- C-w = to make all windows equal
- C-w h,j,k,l to move around windows
- gt or [num]gt to move around tabs
- C-space in insert to get completion
  - Tab and S-Tab to move around completions
- ]g and [g to go to next warn/err
- gd to go to def
- gr to get references
- :MakeSession() to create a new session, based on the folder
- :LoadSession() to load a previous session, based on the folder
- :UpdateSession() to update the current session if it exists
- :tabnew, then :tcd NEW_PATH to create a new tab in a different folder
  - nerdtree and the tab name auto-update
- C-l to dismiss the search highlights
