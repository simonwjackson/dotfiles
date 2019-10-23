#!/bin/env zsh

user="simonwjackson"
server="goomba.mynetgear.com"
port="9999" 

sshuttle --daemon --dns --remote $user@$server:$port --exclude $server 0/0
#10.231.50.14/0
#10.11.13.93/0
