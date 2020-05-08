#!/bin/sh

read foo
desc=$(echo $foo | jq '.description')

function set_project () {
  foo=$(echo $foo | jq ".project |= \"$@\"")
}

function append_tag () {
  foo=$(echo $foo | jq ".tags |= . + [\"$@\"]")
}

if $(echo $desc | grep -q vim); then
  append_tag vim
  set_project workflow
fi

if $(echo $desc | grep -q tmux); then
  set_project workflow
  append_tag tmux
fi

if $(echo $desc | grep -q watch); then
  set_project workflow
  append_tag watch
fi

if $(echo $desc | grep -q buy); then
  append_tag shopping
fi

if $(echo $desc | grep -q amazon); then
  append_tag shopping
fi

if $(echo $desc | grep -q sell); then
  append_tag sell
fi

if $(echo $desc | grep -q research); then 
  append_tag research
fi

if $(echo $desc | grep -q brainstorm); then 
  append_tag research
fi

if $(echo $desc | grep -q workflow); then 
  set_project workflow
fi

if $(echo $desc | grep -q write); then 
  append_tag writing
fi

if $(echo $desc | grep -q article); then 
  append_tag reading
fi

echo "$foo" | jq --compact-output
