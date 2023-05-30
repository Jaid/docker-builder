#!/bin/bash
set -o errexit -o pipefail

declare -r -a sleepTimes=(
  0.1
  0.5
  2
  10
  60
)
declare -r -i sleepTimesCount=${#sleepTimes[@]}
declare -r -i retries=${retries:-$sleepTimesCount}
declare -i nanosExecuted=0
declare -i nanosSlept=0
declare -i i=0
while true; do
  declare -i currentNanos
  currentNanos=$(date +%s%N)
  "$@" && break
  declare -i currentNanosExecuted
  currentNanosExecuted=$(date +%s%N)
  nanosExecuted=$((currentNanosExecuted - currentNanos + nanosExecuted))
  declare bashIndex=$i
  if [[ $bashIndex -gt "$sleepTimesCount" ]]; then
    fullSleep=${sleepTimes[$sleepTimesCount]} # Already capped at highest sleep time, repeating that one
  else
    fullSleep=${sleepTimes[$bashIndex]}
  fi
  # shellcheck disable=SC2154
  printf "Try %s returned code %s, retrying %s in %.1fs" $bashIndex $? "$1" "$fullSleep"
  declare thirdSleep
  thirdSleep=$(awk "BEGIN {print $fullSleep/3}")
  sleep "$thirdSleep"
  printf '.'
  sleep "$thirdSleep"
  printf '.'
  sleep "$thirdSleep"
  printf '.\n'
  declare -i i=$((i + 1))
  nanosSlept=$(awk "BEGIN {print $fullSleep * 1000000000 + $nanosSlept}")
  if [[ $i -eq "$retries" ]]; then
    declare -r secondsSlept=$((nanosSlept / 1000000000))
    declare -r secondsExecuted=$((nanosExecuted / 1000000000))
    printf "Giving up! Ran executions for %.2fs and slept for %.1fs.\n" "$secondsExecuted" "$secondsSlept"
    break
  fi
done
