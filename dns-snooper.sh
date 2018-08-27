#!/bin/bash
echo "Created by GrzechuG alias BlueHat139"
if [[ -z "$2" ]]; then
    echo "Usage: ./dns-snooper.sh <dns server adress> <file with domain names to check>"
    exit
fi
echo "">log.txt
for line in $(cat "$2");do
 answer=$(dig @$1 $line A +norecurse)
 if [[ $answer == *";; ANSWER SECTION:"* ]];then
    echo [+] $line is cached!
    echo $line>>log.txt
 else
    echo [-] $line is not cached
 fi
done
