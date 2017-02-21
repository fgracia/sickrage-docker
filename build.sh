#!/bin/bash

if [ -d tmp ] ; then
  rm -rf tmp
fi

git clone https://github.com/SickRage/SickRage.git tmp

docker build -t fgracia/sickrage .

rm -rf tmp
