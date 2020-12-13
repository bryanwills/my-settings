#!/bin/bash
input="input.mp4"
output="output.mp4"
color="black"
while getopts ":i:o:w:h:c:" opt; do
  case $opt in
    i) input="$OPTARG"
    ;;
    o) output="$OPTARG"
    ;;
    w) width="$OPTARG"
    ;;
    h) height="$OPTARG"
    ;;
    c) color="$OPTARG"
    ;;
    \?) echo "Invalid option -$OPTARG" >&2
    ;;
  esac
done

ffmpeg -i $input -vf "scale=w=${width}:h=${height}:force_original_aspect_ratio=decrease,pad=${width}:${height}:(ow-iw)/2:(oh-ih)/2:color=${color}" $output
