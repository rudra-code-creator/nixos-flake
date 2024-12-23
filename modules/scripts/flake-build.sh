#!/usr/bin/env bash

set -euo pipefail

echo "Building and updating NixOS flake configuration..."

# Change to the nixos-config directory
cd ~/nixos-config

# Git operations
echo "Checking for changes..."
if ! git diff-index --quiet HEAD --; then
    echo "Changes detected. Committing to git..."
    git add .
    read -r -p "Enter a commit message (default: 'Update NixOS configuration'): " commit_message
    commit_message=${commit_message:-"Update NixOS configuration"}
    git commit -m "$commit_message"

    echo "Pushing changes to remote repository..."
    read -r -p "Are you sure you want to force push to master? (y/N): " confirm
    if [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]]; then
        git push origin master --force
    else
        echo "Push aborted."
    fi
else
    echo "No changes detected in git."
fi

# Rebuild NixOS
echo "Rebuilding NixOS configuration..."
sudo nixos-rebuild switch --flake "$HOME"/nixos-config --impure

echo "NixOS build and update complete!"