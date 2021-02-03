#!/bin/bash

clock_value="0"

# this generates pseudo random values that are added to each byte
setclock() {
  message_length="$1"

  clock_interval=$(echo "$message_length"*4 | bc -l)
  max_clock_value=$(echo "$message_length"*25 | bc -l)

  clock_value=$(($clock_interval + $clock_value))

  if [[ $clock_value -gt $max_clock_value ]]; then
    clock_value=$(($clock_value - $max_clock_value))
  fi
}

encrypt() {
  to_encrypt="$1"

  encrypted_message=""

  for (( i=0; i<"${#to_encrypt}"; i++ )); do
    setclock "${#to_encrypt}"

    char="${to_encrypt:$i:1}"
    lc_ctype=c byte=$(printf "%d" "'$char")

    encrypted_message+="$(($byte + $clock_value)) "

  done

  result=$(echo -n "$encrypted_message" | base64 -w 0)
  echo "$result"
}

decrypt() {
  to_decrypt=$(echo -n "$1" | base64 --decode)

  decrypted_message=""

  for obfuscated_byte in $to_decrypt; do
    setclock "$(echo "$to_decrypt" | wc -w)"

    byte="$(($obfuscated_byte - $clock_value))"

    printf "\x$(printf %x $byte)"
  done
}

if [[ "$1" == "--decode" ]] || [[ "$1" == "-d" ]]; then
  decrypt "$2"
else
  encrypt "'$1'"
fi
