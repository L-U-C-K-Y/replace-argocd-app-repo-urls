# ArgoCD Repository Update Script

This script automates the process of updating the repository URLs for ArgoCD applications. It is designed to work with two repository pairs (an old and new URL for each pair). If an application's repository URL matches one of the old URLs, it gets updated to the corresponding new URL.

## How To Use

1. Set the old and new repository URLs at the top of the script:

```bash
OLD_REPO_1=
NEW_REPO_1=

OLD_REPO_2=
NEW_REPO_2=
```
You need to replace the empty fields with your repository URLs.

2. Set the DRY_RUN mode. If DRY_RUN is set to "true", the script will only print the commands without executing them. This is useful for testing. If DRY_RUN is set to "false", the script will execute the commands.

```bash
DRY_RUN="false"
```

3. Run the script:

```bash
./script.sh
```

You might need to give execution permission to the script before running it:

```bash
chmod +x script.sh
```

## What It Does

The script fetches the list of all ArgoCD applications. For each application, it gets the repository URL. If the repository URL matches either `OLD_REPO_1` or `OLD_REPO_2`, the script updates it to `NEW_REPO_1` or `NEW_REPO_2` respectively.

If DRY_RUN mode is enabled, the script will print the command that would have been executed without actually performing the update.

## Requirements

The script requires `argocd` and `jq` to be installed on your machine.

- `argocd` is a command-line tool for ArgoCD that allows managing ArgoCD applications from the command line.
- `jq` is a lightweight and flexible command-line JSON processor, it's used here to parse the JSON output from `argocd`.

Please ensure you have these tools installed and you are logged in to ArgoCD before running the script.

## Caution

Please ensure that you want to perform these changes, as this script will modify the settings of your ArgoCD applications and potentially impact deployments.

Always check your variables before running the script, and consider using the DRY_RUN mode to verify the changes that would be made.