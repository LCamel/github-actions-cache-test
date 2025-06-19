#!/bin/bash

echo "==== $0"
ls -l $HOME/.stack
date > $HOME/.stack/`date +%s`
grep . $HOME/.stack/* /dev/null
echo "==== $0"