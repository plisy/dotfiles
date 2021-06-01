#!/bin/sh

git config --global push.default current
git config --global pull.rebase true
git config --global rebase.autoStash true
git config --global format.pretty oneline
git config --global init.defaultBranch main
