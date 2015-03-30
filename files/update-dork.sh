#!/usr/bin/env bash

# outside of a vagrant box
if which vagrant > /dev/null; then
  current=$(basename $(pwd))
  dir=$(dirname $(pwd))
  box_path=""

  while [ $current != "source" ]
  do
    box_path="$current/$box_path"
    current=$(basename $dir)
    dir=$(dirname $dir)
  done

  box_path=${box_path%/}
  cd $dir/vagrant
  vagrant ssh -- -t "cd /var/source/$box_path && dork update"
fi

# something that runs dork itself
if which dork > /dev/null; then
  dork update
fi
