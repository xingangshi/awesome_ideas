 git branch -a | grep 2_2_10 | sed "s/remotes\/origin\///g" | xargs git checkout

 svn status | grep "?" | sed "s/? //g" | awk '{print $1}' | xargs svn add
