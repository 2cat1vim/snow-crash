#!/bin/bash
# source https://jia.je/ctf-writeups/misc/pyjail.html
export SSHPASS="wizelohxamaiuiia2uinaes4a"
sshpass -e ssh level07@127.0.0.1 -p 4242 < exploit.sh
