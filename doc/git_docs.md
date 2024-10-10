# Git/GitHub/GitLab notes

This cheat sheet is based on the following sources:

- <https://education.github.com/git-cheat-sheet-education.pdf>
- <https://training.github.com/downloads/github-git-cheat-sheet.pdf>
- <https://about.gitlab.com/images/press/git-cheat-sheet.pdf>
- <https://git-scm.com/book/en/v2>

Git is the free and open source distributed version control system that's responsible for everything GitHub related that happens locally on your computer. This cheat sheet features the most important and commonly used Git commands for easy reference.

- [Git/GitHub/GitLab notes](#gitgithubgitlab-notes)
  - [Setup](#setup)
  - [Init](#init)
  - [Stage and snapshot](#stage-and-snapshot)
  - [Branch and Merge](#branch-and-merge)
  - [Inspect and Compare](#inspect-and-compare)
  - [Share and Update](#share-and-update)
  - [Tracking Path Changes](#tracking-path-changes)
  - [Rewrite History](#rewrite-history)
  - [Temporary Commits](#temporary-commits)
  - [Ignoring Patterns](#ignoring-patterns)
  - [Manage multiple SSH keys](#manage-multiple-ssh-keys)
  - [Git submodules](#git-submodules)

## Setup

Configuring user information used across all local repositories

Set a name that is identifiable for credit when review version history

```plain
git config --global user.name "[username]"
```

Set an email address that will be associated with each history marker

```plain
git config --global user.email "[useremail]"
```

Set automatic command line coloring for Git for easy reviewing

```plain
git config --global color.ui auto
```

List configurations

```plain
git config --list
```

List global configurations

```plain
git config --global --list
```

Set a name and an email for a specific resporitory without changing the global
Git configurations.

```plain
git config user.name  "[username]"
git config user.email "[useremail]"
```

List local configurations

```plain
git config --local --list
```

## Init

Configuring user information, initializing and cloning repositories

Initialize an existing directory as a Git repository

```plain
git init
```

Change the branch name

```plain
git branch -M main
```

Add the remote to the project

```plain
git remote add origin git@github.com:username/repo_name.git
```

Push to the remote and set the default upstream

```plain
git push -u origin main 
```

Retrieve an entire repository from a hosted location via URL

```plain
git clone [url]
```

## Stage and snapshot

Working with snapshots and the Git staging area

Show modified files in working directory, staged for your next commit

```plain
git status
```

Add a file as it looks now to your next commit (stage)

```plain
git add [file]
```

Unstage a file while retaining the changes in working directory

```plain
git reset [file]
git reset HEAD [file]
git restore --staged [file]
```

Discard changes in the staged files

```plain
git restore [file]
```

Diff of what is changed but not staged

```plain
git diff
```

Diff of what is staged but not yet committed

```plain
git diff --staged
```

Commit your staged content as a new commit snapshot

```plain
git commit -m “[descriptive_message]”
```

## Branch and Merge

Isolating work in branches, changing context, and integrating changes

List your branches, a * will appear next to the currently active branch

```plain
git branch
```

Create a new branch at the current commit

```plain
git branch [branch-name]
```

Switch to another branch and check it out into your working directory

```plain
git checkout
```

Merge the specified branch’s history into the current one

```plain
git merge [branch]
```

Show all commits in the current branch’s history

```plain
git log
```

Delete a branch locally

```plain
git branch -d [branch-name] 
```

Delete a branch from remote

```plain
git push origin --delete [branch-name] 
```

## Inspect and Compare

Examining logs, diffs and object information

Show the commit history for the currently active branch

```plain
git log
```

Show the commits on branchA that are not on branchB

```plain
git log branchB..branchA
```

Show the commits that changed file, even across renames

```plain
git log --follow [file]
```

Show the diff of what is in branchA that is not in branchB

```plain
git diff branchB...branchA
```

Show any object in Git in human-readable format

```plain
git show [SHA]
```

## Share and Update

Retrieving updates from another repository and updating local repos

Add a git URL as an alias

```plain
git remote add [alias] [url]
```

Fetch down all the branches from that Git remote (one remote)

```plain
git fetch [alias]
```

See the changes

```plain
git diff origin/main
git diff HEAD origin/main
```

Accept the remote changes

```plain
git merge origin/main
```

Merge a remote branch into your current branch to bring it up to date

```plain
git merge [alias]/[branch]
```

Transmit local branch commits to the remote repository branch

```plain
git push [alias] [branch]
```

Fetch and merge any commits from the tracking remote branch

```plain
git pull
```

Update all remote-tracking branches for all remotes (multiple remotes)

```plain
git remote update
```

## Tracking Path Changes

Versioning file removes and path changes

Delete the file from project and stage the removal for commit

```plain
git rm [file]
```

Change an existing file path and stage the move

```plain
git mv [existing-path] [new-path]
```

Show all commit logs with indication of any paths that moved

```plain
git log --stat -M
```

## Rewrite History

Rewriting branches, updating commits and clearing history

Apply any commits of current branch ahead of specified one

```plain
git rebase [branch]
```

Clear staging area, rewrite working tree from specified commit

```plain
git reset --hard [commit]
```

Undo last commit but keep the changes in your working directory

```plain
git reset --soft HEAD~1
```

Fix last commit

```plain
git commit --amend
```

## Temporary Commits

Temporarily store modified, tracked files in order to change branches

Save modified and staged changes

```plain
git stash
```

Save modified and staged changes and also untracked

```plain
git stash -u
```

List stack-order of stashed file changes

```plain
git stash list
```

Write working from top of stash stack

```plain
git stash pop
```

Write working from top of stash stack but and keep it in stash

```plain
git stash apply
```

Write working from top of stash stack but and keep it in stash specific

```plain
git stash apply [stash@{0}]
```

Discard the changes from top of stash stack

```plain
git stash drop
```

Discard all stashes

```plain
git stash clear
```

## Ignoring Patterns

Preventing unintentional staging or commiting of files

System wide ignore pattern for all local repositories

```plain
git config --global core.excludesfile [file]
```

```plain
logs/
*.notes
pattern*/
```

Save a file with desired patterns as .gitignore with either direct string
matches or wildcard globs.

Use `.gitkeep` to add empty directories in git

## Manage multiple SSH keys

Create, configure and manage SSH keys

Create a new SSH key pair, use meaningful names like `id_ed25519_github` and enter a
secure passphrase.

```bash
cd ~/.ssh
ssh-keygen -t ed25519 -C "your_email@example.com"
```

Now you should have a SSH key-pair inside the `~/.ssh` directory, something like `id_ed25519_github` and `id_ed25519_github.pub`, your private and public keys.

Create a `~/.ssh/config` file

```bash
cd ~/.ssh
touch config
```

and write a configuration similar to the following example:

```plain
# GitHub account
Host github.com
  Hostname github.com
  PreferredAuthentications publickey
  IdentityFile ~/.ssh/id_ed25519_github

# GitLab account
  Host gitlab.com
  Hostname gitlab.com
  PreferredAuthentications publickey
  IdentityFile ~/.ssh/id_ed25519_gitlab
```

Test the configuration

```bash
ssh -T git@github.com
git clone git@github.com:username/dummy_repository_github.git
```

For multiple GitHub accounts

```plain
# GitHub account
Host personal-github.com
  Hostname github.com
  PreferredAuthentications publickey
  IdentityFile ~/.ssh/id_ed25519_github_personal

# GitLab account
Host github.com
  Hostname github.com
  PreferredAuthentications publickey
  IdentityFile ~/.ssh/id_ed25519_github_work
```

When cloning ajust the command

```plain
git clone git@personal-gitub.com:username/dummy_repository_github.git
```

## Git submodules

Manage big projects using git submodules

Add a new submodule to your project, in the git root directory

```plain
git submodule add git@github.com:username/repo_name.git path/directory/reponame
```