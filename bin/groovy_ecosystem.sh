#!/usr/bin/env bash
#
# Installs gvm, groovy, and friends
#

## Install GVM if not present
if [ ! -e "~/.gvm" ]; then
  echo "Installing gvm..."
  curl get.gvmtool.net | bash
  source $HOME/.gvm/bin/gvm-init.sh
fi

## Stay Current
gvm selfupdate force

## Latest Everything
echo 'Y' | gvm i groovy
echo 'Y' | gvm i groovyserv
echo 'Y' | gvm i gradle
echo 'Y' | gvm i grails
echo 'Y' | gvm i lazybones
echo 'Y' | gvm i springboot
echo 'Y' | gvm i vertx
echo 'Y' | gvm i griffon
echo 'Y' | gvm i glide

