#!/bin/bash

echo "wellcome to curl generator"

read -p 'Enter your url (without transfer protocol): ' url

protocols=("http" "https")

select protocol in "${protocols[@]}"
do
  case $protocol in
    "http" | "https")
      protocol="$protocol://"
      break
      ;;
    *) echo "invalid option $REPLY";;
  esac
done

read -p 'Enter how many headers: ' n_headers

for n in $(seq 1 $n_headers); do
  echo "safe"
done

echo "curl '$protocol$url' | jq"
