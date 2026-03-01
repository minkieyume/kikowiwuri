#!/usr/bin/env bash
cd ~/Creator/kikowiwuri
eval "$(direnv export bash)"
cd ~/Creator/kikowiwuri/yumieko
haunt build
haunt publish
