# Bash scripting

${VAR:-default}	Use default if VAR is unset or empty
${VAR:?error}	Exit with error if VAR is unset or empty


-z True if the string is empty


| Option            | Meaning                                               |
| ----------------- | ----------------------------------------------------- |
| `set -e`          | Exit immediately if a command fails                   |
| `set -u`          | Treat unset variables as errors                       |
| `set -o pipefail` | A pipeline fails if any command in the pipeline fails |



| Test      | Meaning                      |
| --------- | ---------------------------- |
| `-d file` | exists and is a directory    |
| `-f file` | exists and is a regular file |
| `-e file` | exists                       |
| `-r file` | readable                     |
| `-w file` | writable                     |
| `-x file` | executable                   |
| `-s file` | exists and not empty         |
