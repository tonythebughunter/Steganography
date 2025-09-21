#!/bin/bash
# steghide brute-force script
# Usage: ./bruteforce_steghide.sh <imagefile> <wordlist>

if [ $# -ne 2 ]; then
  echo "Usage: $0 <stego-file> <wordlist>"
  exit 1
fi

FILE="$1"
WORDLIST="$2"

if [ ! -f "$FILE" ]; then
  echo "[-] Error: File '$FILE' not found."
  exit 1
fi

if [ ! -f "$WORDLIST" ]; then
  echo "[-] Error: Wordlist '$WORDLIST' not found."
  exit 1
fi

echo "[*] Starting brute force on '$FILE' with wordlist '$WORDLIST'..."
while IFS= read -r password; do
  steghide extract -sf "$FILE" -p "$password" -xf output.txt &>/dev/null
  if [ $? -eq 0 ]; then
    echo "[+] Password found: $password"
    echo "[+] Extracted file saved as output.txt"
    cat output.txt
    exit 0
  fi
done < "$WORDLIST"

echo "[-] No password found in '$WORDLIST'"
exit 1
