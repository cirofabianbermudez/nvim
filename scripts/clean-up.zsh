

brew cleanup --prune=all -s -n



Component	Meaning	Function
brew	Homebrew	Executes the Homebrew package manager
cleanup	Cleanup operation	Finds outdated installations and removable cached files
--prune=all	Remove all eligible cache files regardless of age	Disables the normal age-based retention period
-s	--scrub	Includes cached downloads even when they are associated with installed packages
-n	--dry-run	Simulates the operation without deleting anything


brew cleanup --prune=all -s
