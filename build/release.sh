#!/usr/bin/env sh

git checkout master
git merge dev

read -p "Releasing - are you sure? (y/n)" -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]   # =~ regular expression match
then
  echo "Releasing..."

  # commit
  git add -A
  git commit -m "[build]"
  
  # push
  git push origin master
  git checkout dev
  git rebase master
  git push origin dev
fi
