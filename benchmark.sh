#!/usr/bin/env bash

sudo cpupower frequency-set --governor performance
build/bin/bench
sudo cpupower frequency-set --governor powersave
