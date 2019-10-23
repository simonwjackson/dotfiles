#!/bin/env zsh

user="root"
server="144.91.83.126"
port="22" 

sshuttle --daemon --dns --remote $user@$server:$port --exclude $server 0/0
#10.231.50.14/0
#10.11.13.93/0
