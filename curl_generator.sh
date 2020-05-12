#!/bin/bash

echo "wellcome to curl generator"

read -p 'Enter your url (without transfer protocol): ' url

protocols=("http" "https")

select protocol in "${protocols[@]}"; do
  case $protocol in
    "http" | "https")
      protocol="$protocol://"
      break
      ;;
    *) echo "invalid option $REPLY";;
  esac
done

read -p 'Enter how many headers: ' n_headers

header_options=("Bearer Authorization" "Authorization" "Content-Type: application/json" "Custom Header")
headers=()

for n in $(seq 1 $n_headers); do
  select selected_header in "${header_options[@]}"; do
    case $selected_header in
      "Bearer Authorization")
        read -p "Enter the value of Bearer Token Authorization " header_value
        headers+=" -H 'Authorization: Bearer $header_value'"
        break
        ;;
      "Authorization")
        read -p 'Enter the value of Token Authorization ' header_value
        headers+=" -H 'Authorization: $header_value'"
        break
        ;;
      "Content-Type: application/json")
        headers+=" -H '$selected_header'"
        break
        ;;
      "Custom Header")
        read -p 'Enter the header and value (Custom: Header) ' header_value
        headers+=" -H '$selected_header'"
        break
        ;;
      *) echo "invalid option $REPLY";;
    esac
  done
done

echo "curl $headers '$protocol$url' | jq"
