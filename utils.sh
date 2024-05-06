#!/bin/sh
function prompt_yes_no(){
while true; do
  echo $1
  read -p "(y/n)> " yn

  case $yn in 
  	yes ) return 0;;
   y ) return 0;;
	  no ) return 1;;
    n ) return 1;;
    '' ) return 1;;
	  * ) echo invalid response;;
  esac
  
  done
}

function set_install_flag(){
  flag_name=$1
  if prompt_yes_no "configure $1?"; then
    eval "$flag_name=\"1\""
  else
    eval "$flag_name=\"0\""
  fi
}
