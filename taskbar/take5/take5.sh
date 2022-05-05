#!/bin/sh
# <bitbar.title>Death Clock</bitbar.title>
# <bitbar.version>v1.1</bitbar.version>
# <bitbar.author>Sven Balnojan</bitbar.author>
# <bitbar.author.github>sbalnojan</bitbar.author.github>
# <bitbar.desc>Shows time left to live.</bitbar.desc>
# <bitbar.dependencies></bitbar.dependencies>

# Dependencies:

# $1...today
# $2...death day
# Examples:
# ...
#

#! /bin/bash
TOTAL_TIME=3600
SLEEP_TIME=900
end=$((SECONDS+$TOTAL_TIME))
breaths=0
LOG_FILE="take5_log.txt"

function echo_dots() {
  echo -e "and....\c"
  sleep 1
  echo -e "in\c"
  sleep 1
  echo -e ".\c"
  sleep 1
  echo -e ".\c"
  sleep 1
  echo -e "."
  sleep 1
  echo -e "and...\c"
  sleep 1
  echo -e "out\c"
  sleep 1
  echo -e ".\c"
  sleep 1
  echo -e ".\c"
  sleep 1
  echo -e ".\c"
  sleep 1
  echo -e "."
  sleep 1
}

function capture_state_of_mind() {
  # fullname="USER INPUT"
  echo "now rate your state of mind (1-5) ..."
read -p "state of mind: " mind_state
echo "you rated ${mind_state}"
}

function write_to_log() {
  echo "timestamp: ${timestamp} - state of mind: ${mind_state}\n" >> ${LOG_FILE}
}

function param_main {
  local today=$1
  local death_day=$2
}

function main {
  echo "Cheers to the impatient meditator"
  seconds=$(cut -d '.' -f1 /proc/uptime)
  # Do what you want.
  echo "Now? (The beep was me...)"
  #tput bel
  read -n 1 -p "Take another 5 deep breaths???";
  echo "1."
  echo_dots
  echo "2.."
  echo_dots
  echo "3..."
  echo_dots
  echo "see you in ${SLEEP_TIME} seconds"
  breaths=$(($breaths +1))
  timestamp=$(date +%F_%T)
  echo "you just took the ${breaths}th deep breath at ${timestamp}"
  capture_state_of_mind
  echo "see you in ${SLEEP_TIME} seconds..."
  write_to_log
  sleep $SLEEP_TIME

}

main "$@"
