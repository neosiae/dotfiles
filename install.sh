#!/bin/bash

# dotfiles installer

FROM=`pwd`
TO=$HOME

# $1 from
# $2 to
# $3 sudo
function linkFile() {
  filename=$(basename $1)
  if [ -f "$2/$filename" ]; then
    $3 rm "$2/$filename"
    $3 ln -sv $1 $2 
  else
    $3 ln -sv $1 $2 
  fi
}

# $1 from
# $2 to
function linkFolder() {
  foldername=$(basename $1)
  if [ -d "$2/$foldername" ]; then
    rm -rf "$2/$foldername"
    ln -sv $1 $2
  else
    ln -sv $1 $2
  fi
}

# $HOME
function toHome() {
  shopt -s dotglob
  for filepath in $FROM/*; do
    if [ -f $filepath ]; then
      linkFile $filepath $TO
    fi
  done
  shopt -u dotglob
}

# $HOME/.config
function toConfig() {
  for dirpath in $FROM/config/*; do 
    if [ -d $dirpath ]; then
      linkFolder $dirpath "$TO/.config"
    fi
  done
}

# $HOME/bin
function toBin() {
  for filepath in $FROM/bin/*; do
    chmod +x $filepath
    if [ -f $filepath ]; then
      linkFile $filepath "$TO/bin" sudo
    fi
  done
}

# $HOME/scripts
function toScripts() {
  linkFolder $FROM/scripts $TO
}

function install() {
  echo -e "\n****** $HOME ******\n"
  toHome
  echo -e "\n****** $HOME/.config ******\n"
  toConfig
  echo -e "\n****** $HOME/bin ******\n"
  toBin
  echo -e "\n****** $HOME/scripts ******\n"
  toScripts
}

install
