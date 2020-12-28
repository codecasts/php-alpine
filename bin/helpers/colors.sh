#!/usr/bin/env bash

# Source: https://bytefreaks.net/gnulinux/bash/cecho-a-function-to-print-using-different-colors-in-bash

# The following function prints a text using custom color
# -c or --color define the color for the print. See the array colors for the available options.
# -n or --noline directs the system not to print a new line after the content.
# Last argument is the message to be printed.
cecho () {

    declare -A colors;
    colors=(\
        ['black']='\E[0;47m'\
        ['red']='\E[0;31m'\
        ['green']='\E[0;92m'\
        ['yellow']='\E[0;33m'\
        ['blue']='\E[0;34m'\
        ['magenta']='\E[0;35m'\
        ['cyan']='\E[0;36m'\
        ['white']='\E[0;37m'\
    );

    local defaultMSG="No message passed.";
    local defaultColor="black";
    local defaultNewLine=true;

    while [[ $# -gt 1 ]];
    do
    key="$1";

    case $key in
        -c|--color)
            color="$2";
            shift;
        ;;
        -n|--noline)
            newLine=false;
        ;;
        *)
            # unknown option
        ;;
    esac
    shift;
    done

    message=${1:-$defaultMSG};   # Defaults to default message.
    color=${color:-$defaultColor};   # Defaults to default color, if not specified.
    newLine=${newLine:-$defaultNewLine};

    echo -en "${colors[$color]}";
    echo -en "$message";
    if [ "$newLine" = true ] ; then
        echo;
    fi
    tput sgr0; #  Reset text attributes to normal without clearing screen.

    return;
}

warning () {
  cecho -n -c 'yellow' "\n=== ";
  cecho -n -c 'white' "$1 ";
  cecho -c 'yellow' "$2\n";
}

error () {
  cecho -n -c 'red' "\n=== ";
  cecho -n -c 'white' "$1 ";
  cecho -c 'red' "$2\n";
}

information () {
  cecho -n -c 'cyan' "\n=== ";
  cecho -n -c 'white' "$1 ";
  cecho -c 'cyan' "$2\n";
}

success () {
  cecho -n -c 'green' "\n=== ";
  cecho -n -c 'white' "$1 ";
  cecho -c 'green' "$2\n";
}
