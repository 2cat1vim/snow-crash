#!/bin/bash
# source https://jia.je/ctf-writeups/misc/pyjail.html
export SSHPASS="viuaaale9huek52boumoomioc"
sshpass -e ssh level06@127.0.0.1 -p 4242 < exploit.sh
