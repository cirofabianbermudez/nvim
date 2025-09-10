# Git/GitHub/GitLab notes

This cheat sheet is based on the following sources:

- <https://education.github.com/git-cheat-sheet-education.pdf>
- <https://training.github.com/downloads/github-git-cheat-sheet.pdf>
- <https://about.gitlab.com/images/press/git-cheat-sheet.pdf>
- <https://git-scm.com/book/en/v2>

Git is the free and open source distributed version control system that's 
responsible for everything GitHub related that happens locally on your computer.
This cheat sheet features the most important and commonly used Git commands 
for easy reference.

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

See remote information

```plain
git remote -v
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

List your branches, a \* will appear next to the currently active branch

```plain
git branch
```

Create a new branch at the current commit

```plain
git branch [branch-name]
```

Switch to another branch and check it out into your working directory

```plain
git checkout [branch-name]
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

Change the branch name, move to the branch you want to change the name

```plain
git branch -m [new-branch-name]
```

Change the branch name in remote

```plain
git branch -m [new-branch-name]
git push origin [new-branch-name]
git push origin --delete [old-branch-name]
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

Create a new SSH key pair, use meaningful names like `id_ed25519_github` and 
enter a secure passphrase.

```bash
cd ~/.ssh
ssh-keygen -t ed25519 -C "your_email@example.com"
```

Now you should have a SSH key-pair inside the `~/.ssh` directory, something 
like `id_ed25519_github` and `id_ed25519_github.pub`, your private and public 
keys.

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

Add a new submodule to your project, in the git root directory you can run

```plain
git submodule add git@github.com:username/repo_name.git path/directory/repo_name
```

Then you can run `git status` to see that new `.gitmodules` file was created

Make sure that the URL you use to add the submodule is a URL other people can 
clone

From the root directory you can run the following command to see the hash of 
the submodule

```plain
git diff --cached /path/repo_name
```

An alternative command to use with a little nicer diff output is

```plain
git diff --cached --submodule
```

For old versions of git you can use

```plain
git submodule status
```

After adding the submodule, add the `.gitsubmodule` and the subdirectory to 
the staging area, make a commit and push the changes

When cloning a project with submodules, by default you get the directories that
contain submodules, but none of the files within them yet

You must run two commands to initialize your local configuration file and to 
fetch all the data from that project and check out the appropriate commit 
listed in your superproject

```plain
git submodule init
git submodule update
```

of use the foolproof

```
git submodule update --init --recursive
```

To update the submodule go to the submodule directory and `git fetch` and
`git merge` as any other repo, then you can go back to the main project and 
run `git diff --submodule` that the module was updated, If you commit at this
point then you will lock the submodule into having the new code when other
people update.

An easier way to do this is to run the following command that will go into your
submodules and fetch and update for you

```plain
git submodule update --remote
```

By default, the `git pull` command recursively fetches submodules changes, 
however, it does not update the submodules.

Note that to be on the safe side, you should run `git submodule update` with 
the `init` flag is case the MainProject commits you just pulled added new 
submodules, and with the `recursive` flag if any submodules have nested 
submodules

If the upstream repository has changed the URL of the sibmodule in the 
`.gitmodules` file is one of the commits you pull. For example if the
submodule project changes its hosting platform, `git submodule update`
could fail. In order to remedy this situation, the `git submodule sync` 
command is required


## Configs

It is very useful to use this command to view the git root directory from 
anywhere:

```plain
git rev-parse --show-toplevel
```

You can also create an alias for this command

```plain
git config --local --replace-all alias.root "rev-parse --show-toplevel"
```

This is use to add colors if there are not activated

```plain
git config --local --replace-all color.ui true
```

## git-crypt

```bash
sudo apt-get install git-crypt
```

Inside a git repository in the root:

```bash
git-crypt init
touch .gitattributes
```

and inside `.gitattributes` put somethins like this

```plain
important.txt filter=git-crypt diff=git-crypt
.gitattributes !filter !diff
```

Add the changes:

```bash
git add .gitattributes
git commit -m "feat: add attributes to encrypt"
```

add the file you want to keep secure and then:

```bash
echo "this is important" > important.txt
git-crypt status
git-crypt status -e
git add important.txt
git commit -m "feat: add important file"
```

check how it looks with
```bash
git-crypt lock
```

## Git tags

A tag is simply a pointer to a specific commit, most often used to mark release
points. Unlike branches, tags don't move. You are permanently "bookmarking" that
commit.


### Listing tags

```bash
git tag -l
git tag -l "v1.*"
```

### Creating tags

You can create lightweight or annotated tags, the main difference is that the
fist one is just a pointer to a specific commit. Annotated tags, however, are
stored as full objects in the Git database.

```bash
# Lightweight
git tag v1.0.0

# Annotated
git tag -a v1.0.0 -m "Realse version 1.0.0"

# Annotated insert long message
git tag -a v1.0.0
```

You can list the tags with

```bash
git tag
```

You can upload the tag to the repo with

```bash
# Upload one tag
git push origin v1.0.0

# Upload all tags
git push --tags
```

You can delete a tag locally with

```bash
git tag -d v1.0.0
```

You can delete the tag in the repo with 


```bash
git push origin -d v1.0.0
```

This is the meaning of each number

| Part    | When to increment                     | Example after change |
| ------- | ------------------------------------- | -------------------- |
| `MAJOR` | Breaking changes: old code won't work | `1.0.0` → `2.0.0`    |
| `MINOR` | New features, but backward-compatible | `1.0.0` → `1.1.0`    |
| `PATCH` | Bug fixes, small changes only         | `1.0.0` → `1.0.1`    |





## Singing your commits


### 1. Generate the key

Select the following:

- Select 1 for the first option
- For key size enter 3072 or 4096
- For how long the key should last should be 2y
- For the comment put something meaningful regarding the PC

```bash
gpg --full-generate-key
```

### Seeing the keys

```bash
gpg --list-secret-keys --keyid-format=long
```

### Export the key

```bash
gpg --export --armor HZTX5CQ0Y3WCAI7V > ./gpg-key.pub
```

if you want you can export the `*.asc`

```bash
gpg --export-secret-keys --armor HZTX5CQ0Y3WCAI7V > ./gpg-key.asc
```

### Linking on GitHub

Now we need to link it to Github. To do this we need to use the result of the 
of the armor command. Copy your GPG key, beginning with 
-----BEGIN PGP PUBLIC KEY BLOCK----- and ending with -----END PGP PUBLIC KEY BLOCK-----

Go to settings in Github and then SSH and GPG Keys and create a new GPG Key. 
Insert the GPG key, including the lines that show the beginning and the end of 
the key block.

Now we need to tell Git about the GPG signing key. Using your own GPG key ID 
instead of the example one, run the line below

```bash
git config --global user.signingkey HZTX5CQ0Y3WCAI7V
```

### Enable Git sign

This step is optional but to enable Git signing:

```bash
git config --global commit.gpgsign true
```

or per repo

```bash
git config commit.gpgsign true
```

But another way is to commit using the following command:

```bash
git commit -S -m "feat: some text"
```

the `-S` is used to specify that this commit is going to be sign.

or to disable the signing use:

```bash
git commit --no-gpg-sign -m "Unsigned quick fix"
```

### Deleting a key

To deleate a key because it is old or because you forgot your password do the
following:

```bash
## To delete the private
gpg --list-secret-keys --keyid-format=long
gpg --delete-secret-keys HZTX5CQ0Y3WCAI7V

## To delete the public
gpg --list-keys --keyid-format=long
gpg --delete-keys HZTX5CQ0Y3WCAI7V
```

Then you can repeat all above steps to create other key.

https://endjin.com/blog/2022/12/how-to-sign-your-git-commits

