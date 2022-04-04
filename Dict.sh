#!/bin/bash

declare -A sounds
sounds[dog]="bark"
sounds[cow]="moo"
sounds[bird]="tweet"
sounds[wolf]="howl"

echo "Dog Sounds " ${sounds[dog]}
echo "All Animal sounds " ${sounds[@]}
echo "All Animals " ${!sounds[@]}
echo "Number of Animals " ${#sounds[@]}
unset sounds[dog]
echo "All Animal sounds " ${sounds[@]}
sounds[dog]="Barking"
echo "All Animal sounds " ${sounds[@]}
