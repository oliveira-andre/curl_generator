#!/bin/bash

echo "wellcome to curl generator"

read -p 'Enter your url (without transfer protocol): ' url

protocol_options=("http" "https")

select selected_protocol in "${protocol_options[@]}"; do
  case $selected_protocol in
    "http" | "https")
      protocol="$selected_protocol://"
      break
      ;;
    *) echo "invalid option $REPLY";;
  esac
done

method_options=("GET" "POST" "PUT" "DELETE")

select selected_method in "${method_options[@]}"; do
  case $selected_method in
    "GET" | "POST" | "PUT" | "DELETE")
      http_method="-X '$selected_method'"
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

echo "curl $http_method $headers '$protocol$url' | jq"
