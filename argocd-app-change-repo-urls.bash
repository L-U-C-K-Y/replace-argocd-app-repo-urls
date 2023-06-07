#!/bin/bash

OLD_REPO_1=
NEW_REPO_1=

OLD_REPO_2=
NEW_REPO_2=

# Dry run mode: if set to "true", the script will only print the commands without executing them
DRY_RUN="false"

# Fetch the list of apps
apps=$(argocd app list -o json | jq -r '.[].metadata.name')

for app in $apps; do
    # Get the repo URL for the app
    repo=$(argocd app get $app -o json | jq -r '.spec.source.repoURL')

    # If the repo URL matches the old URL, update it
    if [[ "$repo" == "$OLD_REPO_1" ]]; then
        echo "Updating repo for $app from $OLD_REPO_1 to $NEW_REPO_1"
        if [[ "$DRY_RUN" == "false" ]]; then
            argocd app set $app --repo $NEW_REPO_1
        else
            echo "Dry Run: argocd app set $app --repo $NEW_REPO_1"
        fi
    elif [[ "$repo" == "$OLD_REPO_2" ]]; then
        echo "Updating repo for $app from $OLD_REPO_2 to $NEW_REPO_2"
        if [[ "$DRY_RUN" == "false" ]]; then
            argocd app set $app --repo $NEW_REPO_2
        else
            echo "Dry Run: argocd app set $app --repo $NEW_REPO_2"
        fi
    fi
done
