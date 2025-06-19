#!/bin/bash

echo "==== $0"
date > $HOME/work/`date +%s`
grep . $HOME/work/*
echo "==== $0"