#!/bin/bash
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'
clear
i=0

read -p "--> Enter session name: " session
if [ "$session" == "" ]; then
session=$(date '+%d.%m.%Y')
fi
mkdir -p ~/Desktop/MP3s/"$session"

clear
echo -e "--> Download from web to MP3 320K."
echo -e "--> ${RED}FFMPEG ${NC}and ${RED}YOUTUBE-DL${NC} are required."
echo -e "--> Press ${BLUE}CTRL+C${NC} anytime to stop." 
echo -e "--> MP3's are saved at ${GREEN}~/Desktop/MP3s/${NC}"
echo
echo -e "--> Session name: ${BLUE}$session${NC}."
echo

while true; do
i=$[$i+1]
read -p "-> Enter URL: " URL
echo -e "${RED}-> $(youtube-dl -e $URL)${NC}"
echo "-> Downloading..."
youtube-dl --quiet -x --audio-format mp3 --audio-quality 320K -o "~/Desktop/MP3s/$session/%(title)s.%(ext)s" "$URL"
echo "-> $i song/s downloaded! "
done
