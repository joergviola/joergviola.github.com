---
layout: post
title: "Don't use amend with heroku"
date: 2012-05-27 13:11
comments: true
categories: Git Heroku
---
I forgot to add a new file in a git commit (since I did not refresh my eclipse workspace).
That caused a little surprise on the next release.

<!-- more -->

When trying to release to heroku the next time, I was told:
``` bash
$ git push test master
To git@heroku.com:test-66and33.git
 ! [rejected]        master -> master (non-fast-forward)
error: failed to push some refs to 'git@heroku.com:test-66and33.git'
To prevent you from losing history, non-fast-forward updates were rejected
Merge the remote changes (e.g. 'git pull') before pushing again.  See the
'Note about fast-forwards' section of 'git push --help' for details.
```

I learned from [Stackoverflow](http://stackoverflow.com/questions/3968281/git-pushing-amended-commits)
that after amending a commit, you have to force the next push:
``` bash
$ git push test master --force
```

Conclusion from SO: Don't amend!
