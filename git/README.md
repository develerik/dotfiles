# Git

## Prerequisites

- [neovim](https://neovim.io)
- [Visual Studio Code](https://code.visualstudio.com)
- [git-lfs](https://git-lfs.github.com)
- [wabt](https://github.com/WebAssembly/wabt)

## Features

- Imports a custom configuration from `~/.config/git/config`
- Imports identities from `~/.config/git/identities`
- Imports aliasas from `~/.config/git/aliases`
- Uses NeoVim as default editor
- Does use `main` as default branch name (instead of `master`)
- Automatically prunes branches and tags on `git fetch`
- Uses rebase on `git pull` (instead of merge)
- Uses recursive submodules by default
- Simplifies the output of `git status`
- Uses colorful UI if possible
- Uses short hash in `git log` if possible
- Registers VS Code and NeoVim as external diff and merge tools (default: VS Code)
- Improves diff for `.wasm` files
- Registers some useful aliases
- **warning**: Caches credentials for 1 day

## Aliases

| Command                   | Description                                                                          |
|---------------------------|--------------------------------------------------------------------------------------|
| `git ignore <configs...>` | Creates a `.gitignore` file using `gitignore.io` templates                           |
| `git identity <identity>` | Configures `user.name`, `user.email` and `user.signingkey` according to the identity |
| `git aliases`             | Lists all available aliases                                                          |
| `git ll`                  | Shows a graph summary of the git log                                                 |
| `git publish`             | Publishes a new branch on the remote                                                 |
| `git unpublish`           | Removes a branch from the remote                                                     |
| `git branches`            | Lists all branches                                                                   |
| `git stashes`             | Lists all stashes                                                                    |
| `git tags`                | Lists all tags                                                                       |
| `git eow`                 | Stages all files, makes a wip commit and pushes the changes to the remote            |
| `git c <message>`         | Faster git commit                                                                    |
| `git cb <branch>`         | Creates a new branch and checks it out                                               |
| `git undo`                | Removes the last commit                                                              |
| `git reword <message>`    | Changes the commit message of the last commit                                        |
| `git oops [<message>]`    | Appends changes to the last commit (optionally changes the commit message)           |

