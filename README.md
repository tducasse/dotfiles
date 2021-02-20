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
  - enter to open
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
- leader tab to navigate buffers
- leader d to revision diff
  - n and N to move
- gcc to toggle comment
- C-n is visual multi
- :Test__ for the test commands
- :G for git status
  - X to discard
  - s to add
  - u to unstage
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
- gh to show documentation
  - gh again to close it
- gr to get references
- :SaveSession NAME to save a session
- :OpenSession [NAME] to open a session / list session (without args)
- :tabnew, then :tcd NEW_PATH to create a new tab in a different folder
  - nerdtree and the tab name auto-update
- C-l to dismiss the search highlights
- C-f to toggle maximize current file
- TAB to move to the next buffer
- SHIFT TAB to move to the previous buffer
- leader q to delete all the other buffers

## On windows/wsl
- make sure to alias `fdfind` to `fd` in `.zshenv`
- install `VcXsrv` to get copy/paste across the two OSes
  - also add the following to `.zshrc`
  ```
	export EDITOR='nvim'
	export DISPLAY=$(awk '/nameserver / {print $2; exit}' /etc/resolv.conf 2>/dev/null):0
	export LIBGL_ALWAYS_INDIRECT=1

  ```

## Sample `git config --global`
```

[credential]
	helper = store
[user]
	name = NAME
	email = EMAIL
[core]
	pager = delta
[delta]
	plus-color = "#012800"
	minus-color = "#340001"
	syntax-theme = Monokai Extended
	side-by-side = true
	navigate = true
[interactive]
	diffFilter = delta --color-only
[filter "lfs"]
	clean = git-lfs clean -- %f
	smudge = git-lfs smudge -- %f
	process = git-lfs filter-process
	required = true
```
