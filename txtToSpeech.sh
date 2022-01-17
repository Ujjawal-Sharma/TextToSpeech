#!/bin/bash
# Note: 
# 1) run sh textToSpeech.sh in terminal
# 2) Usable prompts will be in prompts folder.

prompt_names=(
    "playHoliday"
    "playNonOfficeHour"
    "playWelcome"
    "playBusy"
)
prompt_content=(
    "Dear Customer, Your call lands on Holiday, Please call us during Non-Holidays"
    "Sorry you have called us on Holiday. Please call us during working hours"
    "Welcome to Cyllid Technologies Private Ltd"
    "Please be on call as our CCE are busy right now and we will assist you soon"
)
for i in "${!prompt_names[@]}"; do
    # change '_new' with the file name you want to append
    echo "${prompt_content[i]}" > temp.txt
    text2wave temp.txt -o "${prompt_names[i]}".wav
    sox -v 0.7 "${prompt_names[i]}".wav -r 8000 -b 16 -c 1 -t wav prompts/"${prompt_names[i]}".wav
    rm "${prompt_names[i]}".wav
done
