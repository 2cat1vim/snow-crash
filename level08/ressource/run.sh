#!/bin/bash
# source https://jia.je/ctf-writeups/misc/pyjail.html
export SSHPASS="fiumuikeil8rung8ahcuiperb"
sshpass -e ssh level08@127.0.0.1 -p 4242 < exploit.sh
