#!/bin/bash

main () {

  duration=$1
  suffix=${duration: -1}
  time_value=${duration::-1}
  outputfile="${duration}_countdown.mp4"

  if [[ "$suffix" == "m" ]]; then
    timer=$((time_value * 60))
  elif [[ "$suffix" == "s" ]]; then
    timer=$((time_value))
  else
    echo "Invalid duration format. Please use 'm' for minutes or 's' for seconds."
    exit 1
  fi

  timer=$(echo "$timer + 0.5" | bc)

  ffmpeg \
    -f lavfi \
    -i color=c=white:s=1920x1080:d=$timer \
    -vf "drawtext=fontsize=600:fontcolor=black:x=(w-tw)/2:y=(h-th)/2:text='%{eif\:trunc($timer-t)/60\:d\:2}\:%{eif\:(mod($timer-t,60))\:d\:2}'" \
    -t $timer \
    -c:v libx264 \
    -crf 23 \
    -pix_fmt yuv420p \
    "$outputfile"
}

main $1
