#!/bin/bash

SCRIPTDIR=$(cd $(dirname $0) && pwd)
BASEDIR=$(dirname $SCRIPTDIR)

# Files
FILE=test.txt

# $1 -> Symlink file name
# $2 -> Symlink location directory
# $3 -> Symlink target file directory
function create_symlink() {
  # Check if file exists in target
  # file directory
  if test -f "$3/$1"; then
    # Check if symbolic link exists in 
    # symlink location directory
    if test -L $2/$1; then
      # Check if symlink is pointing
      # to the expected destination
      if test $2/$1 -ef $3/$1; then
        echo "Nothing to do for $1. Symlink pointing to $3 already exists at $2."
        # Success
        return 0
      else
        # Delete wrong symlink
        rm $2/$1
      fi
    else
      # Check if an actual file exists with the
      # same name in the symlink location directory
      if test -f $2/$1; then
        # Rename original file with .bak extension
        # for backup
        mv $2/$1 $2/${1/%/.bak}
      fi
    fi
    # Create symlink
    ln -s $3/$1 $2/$1
    echo "Symlink created for $1 at $2, pointing to $3."
  else
    echo "No $1 exists in $3 to symlink to $2."
  fi
}


create_symlink $FILE $HOME $BASEDIR
