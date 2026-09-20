#!/bin/bash
# source https://jia.je/ctf-writeups/misc/pyjail.html
export SSHPASS="s5cAhoAfNT9GrgqykhZavyBg9"
sshpass -e ssh level09@127.0.0.1 -p 4242 < exploit.sh
