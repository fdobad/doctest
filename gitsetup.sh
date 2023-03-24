#!/bin/env bash
git init --initial-branch=main
git remote add origin git@gitlab.com:fdobad/fire2amdocs.git
git submodule init
git submodule add --depth 1 git@github.com:alexeygumirov/pandoc-beamer-how-to.git
echo 'raw/'>.gitignore
git add .gitignore
git commit -m "Initial commit"
git push -u origin main
