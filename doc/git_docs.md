Note:
  This cheat sheet is based on the following sources:
  https://education.github.com/git-cheat-sheet-education.pdf
  https://training.github.com/downloads/github-git-cheat-sheet.pdf
  https://git-scm.com/book/en/v2

Git is the free and open source distributed version control system that's responsible for everything GitHub related that happens locally on your computer. This cheat sheet features the most important and commonly used Git commands for easy reference.

Setup: 
 Configuring user information used across all local repositories 

Set a name that is identifiable for credit when review version history
```bash
git config --global user.name "[username]"
```

Set an email address that will be associated with each history marker
```bash
git config --global user.email "[username]"
```

Set automatic command line coloring for Git for easy reviewing
```bash
git config --global color.ui auto
```

Set automatic command line coloring for Git for easy reviewing
```bash
git config --global color.ui auto
```

List configurations
```
git config --list
```

Init:
Configuring user information, initializing and cloning repositories

Initialize an existing directory as a Git repository
```bash
git init
```

Change the branch name
```bash
git branch -M main
```

Add the remote to the project
```bash
git remote add origin git@github.com:username/repo_name.git
```

Push to the remote and set the default upstream
```bash
git push -u origin main 
```

Retrieve an entire repository from a hosted location via URL
```bash
git clone [url]
```


Stage and snapshot:                                    *git.cheat.snapshot*
  Working with snapshots and the Git staging area

  Show modified files in working directory, staged for your next commit >
    git status
<
  Add a file as it looks now to your next commit (stage) >
    git add [file]
<
  Unstage a file while retaining the changes in working directory >
    git reset [file]
    git reset HEAD [file]
    git restore --staged [file]
<
  Diff of what is changed but not staged >
    git diff
<
  Diff of what is staged but not yet committed >
    git diff --staged
<
  Commit your staged content as a new commit snapshot >
    git commit -m “[descriptive_message]”
<

Branch and Merge:                                *git.cheat.branch*
  Isolating work in branches, changing context, and integrating changes

  List your branches, a * will appear next to the currently active branch >
    git branch
<
  Create a new branch at the current commit >
    git branch [branch-name]
<
  Switch to another branch and check it out into your working directory >
    git checkout
<
  Merge the specified branch’s history into the current one >
    git merge [branch]
<
  Show all commits in the current branch’s history >
    git log
<
  Delete a branch locally >
    git branch -d [branch-name] 
<
  Delete a branch from remote >
    git push origin --delete [branch-name] 
<

Inspect and Compare:                             *git.cheat.inspect*
  Examining logs, diffs and object information

  Show the commit history for the currently active branch >
    git log
<
  Show the commits on branchA that are not on branchB >
    git log branchB..branchA
<
  Show the commits that changed file, even across renames >
    git log --follow [file]
<
  Show the diff of what is in branchA that is not in branchB >
    git diff branchB...branchA
<
  Show any object in Git in human-readable format >
    git show [SHA]
<

Share and Update:                                  *git.cheat.update*
  Retrieving updates from another repository and updating local repos

  Add a git URL as an alias >
    git remote add [alias] [url]
<
  Fetch down all the branches from that Git remote (one remote) >
    git fetch [alias]
<
  See the changes >
    git diff origin/main
    git diff HEAD origin/main
<
  Accept the remote changes >
    git merge origin/main
<
  Merge a remote branch into your current branch to bring it up to date >
    git merge [alias]/[branch]
<
  Transmit local branch commits to the remote repository branch >
    git push [alias] [branch]
<
  Fetch and merge any commits from the tracking remote branch >
    git pull
<
  Update all remote-tracking branches for all remotes (multiple remotes) >
    git remote update
<

Tracking Path Changes:                             *git.cheat.tracking*
  Versioning file removes and path changes

  Delete the file from project and stage the removal for commit >
    git rm [file]
<
  Change an existing file path and stage the move >
    git mv [existing-path] [new-path]
<
  Show all commit logs with indication of any paths that moved >
    git log --stat -M
<

Rewrite History:                                    *git.cheat.history*
  Rewriting branches, updating commits and clearing history

  Apply any commits of current branch ahead of specified one >
    git rebase [branch]
<
  Clear staging area, rewrite working tree from specified commit >
    git reset --hard [commit]
<
  Undo last commit but keep the changes in your working directory >
    git reset --soft HEAD~1
<
  Fix last commit >
    git commit --amend
<

Temporary Commits:                                *git.cheat.temporary*
  Temporarily store modified, tracked files in order to change branches

  Save modified and staged changes >
    git stash
<
  Save modified and staged changes and also untracked >
    git stash -u
<
  List stack-order of stashed file changes >
    git stash list
<
  Write working from top of stash stack >
    git stash pop
<
  Write working from top of stash stack but and keep it in stash >
    git stash apply
<
  Write working from top of stash stack but and keep it in stash specific >
    git stash apply [stash@{0}]
<
  Discard the changes from top of stash stack >
    git stash drop
<
  Discard all stashes >
    git stash clear
<

Ignoring Patterns:                             *git.cheat.ignore*
  Preventing unintentional staging or commiting of files

  System wide ignore pattern for all local repositories >
    git config --global core.excludesfile [file]
<
      logs/
      *.notes
      pattern*/

  Save a file with desired patterns as .gitignore with either direct string
  matches or wildcard globs.

  Use `.gitkeep` to add empty directories in git

Manage multiple SSH keys                         *git.cheat.ssh*
  Create, configure and manage SSH keys

  Create a new SSH key pair, use meaningful names like `id_ed25519_github` >
    cd ~/.ssh
    ssh-keygen -t ed25519 -C "your_email@example.com"
<
  Create a `~/.ssh/config` file >
    cd ~/.ssh
    touch config
<
  Configuration example >
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
<
  Test the configuration >
    ssh -T git@github.com
    git clone git@github.com:username/dummy_repository_github.git
<
  For multiple GitHub accounts >
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
<
  When cloning ajust the command >
    git clone git@personal-gitub.com:username/dummy_repository_github.git
<
Git submodules                                   *git.cheat.submodules*
  Manage big projects using git submodules

  Add a new submodule to your project, in the git root directory >
    git submodule add git@github.com:username/repo_name.git path/directory/reponame
<

Note:
  Create the tags file using `:helptags ../doc`

===================================================================================================
vim:tw=100:ts=2:ft=help:norl:syntax=help:
