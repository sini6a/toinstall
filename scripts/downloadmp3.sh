#!/bin/bash
RED='\e[31m'
GREEN='\e[32m'
BLUE='\e[34m'
NC='\e[0m'
clear

i=0
LOCATION="$HOME/Desktop/MP3s/"

read -p '-> Enter session name: ' SESSION
if [ "$SESSION" == "" ]; then
session=$(date '+%d.%m.%Y')
fi
mkdir -p "$LOCATION""$SESSION"

main_prompt() {
clear
echo -e "--> Download from web to MP3 320K."
echo -e "--> ${RED}FFMPEG ${NC}and ${RED}YOUTUBE-DL${NC} are required."
echo -e "--> Press ${BLUE}CTRL+C${NC} anytime to stop." 
echo -e "--> MP3's are saved at ${GREEN}$LOCATION$SESSION${NC}"
echo
echo -e "--> ${GREEN}$playlist_items${NC} item(s) in playlist! "
echo
}

while true; do
playlist_items="$(cat $LOCATION$SESSION/$SESSION.txt | wc -l)"
main_prompt
read -p '-> Enter URL: ' URL
echo -e "--> Loading, please wait ..."

if [ "$URL" == "ls" ]; then
echo -e "${GREEN}$(cat $LOCATION$SESSION/$SESSION.txt)${NC}" | more
echo
read -n 1 -s -r -p "-> Press any key to continue"
else
youtube-dl -e --quiet --ignore-errors "$URL" >> ~/.mp3tmp
cat ~/.mp3tmp >> "$LOCATION$SESSION/$SESSION.txt"
num_of_items="$(cat ~/.mp3tmp | wc -l)"

echo
echo -e "${GREEN}$(cat ~/.mp3tmp)${NC}"
echo

echo "--> Downloading $(cat ~/.mp3tmp | wc -l) item(s) ..."
rm ~/.mp3tmp
youtube-dl --quiet --ignore-errors -x --audio-format mp3 --audio-quality 320K -o "$LOCATION$SESSION/%(title)s.%(ext)s" "$URL"
sleep 0.5
fi
done
