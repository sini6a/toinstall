#!/bin/bash
RED='\e[31m'
GREEN='\e[32m'
BLUE='\e[34m'
NC='\e[0m'
clear
i=0

read -p '-> Enter session name: ' session
if [ "$session" == "" ]; then
session=$(date '+%d.%m.%Y')
fi
mkdir -p ~/Desktop/MP3s/"$session"

main_prompt() {
clear
echo -e "--> Download from web to MP3 320K."
echo -e "--> ${RED}FFMPEG ${NC}and ${RED}YOUTUBE-DL${NC} are required."
echo -e "--> Press ${BLUE}CTRL+C${NC} anytime to stop." 
echo -e "--> MP3's are saved at ${GREEN}~/Desktop/MP3s/$session${NC}"
echo
#echo -e "--> Session name: ${BLUE}$session${NC}."
echo -e "--> ${GREEN}$i${NC} item(s) downloaded! "
echo
}

while true; do
main_prompt
read -p '-> Enter URL: ' URL
echo -e "--> Loading, please wait ..."

youtube-dl -e --quiet --ignore-errors "$URL" >> ~/.mp3tmp
num_of_items="$(cat ~/.mp3tmp | wc -l)"
i="$(($i+$num_of_items))"

echo
echo -e "${GREEN}$(cat ~/.mp3tmp)${NC}"
echo

echo "--> Downloading $(cat ~/.mp3tmp | wc -l) item(s) ..."
youtube-dl -s --quiet --ignore-errors -x --audio-format mp3 --audio-quality 320K -o "~/Desktop/MP3s/$session/%(title)s.%(ext)s" "$URL"
sleep 3
rm ~/.mp3tmp
done
